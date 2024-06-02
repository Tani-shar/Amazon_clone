import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:amazon_clone_tutorial/features/account/screens/account_screen.dart';
import 'package:amazon_clone_tutorial/features/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottombarwidth = 42.0; ///
  double bottombarborderwidth = 5; ///
  List<Widget> pages = [
    const HomeScreen(),
    const Account_screen(),
     
    const Center(child: Text(
      'Cart Page',
    ),
    )
  ]; 
  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //home
          BottomNavigationBarItem(
            label: '',
            icon: Container(
            width: bottombarwidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page==0 ? GlobalVariables.selectedNavBarColor
                :GlobalVariables.backgroundColor,
                
                width: bottombarborderwidth,
              ))
            ),
            child: const Icon(Icons.home_outlined),
            
          )),
          //cart
          BottomNavigationBarItem(
            label: '',
            icon: Container(
            width: bottombarwidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page==1 ? GlobalVariables.selectedNavBarColor
                : GlobalVariables.backgroundColor,
                width: bottombarborderwidth,
              ))
            ),
            child: const badges.Badge(
              badgeContent: Text('2'),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.white
              ),
              
              child:Icon(Icons.shopping_cart_outlined)),
            
          )),
          //account
          BottomNavigationBarItem(
            label: '',
            icon: Container(
            width: bottombarwidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page==2 ? GlobalVariables.selectedNavBarColor
                : GlobalVariables.backgroundColor,
                width: bottombarborderwidth,
              ))
            ),
            child: const Icon(Icons.person_2_outlined  ),
            
          )),
         
        ]
      ),
    );
  }
}