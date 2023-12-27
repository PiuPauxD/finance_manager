import 'package:finance_manager/ProfileTiles.dart';
import 'package:finance_manager/Screens/BottomNavBar.dart';
import 'package:finance_manager/widgets/currency.dart';
import 'package:finance_manager/widgets/drop_down.dart';
import 'package:finance_manager/widgets/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  String dropdownValue = language.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  //icon buttons
                  Row(
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
                        iconSize: 32,
                        color: Colors.black,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.create_outlined),
                        iconSize: 32,
                        color: Colors.black,
                      ),
                    ],
                  ),

                  //image
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(
                          'img/profile1.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),

                  //name
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        'Олег Сергеевич',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  //tiles
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 60),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const Stack(
                            children: [
                              ProfileTile(
                                profileIcons: Icons.bedtime_outlined,
                                settingName: 'Ночная тема',
                              ),
                              Positioned(
                                top: 15,
                                right: 10,
                                child: SwitchButton(),
                              ),
                            ],
                          ),

                          //currency
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                          ),
                          const Stack(
                            children: [
                              ProfileTile(
                                profileIcons: Icons.euro_outlined,
                                settingName: 'Валюта',
                              ),
                              Positioned(
                                top: 25,
                                right: 10,
                                child: CurrencyButton(),
                              ),
                            ],
                          ),

                          //language
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                          ),
                          const Stack(
                            children: [
                              ProfileTile(
                                profileIcons: Icons.language_outlined,
                                settingName: 'Язык',
                              ),
                              Positioned(
                                top: 25,
                                right: 10,
                                child: DropDown(),
                              ),
                            ],
                          ),

                          //exit from app
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                          ),
                          Stack(
                            children: [
                              const ProfileTile(
                                profileIcons: Icons.exit_to_app_outlined,
                                settingName: 'Выход',
                              ),
                              Positioned(
                                top: 15,
                                right: 10,
                                child: IconButton(
                                  onPressed: () {
                                    SystemNavigator.pop();
                                  },
                                  icon: const Icon(
                                      Icons.arrow_forward_ios_outlined),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
