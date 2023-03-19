import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iug_flutter_1/info_arguemnt.dart';
import 'package:iug_flutter_1/routes.dart';
import 'package:iug_flutter_1/user_info_page.dart';

class UserFormPage extends StatefulWidget {
  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  String gender = "";
  bool isDark = false;
  TextEditingController nameController = TextEditingController();
  List<Certificate> certifications = [
    Certificate("Diploma"),
    Certificate("Ba"),
    Certificate("Master"),
    Certificate("PHD"),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      data: isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(title: Text("User Form"), actions: [
          Switch(
              value: isDark,
              onChanged: (val) {
                isDark = val;
                setState(() {});
              })
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Text("Name:   "),
                    Expanded(
                        child: TextField(
                      controller: nameController,
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Text("Gender:   "),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: "m",
                                groupValue: gender,
                                onChanged: (v) {
                                  gender = "m";
                                  setState(() {});
                                }),
                            Text('Male')
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "f",
                                groupValue: gender,
                                onChanged: (v) {
                                  gender = "f";
                                  setState(() {});
                                }),
                            Text('FeMale')
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Text("Certifications:   "),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: certifications.map((e) {
                          return Row(
                            children: [
                              Checkbox(
                                  value: e.isSelected,
                                  onChanged: (v) {
                                    e.isSelected = !e.isSelected;
                                    setState(() {});
                                  }),
                              Text(e.name)
                            ],
                          );
                        }).toList())
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    String name = nameController.text;
                    String genderValue = gender == "m" ? "Male" : "Female";
                    List<Certificate> selectedCertifications = certifications
                        .where((element) => element.isSelected)
                        .toList();

                    InfoArguments infoArguments = InfoArguments(
                        name, genderValue, selectedCertifications);
                    Navigator.of(context).pushNamed('SCREEN10', arguments: infoArguments);
                  },
                  child: Text("Send")),
            ],
          ),
        ),
      ),
    );
  }
}

class Certificate {
  String name;
  bool isSelected = false;
  Certificate(this.name);
}
