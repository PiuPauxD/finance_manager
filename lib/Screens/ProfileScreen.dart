import 'package:finance_manager/ProfileTiles.dart';
import 'package:finance_manager/Screens/BottomNavBar.dart';
import 'package:flutter/material.dart';

List<String> language = [
  'Ru',
  'En',
];

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;

  String dropdownValue = language.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //icon buttons
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Navbar(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back_outlined),
                    iconSize: 40,
                    color: Colors.black,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.create_outlined),
                    iconSize: 40,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            //image
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  child: Image.asset(
                    'img/profile1.jpg',
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //name
            const Expanded(
              flex: 1,
              child: Text(
                'Олег Сергеевич',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            //tiles
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //dark mode
                        const ProfileTile(
                          profileIcons: Icons.dark_mode_outlined,
                          settingName: 'Ночная тема',
                        ),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                          activeTrackColor: Colors.grey,
                          activeColor: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                  //language

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const ProfileTile(
                        profileIcons: Icons.language_outlined,
                        settingName: 'Язык',
                      ),
                      DropdownMenu<String>(
                        initialSelection: language.first,
                        onSelected: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        dropdownMenuEntries:
                            language.map<DropdownMenuEntry<String>>(
                          (String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          },
                        ).toList(),
                      ),
                    ],
                  ),

                  //exit from app

                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfileTile(
                          profileIcons: Icons.exit_to_app,
                          settingName: 'Выход',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
