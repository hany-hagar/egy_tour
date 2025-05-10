import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/features/layout/data/models/hotel_model.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/items/hotel_item.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/Search/hotels_search.dart';

class ListOfTopHotelItem extends StatelessWidget {
  final List<HotelModel> hotels;
  const ListOfTopHotelItem({super.key, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.sp),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 16),
            Expanded(
              child: Text(
                "Top hotel Room",
                style: Styles.textStyle800.copyWith(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                NavigatorMethods.push(
                  context: context,
                  nextPage: HotelsSearch(hotels: hotels),
                );
              },
              icon: Icon(
                IconBroken.Arrow___Right_Circle,
                size: 25.sp,
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(width: 4),
          ],
        ),
        SizedBox(height: 5.sp),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16),
          child: SizedBox(
            height: 200,
            child: GridView.builder(
              clipBehavior: Clip.none,
              shrinkWrap: true,
              itemCount: hotels.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.25,
                mainAxisSpacing: 12.sp,
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) => HotelItem(model: hotels[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class TicketForHotelsDetails extends StatelessWidget {
  const TicketForHotelsDetails({
    super.key,
    required this.intro,
    required this.image,
    required this.whatexpect,
    required this.title,
    required this.description,
    required this.likes,
  });

  final String image;
  final String intro;
  final String whatexpect;
  final String title;
  final String description;
  final double likes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.27,
                child: Image(image: AssetImage(image), fit: BoxFit.cover),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => NavigatorMethods.pop(context: context),
                        icon: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              IconBroken.Arrow___Left_2,
                              color: Colors.black,
                              size: 24.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.h),
                Text(
                  'description',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                SizedBox(height: 5),
                Divider(color: Colors.grey),
                SizedBox(height: 5),

                Text('  What to expect?', style: TextStyle(fontSize: 25)),
                SizedBox(height: 5.h),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(
                          0xFF000000,
                          // ignore: deprecated_member_use
                        ).withOpacity(0.5), // Semi-transparent black
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(whatexpect),
                  ),
                ),
                SizedBox(height: 10),

                Text('  Introduction', style: TextStyle(fontSize: 25)),
                SizedBox(height: 5.h),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(
                          0xFF000000,
                          // ignore: deprecated_member_use
                        ).withOpacity(0.5), // Semi-transparent black
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(intro),
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey),

                RateAppWidget(),
                Divider(color: Colors.grey),

                Text(
                  'Rating an reviews',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                Row(
                  children: [
                    Text(
                      '5.0',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(' (5 rating)', style: TextStyle(fontSize: 20)),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.star, color: Colors.orange, size: 36),
                    );
                  }),
                ),

                review_some_one_about_tour(
                  name: 'user_name',
                  review:
                      'My pilot was Anh and he was awesome. I felt safe throughout the whole process and I had a wonderful time. Highly recommended. Read some of the reviews and I feel that even if you have to wait for your turn, I think it’s okay. Talk to people, take the opportunity to learn more bout the sport and enjoy the mountain! I also had the chance to chill in the village pick up point while waiting for them.',
                ),
                review_some_one_about_tour(
                  name: 'user_name',
                  review:
                      'My pilot was Anh and he was awesome. I felt safe throughout the whole process and I had a wonderful time. Highly recommended. Read some of the reviews and I feel that even if you have to wait for your turn, I think it’s okay. Talk to people, take the opportunity to learn more bout the sport and enjoy the mountain! I also had the chance to chill in the village pick up point while waiting for them.',
                ),
                review_some_one_about_tour(
                  name: 'user_name',
                  review:
                      'My pilot was Anh and he was awesome. I felt safe throughout the whole process and I had a wonderful time. Highly recommended. Read some of the reviews and I feel that even if you have to wait for your turn, I think it’s okay. Talk to people, take the opportunity to learn more bout the sport and enjoy the mountain! I also had the chance to chill in the village pick up point while waiting for them.',
                ),
                review_some_one_about_tour(
                  name: 'user_name',
                  review:
                      'My pilot was Anh and he was awesome. I felt safe throughout the whole process and I had a wonderful time. Highly recommended. Read some of the reviews and I feel that even if you have to wait for your turn, I think it’s okay. Talk to people, take the opportunity to learn more bout the sport and enjoy the mountain! I also had the chance to chill in the village pick up point while waiting for them.',
                ),
                review_some_one_about_tour(
                  name: 'user_name',
                  review:
                      'My pilot was Anh and he was awesome. I felt safe throughout the whole process and I had a wonderful time. Highly recommended. Read some of the reviews and I feel that even if you have to wait for your turn, I think it’s okay. Talk to people, take the opportunity to learn more bout the sport and enjoy the mountain! I also had the chance to chill in the village pick up point while waiting for them.',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: PurchaseBar(),
    );
  }
}

