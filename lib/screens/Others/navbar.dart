import 'package:flutter/material.dart';
import 'package:flutter_my_dog/db/user/user_db.dart';
import 'package:flutter_my_dog/db/user/user_hive_db/user_hive_db.dart';
import 'package:flutter_my_dog/screens/Dogs/doglistscreen.dart';
import 'package:flutter_my_dog/screens/Events/eventscreen.dart';
import 'package:flutter_my_dog/screens/home/homescreen.dart';
import 'package:flutter_my_dog/screens/menu/menu.dart';
import 'package:flutter_my_dog/screens/Reminders/reminderpage.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class navPage extends StatefulWidget {
  @override
  _navPageState createState() => _navPageState();
}

class _navPageState extends State<navPage> {
  // a variable to store the current selected tab. can be used to control PageView
  int _selectedIndex = 0;

  // PageController to control the pages
  PageController _pageController = PageController(initialPage: 0);

  // Define your pages
  final List<Widget> _pages = [
    const homeScreen(),
    const reminderScreen(),
    const kennelPage(),
    const eventScreen(),
    const MenuScreen(), // Replace with your actual page widget
  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUSerFromDB();
    remainderGetFromDB();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        // primaryColor: Colors.deepPurple[400],
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          cardColor: Colors.black,
        
        ),
      ),
      home: Scaffold(
     backgroundColor: Color.fromARGB(255, 236, 231, 231) ,
        body: PageView(
          controller: _pageController,
          children: _pages,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        // backgroundColor: Colors.deepPurple[400],
        // you can use the molten bar in the scaffold's bottomNavigationBar
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          
          child: MoltenBottomNavigationBar(
            selectedIndex: _selectedIndex,
            domeHeight: 25 ,
            
            borderRaduis: BorderRadius.circular(85),
            
            // specify what will happen when a tab is clicked
            onTabChange: (clickedIndex) {
              setState(() {
                _selectedIndex = clickedIndex;
              });
              _pageController.animateToPage(
                clickedIndex,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            // ansert as many tabs as you like
            tabs: [
              MoltenTab(
                icon: Icon(Icons.home,size: 35,),
              ),
              MoltenTab(
                icon: Icon(Icons.heart_broken_rounded,size: 35,),
                // title: Text('home'),
              ),
              MoltenTab(
                icon: Icon(FontAwesomeIcons.paw,size: 40,),
              ),
                 MoltenTab(
                icon: Icon(FontAwesomeIcons.notesMedical,size:30),
                // title: Text('home'),
              ),
                 MoltenTab(
                icon: Icon(Icons.menu,size: 35,),
                // title: Text('home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
