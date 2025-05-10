//
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:icon_broken/icon_broken.dart';
// import 'package:tour_app/widget/navigator_methods.dart';
//
// class TicketForPlacesDetails extends StatelessWidget {
//   const TicketForPlacesDetails({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF1F1F1),
//       extendBodyBehindAppBar: true,
//       body: _buildBody(context),
//       bottomNavigationBar: const PurchaseBar(),
//     );
//   }
//
//   Widget _buildBody(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         _buildHeaderImage(context),
//         Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildPlaceTitle(),
//               const SizedBox(height: 5),
//               const Divider(color: Colors.grey),
//               _buildExpectationSection(),
//               _buildIntroductionSection(),
//               const Divider(color: Colors.grey),
//               const RateAppWidget(),
//               const Divider(color: Colors.grey),
//               _buildRatingsSection(),
//               ..._buildReviewList(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildHeaderImage(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           width: double.infinity,
//           height: MediaQuery.sizeOf(context).height * 0.27,
//           child: const Image(
//             image: AssetImage('assets/img_1.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () => NavigatorMethods.pop(context: context),
//                   icon: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20.sp),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(
//                         IconBroken.Arrow___Left_2,
//                         color: Colors.black,
//                         size: 24.sp,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPlaceTitle() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Al azhar park',
//           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 5.h),
//         const Text(
//           'Enjoy your wonderfull day with local tour',
//           style: TextStyle(fontSize: 20, color: Colors.grey),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildExpectationSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('  What to expect?', style: TextStyle(fontSize: 25)),
//         SizedBox(height: 5.h),
//         _buildContentContainer(
//           'Discover a peaceful and breathtaking side of Cairo at Al-Azhar Park...',
//         ),
//         SizedBox(height: 10),
//       ],
//     );
//   }
//
//   Widget _buildIntroductionSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('  Introduction', style: TextStyle(fontSize: 25)),
//         SizedBox(height: 5.h),
//         _buildContentContainer(
//           'Located near the historic center of Cairo, Al-Azhar Park was built on...',
//         ),
//         SizedBox(height: 10),
//       ],
//     );
//   }
//
//   Widget _buildContentContainer(String text) {
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Text(text),
//       ),
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF000000).withOpacity(0.5),
//             spreadRadius: 0,
//             blurRadius: 15,
//             offset: const Offset(0, 5),
//           ),
//         ],
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white,
//       ),
//     );
//   }
//
//   Widget _buildRatingsSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Rating an reviews',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             const Text(
//               '5.0',
//               style: TextStyle(
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Text(' (5 rating)', style: TextStyle(fontSize: 20)),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: List.generate(5, (index) {
//             return IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.star, color: Colors.orange, size: 36),
//             );
//           }),
//         ),
//       ],
//     );
//   }
//
//   List<Widget> _buildReviewList() {
//     const reviewText = 'My pilot was Anh and he was awesome. I felt safe throughout the whole process...';
//
//     return [
//       ReviewItem(name: 'user_name', review: reviewText),
//       ReviewItem(name: 'user_name', review: reviewText),
//       ReviewItem(name: 'user_name', review: reviewText),
//       ReviewItem(name: 'user_name', review: reviewText),
//     ];
//   }
// }
//
// class ReviewItem extends StatelessWidget {
//   const ReviewItem({
//     super.key,
//     required this.name,
//     required this.review,
//   });
//
//   final String name;
//   final String review;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10.0),
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               _buildReviewerInfo(),
//               SizedBox(height: 5.h),
//               _buildRatingStars(),
//               SizedBox(height: 10.h),
//               Text(review),
//             ],
//           ),
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: const Color(0xFF000000).withOpacity(0.5),
//               spreadRadius: 0,
//               blurRadius: 15,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildReviewerInfo() {
//     return Row(
//       children: [
//         Container(
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(40),
//             color: Colors.orange,
//           ),
//         ),
//         SizedBox(width: 10.w),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(name, style: const TextStyle(fontSize: 20)),
//             const Text(
//               '21 Mar',
//               style: TextStyle(fontSize: 15, color: Colors.grey),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildRatingStars() {
//     return Row(
//       children: [
//         ...List.generate(5, (_) => const Icon(Icons.star, color: Colors.orange, size: 24)),
//         SizedBox(width: 10.w),
//         const Text(
//           'Highly recommend',
//           style: TextStyle(color: Colors.grey, fontSize: 18),
//         ),
//       ],
//     );
//   }
// }
//
// class RateAppWidget extends StatefulWidget {
//   const RateAppWidget({super.key});
//
//   @override
//   _RateAppWidgetState createState() => _RateAppWidgetState();
// }
//
// class _RateAppWidgetState extends State<RateAppWidget> {
//   int selectedStars = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Rate this app',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const Text(
//           'Tell others what you think',
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         SizedBox(height: 20),
//         _buildStarRating(),
//         SizedBox(height: 20),
//         TextButton(
//           onPressed: () => _showReviewDialog(context),
//           child: const Text(
//             'Write a review',
//             style: TextStyle(fontSize: 16, color: Colors.lightBlueAccent),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildStarRating() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: List.generate(5, (index) {
//         return IconButton(
//           onPressed: () => setState(() => selectedStars = index + 1),
//           icon: Icon(
//             index < selectedStars ? Icons.star : Icons.star_border,
//             color: index < selectedStars ? Colors.orange : Colors.grey,
//             size: 36,
//           ),
//         );
//       }),
//     );
//   }
//
//   void _showReviewDialog(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => ReviewDialog(),
//     );
//   }
// }
//
// class ReviewDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.6,
//       minChildSize: 0.4,
//       maxChildSize: 0.9,
//       builder: (context, scrollController) {
//         return Container(
//           padding: const EdgeInsets.all(20),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: SingleChildScrollView(
//             controller: scrollController,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Write a review',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 _buildReviewTextField(),
//                 const SizedBox(height: 16),
//                 _buildPostButton(context),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildReviewTextField() {
//     return TextField(
//       maxLines: 5,
//       decoration: InputDecoration(
//         hintText: 'write a review',
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPostButton(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () => Navigator.pop(context),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFFFF7A00),
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         child: const Text(
//           'Post',
//           style: TextStyle(
//             fontSize: 25,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class PurchaseBar extends StatelessWidget {
//   const PurchaseBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       color: Colors.white,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _buildPriceRow(),
//           _buildActionButtons(context),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPriceRow() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           '\$132',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//           decoration: BoxDecoration(
//             color: const Color(0xFFFFF4E0),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: const Text(
//             '100 points',
//             style: TextStyle(
//               fontSize: 12,
//               color: Color(0xFFFF9900),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildActionButtons(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildFavoriteButton(),
//         _buildAddToCartButton(),
//         _buildBuyNowButton(context),
//       ],
//     );
//   }
//
//   Widget _buildFavoriteButton() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         shape: BoxShape.circle,
//       ),
//       padding: const EdgeInsets.all(8),
//       child: const Icon(Icons.favorite_border, size: 20),
//     );
//   }
//
//   Widget _buildAddToCartButton() {
//     return TextButton(
//       onPressed: () {},
//       style: TextButton.styleFrom(
//         backgroundColor: Colors.grey[200],
//         padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
//       ),
//       child: const Text(
//         'Add to cart',
//         style: TextStyle(color: Colors.orange),
//       ),
//     );
//   }
//
//   Widget _buildBuyNowButton(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => _showPackageSelectionSheet(context),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: const Color(0xFFFF7A00),
//         padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       child: const Text(
//         'Buy now',
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }
//
//   void _showPackageSelectionSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => PackageSelectionSheet(),
//     );
//   }
// }
//
// class PackageSelectionSheet extends StatefulWidget {
//   @override
//   _PackageSelectionSheetState createState() => _PackageSelectionSheetState();
// }
//
// class _PackageSelectionSheetState extends State<PackageSelectionSheet> {
//   int participants = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.6,
//       minChildSize: 0.4,
//       maxChildSize: 0.9,
//       builder: (context, scrollController) {
//         return Container(
//           padding:  EdgeInsets.all(20),
//           decoration:  BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: SingleChildScrollView(
//             controller: scrollController,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Package selection',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 _buildDatePicker(),
//                 SizedBox(height: 16),
//                 _buildPickupDropdown(),
//                 SizedBox(height: 16),
//                 _buildHotelAddressField(),
//                 SizedBox(height: 16),
//                 _buildParticipantCounter(),
//                 SizedBox(height: 24),
//                 _buildPlaceOrderButton(),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildDatePicker() {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: 'Pick a day',
//         prefixIcon: const Icon(Icons.calendar_today),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPickupDropdown() {
//     return DropdownButtonFormField<String>(
//       items: const [
//         DropdownMenuItem(
//           value: 'hotel',
//           child: Text('At hotel'),
//         ),
//         DropdownMenuItem(
//           value: 'meeting',
//           child: Text('Meeting point'),
//         ),
//       ],
//       onChanged: (value) {},
//       decoration: InputDecoration(
//         prefixIcon: const Icon(Icons.place),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHotelAddressField() {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: 'Your hotel address',
//         prefixIcon: const Icon(Icons.location_on_outlined),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildParticipantCounter() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Number of participant',
//           style: TextStyle(fontWeight: FontWeight.w600),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             IconButton(
//               onPressed: () {
//                 if (participants > 1) {
//                   setState(() => participants--);
//                 }
//               },
//               icon: const Icon(
//                 Icons.remove_circle_outline,
//                 color: Colors.orange,
//                 size: 40,
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey.shade300),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Text(
//                 "$participants",
//                 style: const TextStyle(fontSize: 25),
//               ),
//             ),
//             IconButton(
//               onPressed: () => setState(() => participants++),
//               icon: const Icon(
//                 Icons.add_circle_outline,
//                 color: Colors.orange,
//                 size: 40,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPlaceOrderButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () => Navigator.pop(context),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFFFF7A00),
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         child: const Text(
//           'Place Order',
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }