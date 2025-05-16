import 'package:flutter/material.dart';
import 'package:gp/const.dart';
import 'package:gp/featuers/favoriets/presentation/views/favoriets.dart';
import 'package:gp/featuers/home/presntation/views/homescreen.dart';
import 'package:gp/featuers/mybooks/presentation/views/purchasedbooks.dart';
import 'package:gp/featuers/profile/presentation/views/profile.dart';
import 'package:gp/featuers/search/presentation/views/searchscreen.dart';





class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens =const [
    HomeScreen(),
   
    
    SearchScreen(),
    
Favoriets(),
  
    PurchasedBooks(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return  WillPopScope( onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0; // Go to Home tab
          });
          return false; // Don't exit app yet
        }
        return true; // Exit app if already on Home
      },
      child: Scaffold(
        body:IndexedStack(index: _selectedIndex,children: _screens,),//
        
  bottomNavigationBar:      BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  selectedItemColor: color,
  unselectedItemColor: Colors.grey,
  backgroundColor: Colors.white,
  elevation: 10,
  selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
  unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
  iconSize: 26,
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      activeIcon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      activeIcon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.menu_book_outlined),
      activeIcon: Icon(Icons.menu_book),
      label: 'My Books',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
)

      ),
    );
  }
}





