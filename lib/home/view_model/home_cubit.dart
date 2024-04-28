import 'package:bmiator/auth/data/models/bmi_model.dart';
import 'package:bmiator/home/view_model/home_states.dart';
import 'package:bmiator/shared/firebase/farebase_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitial());

  Future<void> addBmi(String userId,BMIModel bmi) async {
    emit(AddBMILoading());
    try{
      FirebaseUtils.addBMI(userId, bmi);
      emit(AddBMISuccess());
    }catch(error){
      emit(AddBMIError("cannot add bmi"));
    }
  }




}