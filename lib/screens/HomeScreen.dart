// import 'package:carteirasismepe/screens/Novidades.dart';
// import 'package:carteirasismepe/screens/Principal.dart';
// import 'package:carteirasismepe/screens/Produtos.dart';
// import 'package:carteirasismepe/screens/login.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   PersistentTabController _controller = PersistentTabController(initialIndex: 0);
//   ValueNotifier<bool> _isLoggedIn = ValueNotifier<bool>(false);
//
//   @override
//   void initState() {
//     super.initState();
//     _loadLoggedInState();
//   }
//
//   _HomePageState() {
//     _loadLoggedInState();
//   }
//
//   Future<void> _loadLoggedInState() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     _isLoggedIn.value = token != null;
//     print(_isLoggedIn.value);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<bool>(
//       valueListenable: _isLoggedIn,
//       builder: (context, isLoggedIn, child) {
//         if(isLoggedIn){
//           print(_isLoggedIn.value);
//           return PersistentTabView(
//             context,
//             controller: _controller,
//             screens: _buildScreens(),
//             items: _navBarsItems(),
//             confineInSafeArea: true,
//             backgroundColor: Colors.white, // Default is Colors.white.
//             handleAndroidBackButtonPress: true, // Default is true.
//             resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//             stateManagement: true, // Default is true.
//             hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//             decoration: NavBarDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               colorBehindNavBar: Colors.white,
//             ),
//             popAllScreensOnTapOfSelectedTab: true,
//             popActionScreens: PopActionScreensType.all,
//             itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
//               duration: Duration(milliseconds: 200),
//               curve: Curves.ease,
//             ),
//             screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
//               animateTabTransition: true,
//               curve: Curves.ease,
//               duration: Duration(milliseconds: 200),
//             ),
//             navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
//           );
//         }else{
//           print(_isLoggedIn.value);
//           return login();
//         }
//       },
//     );
//   }
// }
//
// List<Widget> _buildScreens() {
//   return [
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
import 'package:carteirasismepe/models/DadosGlobais.dart';
import 'package:carteirasismepe/screens/Novidades.dart';
import 'package:carteirasismepe/screens/Principal.dart';
import 'package:carteirasismepe/screens/Produtos.dart';
import 'package:carteirasismepe/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

// void main() => runApp(MaterialApp(
//     builder: (context, child) {
//       return Directionality(textDirection: TextDirection.ltr, child: child!);
//     },
//     title: 'GNav',
//     theme: ThemeData(
//       primaryColor: Colors.grey[800],
//     ),
//     home: Example()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  void setIndex(int index) {
    selectedIndex.value = index;
  }



  // int _selectedIndex = dadosGlobais.selectedIndex;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Principal(),
    Produtos(),
    Novidades()
  ];

  @override
  Widget build(BuildContext context) {
    DadosGlobais dadosGlobais = Provider.of<DadosGlobais>(context);

    return ValueListenableBuilder<bool>(
      valueListenable: dadosGlobais.userLogado,
      builder: (context, isLogged, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: _widgetOptions.elementAt(dadosGlobais.selectedIndex.value),
          ),
          bottomNavigationBar: isLogged ? Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
                child: GNav(
                  rippleColor: Colors.blue[300]!,
                  hoverColor: Colors.blue[100]!,
                  tabBorderRadius: 15,
                  tabActiveBorder: Border.all(color: Colors.blue, width: 1),
                  gap: 8,
                  activeColor: Colors.blue,
                  iconSize: 30,
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color:  Colors.grey[300]!,
                  tabs: [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Inicio',
                      textColor: Colors.grey,
                    ),
                    GButton(
                      icon: CupertinoIcons.person_crop_rectangle,
                      text: 'Serviços',
                      textColor: Colors.grey,
                    ),
                    GButton(
                      icon: LineIcons.newspaper,
                      text: 'Novidades',
                      textColor: Colors.grey,
                    ),
                  ],
                  selectedIndex: dadosGlobais.selectedIndex.value,
                  onTabChange: (index) {
                    print(index);
                    setState(() {
                      // _selectedIndex = index;
                      dadosGlobais.atualizarSelectedIndex(index);
                    });
                  },
                ),
              ),
            ),
          ) : login(),
        );
      },
    );
  }

}