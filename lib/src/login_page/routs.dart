
import 'package:flutter/material.dart';
import 'package:plant_disease_detector/src/home_page/home.dart';

abstract class Routs{

  static MaterialPageRoute?  materialPageRoute(RouteSettings settings){
    
    switch(settings.name){
      case '/Loginpage':return MaterialPageRoute(builder: (context)=> const Home());
    }
  }

}