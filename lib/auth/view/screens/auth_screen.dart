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
      appBar: AppBar(
        title: const Text(
          "Bmiator",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 40,),
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
            Expanded(child: tabs[currentIndex]),
          ],
        ),
      ),
    );
  }
}
