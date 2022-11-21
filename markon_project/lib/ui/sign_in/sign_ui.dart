import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:markon_project/theme/colors.dart';

class SignInUI extends StatefulWidget {
  const SignInUI({super.key});

  @override
  State<SignInUI> createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  final GFBottomSheetController tcontroller = GFBottomSheetController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MarkonBlue,
      bottomSheet: GFBottomSheet(
        controller: tcontroller,
        maxContentHeight: 150,
        stickyHeaderHeight: 100,
        stickyHeader: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)]),
          child: const GFListTile(
            avatar: GFAvatar(
              backgroundImage: AssetImage('assets image here'),
            ),
            titleText: 'Title',
            //subtitleText: 'Sub Title goes here',
          ),
        ),
        contentBody: Container(
          height: 200,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: const [
              Center(
                  child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
                style: TextStyle(
                    fontSize: 15, wordSpacing: 0.3, letterSpacing: 0.2),
              ))
            ],
          ),
        ),
        stickyFooter: Container(
          color: GFColors.SUCCESS,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Call us',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Email us',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
        stickyFooterHeight: 50,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: GFColors.SUCCESS,
          child: tcontroller.isBottomSheetOpened
              ? Icon(Icons.keyboard_arrow_down)
              : Icon(Icons.keyboard_arrow_up),
          onPressed: () {
            tcontroller.isBottomSheetOpened
                ? tcontroller.hideBottomSheet()
                : tcontroller.showBottomSheet();
          }),
    );
  }
}
