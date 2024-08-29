import 'package:flutter/material.dart';

// import '../borrowing_history/borrowing_history.dart';
// import '../home/home_screen.dart';
// import '../profile/profile.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    // HomeScreen(),
    // BorrowingHistory(),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 0 ? 'assets/ahome.png' : 'assets/home.png',
              scale: 3,
            ), // Provide the path to your first image
            label: '', // Empty label text
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 1 ? 'assets/achart.png' : 'assets/chart.png',
              scale: 3,
            ), // Provide the path to your second image
            label: '', // Empty label text
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 2 ? 'assets/auser.png' : 'assets/user.png',
              scale: 3,
            ), // Provide the path to your third image
            label: '', // Empty label text
          ),
        ],
      ),
    );
  }
}
