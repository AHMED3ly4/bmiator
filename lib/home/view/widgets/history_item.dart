import 'package:bmiator/auth/data/models/bmi_model.dart';
import 'package:bmiator/auth/view_model/auth_cubit.dart';
import 'package:bmiator/home/view/screens/edit_screen.dart';
import 'package:bmiator/home/view_model/home_cubit.dart';
import 'package:bmiator/home/view_model/home_states.dart';
import 'package:bmiator/shared/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    required this.bmi,
    required this.homeCubit,
  });

  final BMIModel bmi;
  final HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border:Border.all(color: Colors.white),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(DateFormat('dd/MM/yyyy HH:mm').format(bmi.date)),
              const Spacer(),
              IconButton(onPressed: (){
                Navigator.pushNamed(context,
                  EditScreen.routeName  ,
                  arguments: bmi
                );
              }, icon: Icon(Icons.edit)),
              BlocBuilder<HomeCubit,HomeStates>(
                bloc: homeCubit,
                  builder: (context, state) {
                    if(state is DeleteBMILoading){
                      return const CircularProgressIndicator();
                    }if(state is DeleteBMIError){
                      UIUtils.showMessage(state.errorMessage);
                    }
                    return IconButton(onPressed: ()async{
                      final userId=BlocProvider.of<AuthViewModel>(context).currentUser!.id;
                      await homeCubit.deleteBMI(
                        userId,
                        bmi.id,
                      );
                      homeCubit.getBMIs(userId);
                    },
                        icon: const Icon(Icons.delete)
                    );
                  },
              ),
            ],
          ),
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
  }
}