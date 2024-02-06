import 'package:crystalwarp/rtc_calc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text("CrystalWarp"),
          ),
          body: Container(
//          margin: const EdgeInsets.all(50),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("pog"),
                const Text("haha funny lol"),
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
                      calc.playerID = int.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(hintText: "Enter your Trainer ID (See trainer card)"),
                ),
                TextField(
                  onChanged: (value) {
                    setState((){
                    calc.playerMoney = int.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(hintText: "Enter your money (See trainer card)"),
                ),
                Text(calc.playerName),
//                 FilledButton(
//                   onPressed: (){
//                     setState((){
//                       _resetCode = calcResetCode();
//                     });
//                   },
// //                  style: const ButtonStyle(backgroundColor:),
//                   child: const Text("pog"),
//                 ),
                Text("Your reset code is ${calc.resetCode}"),
              ],
            ),
          )),
    );
  }
}