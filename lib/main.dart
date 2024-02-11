import 'package:crystalwarp/home.dart';
import 'package:flutter/material.dart';

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

  var _selectedIndex = 0;

  void _onItemTapped(int itemIdx) {
    setState(() {
      _selectedIndex = itemIdx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text("Crystal Warp", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.bold),),
        ),
        body: Home(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}