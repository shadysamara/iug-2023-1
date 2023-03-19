import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(child: Text("The Page you asked is not found",style: TextStyle(fontSize: 30),),),
    );
  }
}
