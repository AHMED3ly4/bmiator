import 'package:bmiator/auth/view/widgets/default_elevated_button.dart';
import 'package:bmiator/auth/view/widgets/default_text_form_field.dart';
import 'package:bmiator/auth/view_model/auth_cubit.dart';
import 'package:bmiator/auth/view_model/auth_states.dart';
import 'package:bmiator/home/view/screens/home_screen.dart';
import 'package:bmiator/shared/utils/ui_utils.dart';
import 'package:bmiator/shared/utils/viladators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginTab extends StatelessWidget {
  LoginTab({super.key});
  final _formKey =GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             DefaultTextFormField(
                label: "Email",
              controller: emailController,
              validator: (value){
                  if(Validator.isEmail(value) && value != null){
                    return null;
                  }
                  return "Un valid mail";
              },
            ),
             DefaultTextFormField(
                label: "Password",
              controller: passwordController,
              validator: (text){
                  if(Validator.hasMinLength(text, 6)){
                    return null;
                  }
                  return "password must be more than 6 characters";
              },
              obscure: true,
            ),
            const SizedBox(height: 80,),
            BlocListener<AuthViewModel,AuthStates>(
                listener: (_, state) {
                  if(state is LoginError){
                    UIUtils.showMessage(state.errorMessage);
                  }else if(state is LoginLoading){
                    UIUtils.showLoading(context);
                  }else if(state is LoginSuccess){
                    UIUtils.hideLoading(context);
                    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                  }
                },
              child: DefaultElevatedButton(
                label: "Sign in",
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    BlocProvider.of<AuthViewModel>(context).login(emailController.text, passwordController.text);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
