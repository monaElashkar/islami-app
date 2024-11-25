import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/tabs/ahadeth_tab.dart';
import 'package:flutter_application_1/home/tabs/quran_tab.dart';
import 'package:flutter_application_1/home/tabs/radio_tab.dart';
import 'package:flutter_application_1/home/tabs/sebha_tab.dart';
import 'package:flutter_application_1/home/tabs/settings_tab.dart';
import 'package:flutter_application_1/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../config/language/Local_Key.g.dart';
import '../custom_bakeground.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return CustomBakeground(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                LocalKeys.app_name.tr(),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: index,
          
                onTap: (value) {
                  index = value;
                  setState(() {});
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/ic_quran.png")),
                      label: "add"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/ic_sebha.png")),
                      label: "add"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/ic_ahadeth.png")),
                      label: "add"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/ic_radio.png")),
                      label: "add"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "add"),
                ]),
            body: tabs[index],
          ),
        );
  }

  List<Widget> tabs = [
    QuranTab(),
    const SebhaTab(),
    AhadethTab(),
    const RadioTab(),
    const SettingsTab()
  ];
}
