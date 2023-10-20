import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/alert_page.dart';
import 'package:flutter_application_1/screens/animated_container.dart';
import 'package:flutter_application_1/screens/avatar_page.dart';
import 'package:flutter_application_1/screens/card_page.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_application_1/screens/input_page.dart';
import 'package:flutter_application_1/screens/lista_page.dart';
import 'package:flutter_application_1/screens/slider_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListaPage()
  };
}
