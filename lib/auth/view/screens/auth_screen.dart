import 'package:bmiator/auth/view/tabs/login_tab.dart';
import 'package:bmiator/auth/view/tabs/register_tab.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const routeName='/';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int currentIndex=0;
  List<Widget> tabs=[
    LoginTab(),
    RegisterTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset("assets/images/logo.png"),
                    DefaultTabController(
                      length: 2,
                      initialIndex: currentIndex,
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        indicatorColor: Theme.of(context).primaryColor,
                        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                        onTap: (index){
                          currentIndex= index;
                          setState(() {});
                        },
                        tabs: const [
                          Tab(child:Text("Login",style: TextStyle(fontSize: 25),) ,),
                          Tab(child:Text("Register",style: TextStyle(fontSize: 25),) ,),
                        ],
                      ),
                    ),
                  ],
                ),
                tabs[currentIndex],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
