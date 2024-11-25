import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/language/Local_Key.g.dart';
import 'package:flutter_application_1/custom_background.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //var prov=Provider.of<IcrimanteProvider>(context,listen: false);
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.of(context).size.height;
    print("height $height");
    print("width $width");
    print("========build");
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset("name"),
        ),
        MyWidget(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(LocalKeys.welcomeBack.tr()),
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.only(start: 30.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        if (context.locale.toString() != "en") {
                          context.setLocale(const Locale("en"));
                        } else {
                          context.setLocale(const Locale("ar"));
                        }
                      },
                      child: const Icon(
                        Icons.flag,
                        color: Colors.blue,
                      )),
                  Text(
                    LocalKeys.welcomeBack.tr(),
                  ),
                  //   Selector<IcrimanteProvider, int>(
                  //     selector: (context, prov) => prov.showCounter1,
                  //     builder: (BuildContext context, count, Widget? child) {
                  //       print(" Selector 1");
                  //       return Text(
                  //         'showCounter1 ${count}',
                  //         style: Theme.of(context).textTheme.headlineMedium,
                  //       );
                  //     },
                  //   ),
                  //   Selector<IcrimanteProvider, int>(
                  //     selector: (context, prov) => prov.showCounter2,
                  //     builder: (BuildContext context, count, Widget? child) {
                  //       print(" Selector 2");
                  //       return Text(
                  //         'showCounter2${count}',
                  //         style: Theme.of(context).textTheme.labelLarge,
                  //       );
                  //     },
                  //   ),
                  //   Consumer<IcrimanteProvider>(
                  //       builder: (BuildContext context, count, Widget? child) {
                  //     print(" FloatingActionButton 1");
                  //     return FloatingActionButton(
                  //       onPressed: () {
                  //         count.changeTheme();
                  //       },
                  //       tooltip: 'Increment1',
                  //       child: const Icon(Icons.account_tree_outlined),
                  //     );
                  //   }),
                  //   Consumer<IcrimanteProvider>(
                  //       builder: (BuildContext context, count, Widget? child) {
                  //     print(" FloatingActionButton 2");
                  //     return FloatingActionButton(
                  //       onPressed: () {
                  //         count.incrementCounter2();
                  //       },
                  //       tooltip: 'Increment2',
                  //       child: const Icon(Icons.abc),
                  //     );
                  //   }),
                  //   Selector<IcrimanteProvider,int>(
                  //     selector: (context, count) => count.showCounter3,
                  //     builder: (context, count, Widget? child){
                  //       print(" Selector 3");
                  //     return Text(
                  //     'showCounter3 ${count}',
                  //     style: Theme.of(context).textTheme.headlineMedium,
                  //   );
                  //   },
                  //   ),
                  //   FloatingActionButton(
                  //     onPressed: () {
                  //       context.read<IcrimanteProvider>().incrementCounter3();
                  //       print(context.read<IcrimanteProvider>().showCounter3);
                  //     },
                  //     tooltip: 'Increment2',
                  //     child: const Icon(Icons.abc),
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
