import 'package:flutter/material.dart';
import 'package:mvvm/resources/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(false);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _obscurePassword.dispose();
  _emailController.dispose();
  _emailFocusNode.dispose();
  _passwordController.dispose();
  _passwordFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
  final authViewModel = Provider.of<AuthViewModel>(context);
    final height= MediaQuery.of(context).size.height *1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              labelText: 'Email',
              prefixIcon: Icon(Icons.alternate_email)
            ),
            onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
            },
          ),
            ValueListenableBuilder(valueListenable: _obscurePassword, builder: (context,value,child){
              return
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: _obscurePassword.value,
                  decoration:  InputDecoration(
                      hintText: 'Enter your password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      suffixIcon: InkWell(
                          onTap:(){
                            _obscurePassword.value = !_obscurePassword.value;},
                          child: Icon(_obscurePassword.value?Icons.visibility_off_outlined:
                          Icons.visibility_outlined))
                  ),
                );
            }),
          SizedBox(height: height*0.085,),
          RoundButton(title: 'Login',
              loading: authViewModel.loading,
              onPress: (){
            if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage("please enter email", context);
            }else if(_passwordController.text.isEmpty){
              Utils.flushBarErrorMessage("please enter password", context);

            }
            else if(_passwordController.text.length<6){
              Utils.flushBarErrorMessage("please enter 6 digit password", context);

            }
            else{
              Map data ={
                "email": _emailController.text.toString(),
                "password": _passwordController.text.toString(),
              };
                authViewModel.loginApi(data,context);
                  print('api hit');
            }
          }),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.SignUp);
            },
            child: Text("Dont have an account? Sign Up"),)
        ],
      ),
    );
  }
}
