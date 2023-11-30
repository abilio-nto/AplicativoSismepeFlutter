//
// import 'package:carteirasismepe/screens/Novidades.dart';
// import 'package:carteirasismepe/screens/Principal.dart';
// import 'package:carteirasismepe/screens/Produtos.dart';
// import 'package:carteirasismepe/screens/login.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
// class BarraDeNavegacao extends StatefulWidget {
//   const BarraDeNavegacao({Key? key}) : super(key: key);
//
//   @override
//   State<BarraDeNavegacao> createState() => _BarraDeNavegacaoState();
// }
//
// class _BarraDeNavegacaoState extends State<BarraDeNavegacao> {
//   PersistentTabController _controller = PersistentTabController(initialIndex: 0);
//   ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);
//   bool _isLoggedIn = false;
//
//   _BarraDeNavegacaoState() {
//     _loadLoggedInState();
//   }
//
//   Future<void> _loadLoggedInState() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     setState(() {
//       _isLoggedIn = token != null;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//       if(_isLoggedIn){
//         return PersistentTabView(
//           context,
//           controller: _controller,
//           screens: _buildScreens(),
//           items: _navBarsItems(),
//           onItemSelected: (index) {
//             print(index);// Adicione esta linha
//             selectedIndex.value = index; // Adicione esta linha
//           },
//           confineInSafeArea: true,
//           backgroundColor: Colors.white, // Default is Colors.white.
//           handleAndroidBackButtonPress: true, // Default is true.
//           resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//           stateManagement: true, // Default is true.
//           hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//           decoration: NavBarDecoration(
//             borderRadius: BorderRadius.circular(10.0),
//             colorBehindNavBar: Colors.white,
//           ),
//           popAllScreensOnTapOfSelectedTab: true,
//           popActionScreens: PopActionScreensType.all,
//           itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
//             duration: Duration(milliseconds: 200),
//             curve: Curves.ease,
//           ),
//           screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
//             animateTabTransition: true,
//             curve: Curves.ease,
//             duration: Duration(milliseconds: 200),
//           ),
//           navBarStyle: NavBarStyle.style9, // Choose the nav bar style with this property.
//         );
//       }else{
//         return login();
//       }
//   }
// }
// List<Widget> _buildScreens() {
//   return [
//     // CodeScanner(),
//     // dashBoard()
//     Principal(),
//     Produtos(),
//     Novidades()
//   ];
// }
//
// List<PersistentBottomNavBarItem> _navBarsItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.home),
//       title: "Inicio",
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.person_crop_rectangle),
//       title: "Produtos",
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.news_solid),
//       title: "Novidades",
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//   ];
// }
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

// void main() => runApp(MaterialApp(
//     builder: (context, child) {
//       return Directionality(textDirection: TextDirection.ltr, child: child!);
//     },
//     title: 'GNav',
//     theme: ThemeData(
//       primaryColor: Colors.grey[800],
//     ),
//     home: Example()));

class BarraDeNavegacao extends StatefulWidget {
  @override
  _BarraDeNavegacaoState createState() => _BarraDeNavegacaoState();
}

class _BarraDeNavegacaoState extends State<BarraDeNavegacao> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        title: const Text('GoogleNavBar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Likes',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}