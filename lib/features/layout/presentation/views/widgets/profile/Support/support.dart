import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: IconButton(onPressed: () => NavigatorMethods.pop(context: context), icon: Icon(IconBroken.Arrow___Left_2)),),
    body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(children: [
        Container(
          height: 110.sp,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Spacer(flex: 1),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,  // Background color
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  SizedBox(height: 10.sp,),
                  Text(
                    'Call us',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
              Spacer(flex: 2),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,  // Background color
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chat_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Chat with us',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
              Spacer(flex: 1),
            ],
          ),
        ),

        SizedBox(height: 20,),
        FAQItem(
          question: 'Do I get refund after purchasing?',
           answer: 'Yes, you can request a refund within 7 days of purchase, as long as you meet the criteria.',
        ),
        SizedBox(height: 20,),
        FAQItem(
          question: 'when will i receive my booking confirmation?',
          answer: 'Yes, you can request a refund within 7 days of purchase, as long as you meet the criteria.',
        ),
        SizedBox(height: 20,),
        FAQItem(
          question: 'Can i book an activity on behalf of someone?',
          answer: 'Yes, you can request a refund within 7 days of purchase, as long as you meet the criteria.',
        ),



      ],),
    ),
    );
  }
}


class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.question,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                widget.answer,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
