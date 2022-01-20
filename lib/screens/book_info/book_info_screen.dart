import 'package:flutter/material.dart';

import 'components/body.dart';

class CreateBookInfoScreen extends StatefulWidget {
  const CreateBookInfoScreen({Key? key}) : super(key: key);

  @override
  _CreateBookInfoScreenState createState() => _CreateBookInfoScreenState();
}

class _CreateBookInfoScreenState extends State<CreateBookInfoScreen> {
  int step = 0;
  int prevStep = -1;
  final maxStep = 5;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(appBar: buildAppBar(), body: Body(step: step)),
      onWillPop: () async {
        bool result = _onBackPressed();
        return await Future.value(result);
      },
    );
  }

  bool _onBackPressed() {
    if (step > 0) {
      setState(() {
        prevStep = step;
        step--;
      });
    } else {
      Navigator.of(context).pop();
    }

    return false;
  }

  void plusStep() {
    setState(() {
      prevStep = step;
      step++;
    });
  }

  AppBar buildAppBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.red),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              if (step > 0) {
                setState(() {
                  step--;
                });
              } else {
                Navigator.of(context).pop();
              }
            }));
  }
}
