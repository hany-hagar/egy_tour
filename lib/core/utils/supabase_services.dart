import 'dart:developer';
import 'dart:io';
import 'package:egy_tour/const/api_end_points.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class SupabaseServices {
  static Supabase? _supabase;
  static init() async {
    try {
      await Supabase.initialize(
        url: supabaseUrl,
        anonKey: supabaseKey,
        authOptions: const FlutterAuthClientOptions(
          detectSessionInUri: true,
        ),
      );
      _supabase = Supabase.instance;
      log("Supabase initialized: ${_supabase != null}");
      log("Current user: ${_supabase?.client.auth.currentUser?.email}");
    } catch (e) {
      log("Error initializing Supabase: $e");
    }
  }

  Future<String> createBucket(String bucketName) async {
    try {
      final storage = _supabase?.client.storage;
      // Ensure storage is available
      if (storage == null) {
        throw Exception('Error: Supabase storage is not initialized.');
      }
      // Fetch existing buckets
      final buckets = await storage.listBuckets();
      // Check if bucket already exists
      bool bucketExists = buckets.any((b) => b.name == bucketName);
      if (!bucketExists) {
        log('Bucket "$bucketName" not found. Creating a new bucket...');
        await storage.createBucket(bucketName, const BucketOptions(public: true));
        log('Bucket "$bucketName" created successfully.');
      }
      // Ensure the bucket is public
      await storage.updateBucket(bucketName, const BucketOptions(public: true));
      log('Bucket "$bucketName" is now public.');

      return bucketName; // ✅ Return the bucket name
    } catch (e) {
      throw Exception('Error creating/updating bucket: $e');
    }
  }

  Future<String> uploadImage({
    required File profImage,
    required String bucketName,
    required String fileName,
  }) async
  {
    try {
      final storage = _supabase?.client.storage;
      if (storage == null) {
        throw Exception('Error: Supabase storage is not initialized.');
      }
      // Ensure the bucket exists
      await createBucket(bucketName);
      // Upload file
      await storage.from(bucketName).upload(fileName, profImage,fileOptions: FileOptions(upsert: true));
      // Get public URL (it will always return a string)
      final String publicUrl = storage.from(bucketName).getPublicUrl(fileName);
      log('File uploaded successfully. URL: $publicUrl');
      return publicUrl;
    } catch (e) {
      throw Exception('Error uploading file: $e');
    }
  }

  Future<String> uploadAssetImage({
    required String imagePath,
    required String bucketName,
    required String fileName,
  }) async
  {
    try {
      final storage = _supabase?.client.storage;
      if (storage == null) {
        throw Exception('Error: Supabase storage is not initialized.');
      }
      // Ensure the bucket exists
      await createBucket(bucketName);
      // Upload file
      final ByteData byteData = await rootBundle.load(imagePath);
      final Uint8List imageBytes = byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );
      await storage.from(bucketName).uploadBinary(
          fileName,
          imageBytes,
        fileOptions: FileOptions(
          upsert: true
        )
      );
      // Get public URL (it will always return a string)
      final String publicUrl = storage.from(bucketName).getPublicUrl(fileName);
      log('File uploaded successfully. URL: $publicUrl');
      return publicUrl;
    } catch (e) {
      throw Exception('Error uploading file: $e');
    }
  }

  Future<String> replaceImage({
    required File profImage,
    required String bucketName,
    required String fileName,
  }) async {
    try {
      final storage = _supabase?.client.storage;
      if (storage == null) {
        throw Exception('Error: Supabase storage is not initialized.');
      }

      // Ensure the bucket exists
      await createBucket(bucketName);

      // Delete existing file before replacing
      final bool fileExists = await checkFileExists(bucketName: bucketName, fileName: fileName);
      if (fileExists) {
        await storage.from(bucketName).remove([fileName]);
        log('Existing file "$fileName" deleted.');
      }

      // Upload new file with the same name
      await storage.from(bucketName).upload(
        fileName,
        profImage,
        fileOptions: const FileOptions(
          cacheControl: '3600',
          upsert: true,  // Ensure overwrite
        ),
      );

      // The URL remains the same since the file name is unchanged
      final publicUrl = storage.from(bucketName).getPublicUrl(fileName);
      log('File replaced successfully. URL: $publicUrl');
      return publicUrl;
    } catch (e) {
      log('Error replacing file: $e');
      throw Exception('Error replacing file: $e');
    }
  }

  Future<String> uploadFileAndGetUrl({
    required File file,
    required String bucketName,
  }) async
  {
    try {
      final storage = _supabase?.client.storage;
      if (storage == null) {
        throw Exception('Error: Supabase storage is not initialized.');
      }
      // Ensure the bucket exists
      await createBucket(bucketName);
      // Generate a unique filename
      final String fileName = 'uploads/${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';
      // Upload file
      await storage.from(bucketName).upload(fileName, file);
      // Get public URL (it will always return a string)
      final String publicUrl = storage.from(bucketName).getPublicUrl(fileName);
      log('File uploaded successfully. URL: $publicUrl');
      return publicUrl;
    } catch (e) {
      throw Exception('Error uploading file: $e');
    }
  }

  Future<bool> checkFileExists({
    required String bucketName,
    required String fileName,
  }) async {
    try {
      // Get the list of files in the bucket
      final List<FileObject>? files = await _supabase?.client.storage
          .from(bucketName)
          .list();

      // Check if our file exists in the list
      return files!.any((file) => file.name == fileName);
    } catch (e) {
      // If there's an error (like bucket doesn't exist), return false
      return false;
    }
  }
}
