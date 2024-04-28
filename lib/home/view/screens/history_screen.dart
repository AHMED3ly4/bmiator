import 'package:bmiator/auth/data/models/bmi_model.dart';
import 'package:bmiator/auth/view_model/auth_cubit.dart';
import 'package:bmiator/home/view/widgets/reusable_card.dart';
import 'package:bmiator/home/view_model/home_cubit.dart';
import 'package:bmiator/home/view_model/home_states.dart';
import 'package:bmiator/shared/firebase/farebase_utils.dart';
import 'package:bmiator/shared/theming/app_theme.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  static const routeName="/History screen";
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final HomeCubit cubit = HomeCubit();
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
          Expanded(
            child: ReusableCard(
              color: AppTheme.cardColor,
              cardChild:FirestoreListView<BMIModel>(
                query: FirebaseUtils.getBMICollection(user!.id).orderBy("date",descending: true),
                pageSize: 2,
                emptyBuilder: (context) => const Text('No data'),
                errorBuilder: (context, error, stackTrace) => Text(error.toString()),
                loadingBuilder: (context) => const CircularProgressIndicator(color: Colors.white,),
                itemBuilder: (context, doc) {
                  final bmi = doc.data();
                  return Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border:Border.all(color: Colors.white),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(DateFormat('dd/MM/yyyy HH:mm').format(bmi.date)),
                        Text(
                          "${bmi.weight.toString()}KG",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${bmi.height.toString()}CM",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${bmi.statue} (${bmi.grade.toStringAsFixed(2)})",
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}
