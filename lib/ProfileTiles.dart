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
      width: 200,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15),
          ),
          Icon(
            profileIcons,
            size: 30,
            color: Colors.black,
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
