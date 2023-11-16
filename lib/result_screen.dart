import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bmi_model.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.bmiModel}) : super(key: key);
  final bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: bmiModel.isNormal
                      ? const Icon(
                    CupertinoIcons.smiley,
                    size: 200.0,
                    color: Colors.red,
                  )
                      : const Icon(
                    Icons.heart_broken_sharp,
                    size: 200.0,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  'ค่าBMIของคุณคือ ${bmiModel.bmi.round()}',
                  style: TextStyle(
                      color: Colors.red[600],
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  '${bmiModel.comments}',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 16.0,),
                bmiModel.isNormal
                    ? Text(
                  'ค่าBMI ของคุณอยู่ในภาวะปกติ',
                  style: TextStyle(
                      color: Colors.red[600],
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700),
                )
                    :
                Text(
                  'ค่าBMI ของคุณอยู่ในภาวะไม่ปกติ',
                  style: TextStyle(
                      color: Colors.red[600],
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 36.0,),
                Text(
                  'คำแนะนำ : ${bmiModel.advice}',
                  style: TextStyle(
                      color: Colors.blueAccent[600],
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 36.0,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                  //color: Colors.pink[100],
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'กลับหน้าแรก',
                      style: TextStyle(color: Colors.red, fontSize: 30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
