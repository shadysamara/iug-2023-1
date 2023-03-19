import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iug_flutter_1/info_arguemnt.dart';
import 'package:iug_flutter_1/user_form_page.dart';

class UserInfoPage extends StatelessWidget {
  InfoArguments? infoArguments;
  @override
  Widget build(BuildContext context) {
  infoArguments =   ModalRoute.of(context)?.settings.arguments as InfoArguments?;
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Name"),
            subtitle: Text(infoArguments?.name ?? ""),
          ),
          ListTile(
            title: Text("Gender"),
            subtitle: Text(infoArguments?.gender ?? ''),
          ),
          ListTile(
            title: Text("Certifications"),
            subtitle: Text(infoArguments?.certifications == null
                ? ""
                : infoArguments!.certifications.fold<String>(
                    "",
                    (previousValue, element) =>
                        previousValue + (element.name + ", "))),
          ),
        ],
      ),
    );
  }
}
