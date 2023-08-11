import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  TextEditingController cont = TextEditingController();
  GlobalKey<FormState> keyName = GlobalKey();
  bool isPassword = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key:keyName,
          child: Column(
            children: [
              // SizedBox(height: 10,),
              // Image.asset("assets/images/logo.png"),
              // SizedBox(height: 10,),
              // Text(
              //   "We are happy to see you",
              //   style: TextStyle(
              //       color:  Color(0xff828282),
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500
              //   ),
              // ),
              // SizedBox(height: 20,),
              // Text(
              //   "Sign In ",
              //   style: TextStyle(
              //       color:  Color(0xff29AAE1),
              //       fontSize: 20,
              //       fontWeight: FontWeight.w600
              //   ),
              // ),
              // SizedBox(height: 10,),
              // Divider(
              //   color: Colors.black,
              //   height: 10,
              // ),
              // SizedBox(height: 20,),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     "password ",
              //     style: TextStyle(
              //         color:  Color(0xff29AAE1),
              //         fontSize: 20,
              //         fontWeight: FontWeight.w600
              //     ),
              //   ),
              // ),
              // SizedBox(height: 20,),
              // TextFormField(
              //   controller: cont,
              //   validator: (value) {
              //     if(value!.isEmpty){
              //       return "password  empty";
              //     }else{
              //       return null;
              //     }
              //   },
              //   obscureText: isPassword,
              //   decoration: InputDecoration(
              //     border:OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //       borderSide: BorderSide(color: Colors.black)
              //     ),
              //     focusedBorder:OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12),
              //         borderSide: BorderSide(color: Colors.red)
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12),
              //         borderSide: BorderSide(color: Colors.yellow)
              //     ),
              //     suffixIcon:IconButton(
              //       onPressed:(){
              //        setState(() {
              //          isPassword = ! isPassword;
              //        });
              //         print(isPassword);
              //       },
              //      icon: Icon(
              //        isPassword? Icons.visibility_off: Icons.visibility,
              //        color: Colors.black,
              //        size: 25,
              //      )
              //     ) ,
              //     prefixIcon:Icon(
              //       Icons.lock,
              //       size: 25,
              //       color: Colors.black,
              //     ) ,
              //   ),
              // ),
              // SizedBox(height: 20,),
              // InkWell(
              //   onTap: () {
              //    if(keyName.currentState!.validate()){
              //      print("Validate");
              //      print(cont.text);
              //    }else{
              //      print("NotValidate");
              //      print(cont.text);
              //    }
              //   },
              //   child: Container(
              //     width: double.infinity,
              //     height: 56,
              //     alignment: Alignment.center,
              //     decoration:BoxDecoration (
              //      border: Border.all(color: Colors.blue),
              //       borderRadius: BorderRadius.circular(20)
              //     ),
              //     child:   Text(
              //       "Sign In ",
              //       style: TextStyle(
              //           color:  Color(0xff29AAE1),
              //           fontSize: 20,
              //           fontWeight: FontWeight.w600
              //       ),
              //     ),
              //   ),
              // )
              // Expanded(
              //   child:
              //   ListView.separated(
              //    //scrollDirection: Axis.horizontal,
              //     itemCount: 100,
              //     physics:BouncingScrollPhysics() ,
              //    itemBuilder: (context, index) {
              //      return const Text(
              //        "Welcome To",
              //        style: TextStyle(
              //            color:  Color(0xff333333),
              //            fontSize: 24,
              //            fontWeight: FontWeight.w700
              //        ),
              //      );
              //    },
              //    separatorBuilder: (context, index) {
              //      return const Text(
              //        "from separatorBuilder ",
              //        style: TextStyle(
              //            color:  Colors.red,
              //            fontSize: 24,
              //            fontWeight: FontWeight.w700
              //        ),
              //      );
              //    },
              //   ),
              // ),
              Expanded(
                flex:3 ,
                  child:
                 GridView.builder(
                   itemCount: 5,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     crossAxisSpacing: 10,
                     mainAxisSpacing: 10,
                   ),
                   itemBuilder: (context, index) {
                     return
                       Container(
                       width: 50,
                       height: 50,
                       color: Colors.yellow,
                     );
                   },
                 ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
