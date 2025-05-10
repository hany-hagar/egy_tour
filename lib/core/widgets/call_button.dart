import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallButton extends StatelessWidget {
  final String phoneNumber;
  final String? label;
  final IconData icon;
  final Color iconColor;
  final Color? backgroundColor;
  final double iconSize;
  final EdgeInsetsGeometry padding;

  const CallButton({
    super.key,
    required this.phoneNumber,
    this.label,
    this.icon = Icons.call,
    this.iconColor = Colors.green,
    this.backgroundColor,
    this.iconSize = 24.0,
    this.padding = const EdgeInsets.all(8.0),
  });

  Future<void> _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch phone call';
    }
  }

  @override
  Widget build(BuildContext context) {
    return label == null
        ? IconButton(
            icon: Icon(icon),
            color: iconColor,
            iconSize: iconSize,
            onPressed: _makePhoneCall,
          )
        : TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              padding: padding,
            ),
            onPressed: _makePhoneCall,
            icon: Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
            label: Text(
              label!,
              style: TextStyle(
                color: iconColor,
              ),
            ),
          );
  }
}