

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:task/register_screen.dart';



void main(){
  runApp(MyApp());

}




class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
      return  MaterialApp(
      debugShowCheckedModeBanner: false,
        home: RegisterScreen(),

      );

  }

}

