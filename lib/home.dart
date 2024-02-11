import 'package:flutter/material.dart';
import 'heading.dart';
import 'rtc_calc.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var calc = RtcCalc();
  @override
  Widget build(BuildContext context){
    return ListView(
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
        const Text(""),
        const Text("(for the \"PK\", \"MN\", and \"×\" symbols, use \"{\", \"}\", and \"*\" instead, respectively.)"),
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
        Row(children: [
          Heading("Your reset code is ${calc.resetCode}"),
        ],)
      ],
    );
  }
}
