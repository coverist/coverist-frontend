
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../info_Publishe.dart';

class movePage extends StatelessWidget {
  const movePage({
    Key? key, required this.str1 ,required this.str2   
  }) : super(key: key);

  final String str1;
  final String str2;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: (){
      switch (str2) {
        case "1":
            Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => InfoLogo()));
            break;  
        case "2":
             Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => InfoLogo()));  
          break;
      }     
           },
            child: Text(str1),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              )
            )
    );
  }
}



