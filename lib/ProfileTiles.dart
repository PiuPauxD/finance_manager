import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final IconData profileIcons;
  final String settingName;

  const ProfileTile({
    super.key,
    required this.profileIcons,
    required this.settingName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              profileIcons,
              size: 35,
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          Text(
            settingName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
