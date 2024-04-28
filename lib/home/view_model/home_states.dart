import 'package:bmiator/auth/data/models/bmi_model.dart';

abstract class HomeStates{}
class HomeInitial extends HomeStates{}

class AddBMILoading extends HomeStates{}
class AddBMISuccess extends HomeStates{}
class AddBMIError extends HomeStates{
  final String errorMessage;

  AddBMIError(this.errorMessage);
}


