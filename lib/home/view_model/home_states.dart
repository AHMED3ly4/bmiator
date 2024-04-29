import 'package:bmiator/auth/data/models/bmi_model.dart';

abstract class HomeStates{}
class HomeInitial extends HomeStates{}

class AddBMILoading extends HomeStates{}
class AddBMISuccess extends HomeStates{}
class AddBMIError extends HomeStates{
  final String errorMessage;

  AddBMIError(this.errorMessage);
}

class GetBMIsLoading extends HomeStates{}
class GetBMIsSuccess extends HomeStates{
  final List<BMIModel> history;

  GetBMIsSuccess(this.history);
}
class GetBMIsError extends HomeStates{
  final String errorMessage;

  GetBMIsError(this.errorMessage);
}

class DeleteBMILoading extends HomeStates{}
class DeleteBMISuccess extends HomeStates{}
class DeleteBMIError extends HomeStates{
  final String errorMessage;

  DeleteBMIError(this.errorMessage);
}

class EditBMILoading extends HomeStates{}
class EditBMISuccess extends HomeStates{}
class EditBMIError extends HomeStates{
  final String errorMessage;

  EditBMIError(this.errorMessage);
}


