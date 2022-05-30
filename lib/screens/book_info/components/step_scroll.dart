// //stepper vertical & 상하 스크롤

// import 'package:flutter/material.dart';

// import 'info_title.dart';
// import 'info_tag.dart';
// import 'info_genre_main.dart';
// import 'info_publisher.dart';

// import '/widgets/book_info/step_button_widget.dart';

// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   int _index = 0;
//   String? stepText = '다음';

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: (MediaQuery.of(context).size.height),
//         width: (MediaQuery.of(context).size.width),
//         decoration: BoxDecoration(
//           color: Colors.black,
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage('images/back_image2.png'),
//             // opacity: 0.3,
//             // .blurred(blur: 3, blurColor: Colors.white), // 배경 이미지
//           ),
//         ),
//         child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Container(
//                 child: Stepper(
//               type: StepperType.vertical,
//               currentStep: _index,
//               controlsBuilder: (context, ControlsDetails details) {
//                 return Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     StepButton(
//                         step: _index,
//                         onPressedPrev: details.onStepCancel!,
//                         onPressedNext: details.onStepContinue!),
//                   ],
//                 );
//               },
//               onStepCancel: () {
//                 if (_index > 0) {
//                   setState(() {
//                     _index -= 1;
//                   });
//                 }
//               },
//               onStepContinue: () {
//                 String inputText = '';

//                 if (_index <= 3) {
//                   setState(() {
//                     _index += 1;
//                   });
//                 }
//               },
//               onStepTapped: (int index) {
//                 setState(() {
//                   _index = index;
//                 });
//               },
//               steps: <Step>[
//                 Step(
//                     title: StepText('제목&저자명', 0),
//                     content: InfoTitle(),
//                     isActive: _index > 0,
//                     state: StepState.complete),
//                 Step(
//                     title: StepText('장르', 0),
//                     content: InfoGenre(),
//                     isActive: _index > 1,
//                     state: StepState.complete),
//                 Step(
//                     title: StepText('태그', 0),
//                     content: InfoTag(),
//                     isActive: _index > 2,
//                     state: StepState.complete),
//                 Step(
//                     title: StepText('출판사', 20),
//                     content: InfoLogo(),
//                     isActive: _index > 3,
//                     state: StepState.complete),
//               ],
//             ))));
//   }

//   StepText(String str, double rPad) {
//     return Padding(
//         padding: EdgeInsets.fromLTRB(0, 0, rPad, 0),
//         child: Text(
//           str,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             // fontWeight: FontWeight.bold
//           ),
//           textAlign: TextAlign.center,
//         ));
//   }
// }
