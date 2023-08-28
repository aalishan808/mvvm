import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
 static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
  static void fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode next
      ){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
  static void flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
          padding: EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(8),
          message: message,
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.TOP,
          reverseAnimationCurve: Curves.easeInOut,
          duration: Duration(seconds: 3),
          positionOffset: 20,
          icon: Icon(Icons.error,size: 28,color: Colors.white,),
        )..show(context)
    );
  }
  static snackBar(String message ,BuildContext context){
   return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(message),
       backgroundColor: Colors.red,
       )
   );
  }

}
