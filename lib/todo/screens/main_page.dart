import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iug_flutter_1/todo/screens/all_tasks.dart';
import 'package:iug_flutter_1/todo/screens/complete_tasks.dart';
import 'package:iug_flutter_1/todo/screens/incomplete_tasks.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> titles = ["All Tasks", "Complete Tasks", "InComplete Tasks"];

  int currentPageIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                accountName: Text("Omar"),
                accountEmail: Text("omar@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/image0.jpg'),
                )),
            ListTile(
              title: Text("All Tasks"),
              subtitle: Text("Go To All Tasks Screen"),
              leading: Icon(Icons.list),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                pageController.jumpToPage(0);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Complete Tasks"),
              subtitle: Text("Go To  Complete Screen"),
              leading: Icon(Icons.done),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                pageController.jumpToPage(1);
                 Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("InComplete Tasks"),
              subtitle: Text("Go To InComplete Screen"),
              leading: Icon(Icons.cancel),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                pageController.jumpToPage(2);
                 Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            pageController.jumpToPage(value);
            currentPageIndex = value;
            setState(() {});
          },
          currentIndex: currentPageIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "All Tasks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.done), label: "Complete Tasks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.cancel), label: "InComplete Tasks")
          ]),
      appBar: AppBar(
        title: Text(titles[currentPageIndex]),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          currentPageIndex = value;
          setState(() {});
        },
        children: [AllTasks(), CompleteTasks(), InCompleteTasks()],
      ),
    );
  }
}
