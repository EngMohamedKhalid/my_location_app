import 'package:flutter/material.dart';
import 'package:my_location_app/features/ad_mob_module/ad_mob_screen.dart';
import 'package:my_location_app/features/auth_feature/presentation/login_feature/user_login_screen.dart';
import 'package:my_location_app/features/auth_feature/presentation/screens/home_screen.dart';

class BNBScreen extends StatefulWidget {
  const BNBScreen({super.key});

  @override
  State<BNBScreen> createState() => _BNBScreenState();
}

class _BNBScreenState extends State<BNBScreen> {
  int index = 0;
  List<Widget> screens=[
    UserLoginScreen(),
    AdMobScreen(),
    HomeScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: BottomNavigationBar(
      // backgroundColor: Colors.red,
       currentIndex: index,
       onTap: (value) {
         setState(() {
           index = value;
         });
         print(index);
       },
       items: [
         BottomNavigationBarItem(
             icon:Icon(
                 Icons.home,
               size: 20,
             ) ,
           label: "Home"
         ),
         BottomNavigationBarItem(
             icon:Icon(
                 Icons.card_travel,
               size: 20,
             ) ,
        label: "Cart"
         ),
         BottomNavigationBarItem(
             icon:Icon(
                 Icons.person,
               size: 20,
             ) ,
           label: "Profile"
         ),
       ],
     ),
     floatingActionButton: Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
           bottomLeft: Radius.circular(20),
           bottomRight: Radius.circular(20),
         ),
             color: Colors.blue
       ),
       child:  Icon(
           Icons.plus_one,
           size: 35,
       ),
     ),
     floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
     body: screens[index],
    );
  }
}
