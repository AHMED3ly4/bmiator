abstract class AuthStates{}
class AuthInitial extends AuthStates{}

class LoginLoading extends AuthStates{}
class LoginError extends AuthStates{
  final String errorMessage;

  LoginError(this.errorMessage);

}
class LoginSuccess extends AuthStates{}

class RegisterLoading extends AuthStates{}
class RegisterError extends AuthStates{
  final String errorMessage;

  RegisterError(this.errorMessage);
}
class RegisterSuccess extends AuthStates{}