// ignore: camel_case_types
class review_some_one_about_tour extends StatelessWidget {
  const review_some_one_about_tour({
    super.key,
    required this.name,
    required this.review,
  });
  final String? name;
  final String? review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(
                0xFF000000,
                // ignore: deprecated_member_use
              ).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name!, style: TextStyle(fontSize: 20)),
                      Text(
                        '21 Mar',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 24),
                  Icon(Icons.star, color: Colors.orange, size: 24),
                  Icon(Icons.star, color: Colors.orange, size: 24),
                  Icon(Icons.star, color: Colors.orange, size: 24),
                  Icon(Icons.star, color: Colors.orange, size: 24),
                  SizedBox(width: 10.w),
                  Text(
                    'Highly recommend',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(review!),
            ],
          ),
        ),
      ),
    );
  }
}

class RateAppWidget extends StatefulWidget {
  const RateAppWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RateAppWidgetState createState() => _RateAppWidgetState();
}

class _RateAppWidgetState extends State<RateAppWidget> {
  int selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rate this app',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Tell others what you think',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  selectedStars = index + 1;
                });
              },
              icon: Icon(
                index < selectedStars ? Icons.star : Icons.star_border,
                color: index < selectedStars ? Colors.orange : Colors.grey,
                size: 36,
              ),
            );
          }),
        ),
        SizedBox(height: 20),
        TextButton(
          onPressed: () {
            my_review(context);
          },
          child: Text(
            'Write a review',
            style: TextStyle(fontSize: 16, color: Colors.lightBlueAccent),
          ),
        ),
      ],
    );
  }
}

class PurchaseBar extends StatelessWidget {
  const PurchaseBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '\$132',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4E0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '100 points',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFFF9900),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.favorite_border, size: 20),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showPackageSelectionSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7A00),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Buy now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showPackageSelectionSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder:
        (context) => DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            int participants = 1;

            return StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Package selection',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Pick a day
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Pick a day',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Pick up place dropdown
                        DropdownButtonFormField<String>(
                          items: const [
                            DropdownMenuItem(
                              value: 'hotel',
                              child: Text('At hotel'),
                            ),
                            DropdownMenuItem(
                              value: 'meeting',
                              child: Text('Meeting point'),
                            ),
                          ],
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.place),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Hotel address
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Your hotel address',
                            prefixIcon: const Icon(Icons.location_on_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Number of participants
                        const Text(
                          'Number of participant',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (participants > 1) {
                                  setState(() => participants--);
                                }
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                color: Colors.orange,
                                size: 40,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "$participants",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() => participants++);
                              },
                              icon: const Icon(
                                Icons.add_circle_outline,
                                color: Colors.orange,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Place Order Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the sheet
                              // ممكن هنا تطبع البيانات أو تبعتها
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF7A00),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Place Order',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
  );
}

// ignore: non_constant_identifier_names
void my_review(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder:
        (context) => DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Write a review',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),

                        // Pick a day
                        TextField(
                          maxLines: 5, // sets number of lines

                          decoration: InputDecoration(
                            hintText: 'write a review',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF7A00),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Post',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
  );
}
