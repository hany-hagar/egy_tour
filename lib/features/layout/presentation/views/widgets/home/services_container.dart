
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/styles.dart';

class ServicesContainer extends StatelessWidget {
  final void Function()? tourOnTap;
  final void Function()? ticketOnTap;
  final void Function()? hotelOnTap;
  final void Function()? carOnTap;
  final void Function()? servicesOnTap;
  const ServicesContainer({
    super.key,
    this.tourOnTap,
    this.ticketOnTap,
    this.hotelOnTap,
    this.carOnTap,
    this.servicesOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServiceItem(
                    image: "assets/images/travel_icon.png",
                    title: "Tour",
                    onTap: tourOnTap,
                  ),
                  ServiceItem(
                    image: "assets/images/ticket_icon.png",
                    title: "Ticket",
                    onTap: ticketOnTap,
                  ),
                  ServiceItem(
                    image: "assets/images/hotel_icon.png",
                    title: "Hotel",
                    onTap: hotelOnTap,
                  ),
                  ServiceItem(
                    image: "assets/images/cars_icon.png",
                    title: "Car",
                    onTap: carOnTap,
                  ),
                ],
              ),
              GestureDetector(
                onTap: servicesOnTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff6fdff),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconBroken.Category,
                        color: Colors.deepOrange,
                        fill: 1,
                      ),
                      Text(
                        "  See all services",
                        style: Styles.textStyle800.copyWith(
                          color: Colors.deepOrange,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.sp),
            ],
          ),
        ),
      ],
    );
  }
}
class ServiceItem extends StatelessWidget {
  final String image;
  final String title;
  final void Function()? onTap;
  const ServiceItem({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 0.182.sw,
        height: 0.13.sh,
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            CircleAvatar(backgroundImage: AssetImage(image), radius: 26.sp),
            Expanded(
              child: Text(
                title,
                style: Styles.textStyle800.copyWith(
                  color: Colors.black,
                  fontSize: 14.sp,
                  height: 2.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}