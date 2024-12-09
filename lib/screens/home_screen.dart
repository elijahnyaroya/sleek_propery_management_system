import 'package:flutter/material.dart';
import 'package:sleek_property_management_system/screens/add_properties.dart';
import 'package:sleek_property_management_system/screens/property_list_screen.dart';
import 'package:sleek_property_management_system/widgets/side_menu_widget.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
            children: [
              const Expanded(
                flex: 3,
                  child: SizedBox(
                    child: SideMenuWidget(),
                  )
              ),
              Expanded(
                  flex: 9,
                  child: AddPropertyPage()
              )
            ],
          )
      ),
    );
  }
}
