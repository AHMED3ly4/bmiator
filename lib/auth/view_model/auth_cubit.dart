
import 'package:bmiator/auth/data/models/user_model.dart';
import 'package:bmiator/auth/view_model/auth_states.dart';
import 'package:bmiator/shared/firebase/farebase_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthViewModel extends Cubit<AuthStates>{
  AuthViewModel() : super(AuthInitial());
  UserModel? currentUser;


  Future<void> login(String email,String password) async {
    emit(LoginLoading());
    try{
      final user = await FirebaseUtils.login(email, password);
      currentUser =user;
      emit(LoginSuccess());
    }catch(exception){
      if(exception is FirebaseAuthException){
        emit(LoginError(exception.message!));
      }else{
        emit(LoginError("can not login"));
      }
    }
  }

  Future<void> register(String email,String name,String password) async {
    emit(RegisterLoading());
    try{
      final user = await FirebaseUtils.register(name, email, password);
      currentUser =user;
      emit(RegisterSuccess());
    }catch(exception){
      if(exception is FirebaseAuthException){
        print(exception.message);
        emit(RegisterError(exception.message!));
      }else{
        emit(LoginError("can not register"));
      }
    }
  }


}