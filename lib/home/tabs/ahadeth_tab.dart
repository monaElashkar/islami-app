import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../config/language/Local_Key.g.dart';
import '../../hadeth_details/hadeth_details.dart';
import '../../hadeth_details/hadeth_details_provider.dart';
import '../../my_theme.dart';

class AhadethTab extends StatelessWidget {
  AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {

        var provider = Provider.of<HadethDetailsProvider>(context);
        return Column(
          children: [
            Image.asset("assets/images/ahadeth_header.png"),
            const Divider(
              thickness: 3,
              color: Color(0xFFB7935F),
            ),
            Text(
              LocalKeys.ahadeth.tr(),
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const Divider(
              thickness: 3,
              color: Color(0xFFB7935F),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: MyThemeData.primaryColor,
                  indent: 50,
                  endIndent: 50,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      provider.selectHadethModel(index);
                      Navigator.pushNamed(
                        context,
                        HadethDetails.routeName,
                      );
                    },
                    child: Text(
                      provider.ahadethData[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                },
                itemCount: provider.ahadethData.length,
              ),
            )
          ],
        );

  }
}
