import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../bottom_sheets/language_bottom_sheet.dart';
import '../../bottom_sheets/theme_bottom_sheet.dart';
import '../../config/language/Local_Key.g.dart';
import '../../my_theme.dart';


class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Language",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * .70,
                    child: LanguageBottomSheet(),
                  );
                },
              );
            },
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  LocalKeys.language.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
          ),
          Text(
            "Theme",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InkWell
            (
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * .70,
                    child: ThemeBottomSheet(),
                  );
                },
              );
            },
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: MyThemeData.primaryColor),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  "Light",
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
          ),
        ],
      ),
    );
  }
}
