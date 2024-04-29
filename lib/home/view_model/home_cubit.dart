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

  Future<void> getBMIs(String userId,[DateTime? lastBmiDate]) async {
    emit(GetBMIsLoading());
    try{
      final history = await FirebaseUtils.getBMIs(userId,lastBmiDate);
      emit(GetBMIsSuccess(history!));
    }catch(error){
      emit(GetBMIsError("can not get history"));
    }
  }

  Future<void> deleteBMI(String userId,String bmiId) async {
    emit(DeleteBMILoading());
    try{
      await FirebaseUtils.deleteBMI(userId, bmiId);
      emit(DeleteBMISuccess());
    }catch(error){
      emit(DeleteBMIError("can not delete this"));
    }
  }

  Future<void> editBMI(String userId,BMIModel bmi) async {
    emit(EditBMILoading());
    try{
      await FirebaseUtils.editBMI(userId, bmi);
      emit(EditBMISuccess());
    }catch(error){
      emit(EditBMIError("can not edit"));
    }
  }


}