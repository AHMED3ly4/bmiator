import 'package:bmiator/auth/view_model/auth_cubit.dart';
import 'package:bmiator/home/view/widgets/history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatefulWidget {
  static const routeName="/History screen";
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {


  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthViewModel>(context).currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('history'),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              'Your History',
              style: TextStyle(fontSize: 50),
            ),
          ),
          HistoryList(userId: user!.id),
        ],
      ),
    );
  }
}


