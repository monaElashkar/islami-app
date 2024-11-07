import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/language/codegen_loader.g.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    path: 'assets/translation',
    supportedLocales: const [
      Locale('en'),
      Locale('ar'),
    ],
    fallbackLocale: const Locale('en'),
    saveLocale: true,
    assetLoader: const CodegenLoader(),
    child: MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => IcrimanteProvider(),
      ),
    ], child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    print("context");
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: MyHomePage(),
    );
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// /// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].

// void main() {
//   runApp(
//     /// Providers are above [MyApp] instead of inside it, so that tests
//     /// can use [MyApp] while mocking the providers
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => Counter()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// /// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// // ignore: prefer_mixin
// class Counter with ChangeNotifier, DiagnosticableTreeMixin {
//   int _count = 0;

//   int get count => _count;

//   void increment() {
//     _count++;
//     notifyListeners();
//   }

//   /// Makes `Counter` readable inside the devtools by listing all of its properties
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(IntProperty('count', count));
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//    MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//     int index=0;
//     List<Widget> view=[
//       Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blueAccent,
//           title: Text("Home"),
//         ),
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           color: Colors.amber,
//         ),
//       ),
//       Scaffold(
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
         
//           ),
//       ),
//             Scaffold(
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           color: Colors.blueAccent,
//         ),
//       ),
//             Scaffold(
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           color: Colors.deepPurple,
//         ),
//       ),
//     ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Example'),
//       ),
//       body: view[index],
//       // floatingActionButton: FloatingActionButton(
//       //   key: const Key('increment_floatingActionButton'),

//       //   /// Calls `context.read` instead of `context.watch` so that it does not rebuild
//       //   /// when [Counter] changes.
//       //   onPressed: () => context.read<Counter>().increment(),
//       //   tooltip: 'Increment',
//       //   child: const Icon(Icons.add),
//       // ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.amber,
//         type: BottomNavigationBarType.shifting,
//         backgroundColor: Colors.black26,
//         useLegacyColorScheme :false,
//         elevation: 8,
//         currentIndex: index,
//         onTap: (value){
//           setState(() {
//           index = value;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.import_contacts),
//             label: "",
//             activeIcon: Icon(Icons.inbox_sharp)
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.import_contacts),
//                         label: "home"

//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.import_contacts),
//                         label: "ppp"

//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.import_contacts),
//                         label: "ll"

//           ),
//         ],
//       ),
//     );
//   }
// }

// class Count extends StatelessWidget {
//   const Count({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
//       '${context.watch<Counter>().count}',
//       key: const Key('counterState'),
//       style: Theme.of(context).textTheme.headlineMedium,
//     );
//   }
// }
