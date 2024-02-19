// Global Imports
import 'package:flutter/material.dart';

// Local Imports
// Widgets
import 'widgets/appBar.dart';
import 'widgets/navBar.dart';
// Pages
import 'pages/activiesPage.dart';
import 'pages/homePage.dart';
import 'pages/profilePage.dart';
import 'pages/supervisionPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modular Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  final pagesName = [
    'Home',
    'Atividades',
    'Monitoramento',
    'Perfil',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0), // Ajuste a altura conforme necessário
        child: SupBar(title: pagesName[_selectedIndex]), // Use uma variável para mudar o título
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          HomePage(),
          AtividadesPage(),
          MonitorarPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
