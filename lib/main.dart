import 'package:flutter/material.dart';
import 'package:iug_flutter_1/not_found_page.dart';
import 'package:iug_flutter_1/routes.dart';
import 'package:iug_flutter_1/todo/screens/main_page.dart';

import 'package:iug_flutter_1/user_form_page.dart';
import 'package:iug_flutter_1/user_info_page.dart';

void main() {
  runApp(MaterialApp(
    home: MainScreen(),
    routes: {
      RouteNames.userFormPage: (context) => UserFormPage(),
      RouteNames.userInfoPage: (context) => UserInfoPage(),
      RouteNames.pageNotFound: (context) => PageNotFound()
    },
    onGenerateRoute: (RouteSettings settings) {
    String? name =   settings.name;
 
    if(name!.toLowerCase()== RouteNames.userInfoPage.toLowerCase()){
        return MaterialPageRoute(builder: (context) {
          return UserInfoPage();
        });
    }
      
    },

  ));
}
