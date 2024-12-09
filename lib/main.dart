import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_property_management_system/screens/home_screen.dart';
import 'package:sleek_property_management_system/screens/property_list_screen.dart';
import 'blocs/property_bloc.dart';
import 'blocs/property_event.dart';
import 'const/constant.dart';
import 'services/api_service.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PropertyBloc(apiService: ApiService())..add(LoadProperties()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sleek Property Management System',
        theme: ThemeData(
            scaffoldBackgroundColor: secondaryColor,
            brightness: Brightness.light
        ),
        home: MainScreen(),
        //home: PropertyListScreen(),
      ),
    );
  }
}
