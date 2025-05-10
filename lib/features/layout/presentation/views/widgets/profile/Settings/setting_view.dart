import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/styles.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  String? selectedLanguage;
  ThemeMode? selectedThemeMode;

  final List<String> languages = ['English', 'Spanish', 'French', 'German', 'Arabic'];
  final Map<String, ThemeMode> themeOptions = {
    'System': ThemeMode.system,
    'Light': ThemeMode.light,
    'Dark': ThemeMode.dark,
  };

  void _submitSelection() {
    if (selectedLanguage != null && selectedThemeMode != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved: $selectedLanguage, Theme: ${selectedThemeMode!.name}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select language and theme')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Language', style: TextStyle(fontSize: 18)),
            DropdownButtonFormField<String>(
              value: selectedLanguage,
              hint: Text('Choose a language'),
              items: languages.map((lang) {
                return DropdownMenuItem(value: lang, child: Text(lang));
              }).toList(),
              onChanged: (value) => setState(() => selectedLanguage = value),
            ),
            SizedBox(height: 20),
            Text('Select Theme', style: TextStyle(fontSize: 18)),
            DropdownButtonFormField<ThemeMode>(
              value: selectedThemeMode,
              hint: Text('Choose a theme'),
              items: themeOptions.entries.map((entry) {
                return DropdownMenuItem(value: entry.value, child: Text(entry.key));
              }).toList(),
              onChanged: (mode) => setState(() => selectedThemeMode = mode),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 40.h,
              child: ElevatedButton(
                onPressed: _submitSelection,
                style: ElevatedButton.styleFrom(
                  backgroundColor: defaultColor,
                ),
                child: Text('Save', style: Styles.textStyle800.copyWith(fontSize: 14.sp,color: Theme.of(context).scaffoldBackgroundColor),),
              ),
            ),
          ],
        ),
    ),
);
}
}