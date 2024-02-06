import 'package:crystalwarp/heading.dart';
import 'package:crystalwarp/rtc_calc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:google_fonts/google_fonts.dart';

var globalTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
    brightness: Brightness.dark,
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = "CrystalWarp";

    return MaterialApp(
      title: appName,
      theme: globalTheme,
      home: const MainScreen(
        title: appName,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final String title;

  const MainScreen({super.key, required this.title});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  var calc = RtcCalc();
  // var _selectedIndex = 0;

  // void _onItemTapped(int itemIdx) {
  //   setState(() {
  //     _selectedIndex = itemIdx;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text("Crystal Warp", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.bold),),
        ),
        body: ListView(
//              crossAxisAlignment: CrossAxisAlignment.start,
          padding: const EdgeInsets.all(16),
          children: [
            const Heading("Clock Reset Tool for Pokemon Crystal", level: 1),
            const Heading("In Pokemon Crystal:", level: 2),
            const Text(" • Press and hold DOWN + SELECT + B"),
            const Text(" • With SELECT still down, let go of DOWN and B, then press and hold LEFT + UP"),
            const Text(" • Let go of SELECT"),
            const Heading("In Pokemon Gold/Silver:", level: 2),
            const Text(" • Press DOWN + SELECT + B"),
            const Text("Then enter this code there!"),
            TextField(
              onChanged: (value) {
                setState((){
                  calc.playerName = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Enter your Player name',
              ),
            ),
            TextField(
              onChanged: (value) {
                setState((){
                  calc.playerID = int.tryParse(value) ?? 0;
                });
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(hintText: "Enter your Trainer ID (See trainer card)"),
            ),
            TextField(
              onChanged: (value) {
                setState((){
                  calc.playerMoney = int.tryParse(value) ?? 0;
                });
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(hintText: "Enter your money (See trainer card)"),
            ),
//                Text(calc.playerName),
//                 FilledButton(
//                   onPressed: (){
//                     setState((){
//                       _resetCode = calcResetCode();
//                     });
//                   },
// //                  style: const ButtonStyle(backgroundColor:),
//                   child: const Text("pog"),
//                 ),
            Row(children: [
              Heading("Your reset code is ${calc.resetCode}"),
            ],)
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: Theme.of(context).colorScheme.primary,
        //   onTap: _onItemTapped,
        // ),
      ),
    );
  }
}