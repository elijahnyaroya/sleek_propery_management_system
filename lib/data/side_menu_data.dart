import 'package:flutter/material.dart';

import '../model/menu_model.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.add, title: 'Add Property'),
    MenuModel(icon: Icons.temple_hindu, title: 'Properties'),
    MenuModel(icon: Icons.logout, title: 'SignOut'),
  ];
}