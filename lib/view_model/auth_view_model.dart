
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signUpLoading = false;
  bool get signuploading =>_signUpLoading;
  setSignUpLoading(bool value){
    _signUpLoading  = value;
    notifyListeners();

  }
  setLoading(bool value){
    _loading  = value;
    notifyListeners();

  }

  Future<void> loginApi(dynamic data, BuildContext context) async{
    setLoading(true);
  _myRepo.loginApi(data).then((value){
    setLoading(false);
    Utils.flushBarErrorMessage("Login Successful", context);
    Navigator.pushNamed(context, RoutesName.home);
  }).onError((error, stackTrace) {
    setLoading(false);
  if(kDebugMode) {
    print(error.toString());
    Utils.flushBarErrorMessage(error.toString(), context);
  }
  }
  );
  }
  Future<void> SignUpApi(dynamic data, BuildContext context) async{
    setSignUpLoading(true);
    _myRepo.signupApi(data).then((value){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage("SignUp Successful", context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if(kDebugMode) {
        print(error.toString());
        Utils.flushBarErrorMessage(error.toString(), context);
      }
    }
    );
  }
}