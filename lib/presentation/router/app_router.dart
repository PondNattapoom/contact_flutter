import 'package:flutter/material.dart';
import '/presentation/index.dart';

class AppRouter {
  static final routeScreens = <String, WidgetBuilder>{
    CounterDemo.id: (context) => const CounterDemo(),
    ContactCubitList.id: (context) => const ContactCubitList(),
    ContactCubitDetails.id: (context) => const ContactCubitDetails(),
    ContactCubitAdd.id: (context) => ContactCubitAdd(),
    ContactCubitEdit.id: (context) => ContactCubitEdit(),
  };
}
