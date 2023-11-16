import 'package:flutter/material.dart';
import 'package:bmi/bmi_model.dart';
import 'package:bmi/result_screen.dart';
import 'package:flutter/cupertino.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;
  double _bmi = 0.0;

  late BMIModel _bmiModel;

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
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: const Icon(
                      CupertinoIcons.heart,
                      size: 200.0,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'คำนวณ BMI',
                    style: TextStyle(
                        color: Colors.red[600],
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'About Your Health',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    'ความสูง (ซ.ม.)',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 24.0,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                    child: Slider(
                      min: 80.0,
                      max: 200.0,
                      onChanged: (height) {
                        setState(() {
                          _heightOfUser = height;
                        });
                      },
                      value: _heightOfUser,
                      divisions: 100,
                      activeColor: Colors.red,
                      label: '$_heightOfUser',
                    ),
                  ),
                  Text(
                    '$_heightOfUser ซ.ม.',
                    style: TextStyle(
                        color: Colors.red[600],
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'น้ำหนัก (กิโลกรัม)',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 24.0,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                    child: Slider(
                      min: 30.0,
                      max: 150.0,
                      onChanged: (height) {
                        setState(() {
                          _weightOfUser = height;
                        });
                      },
                      value: _weightOfUser,
                      divisions: 100,
                      activeColor: Colors.red,
                      label: '$_weightOfUser',
                    ),
                  ),
                  Text(
                    '$_weightOfUser กิโลกรัม',
                    style: TextStyle(
                        color: Colors.red[600],
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                    //color: Colors.pink[100],
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _bmi = _weightOfUser / ((_heightOfUser / 100) * (_heightOfUser / 100)) ;
                          if (_bmi >= 18.5 && _bmi <= 25) {
                            _bmiModel = BMIModel(
                                bmi: _bmi,
                                isNormal: true,
                                comments: 'ร่างกายคุณแข็งแรงมาก',
                                advice: 'คุณร่างกายแข็งแรงดีแล้ว'
                            );

                          } else if (_bmi < 18.5) {
                            _bmiModel = BMIModel(
                                bmi: _bmi,
                                isNormal: false,
                                comments: 'คุณมีน้ำหนักน้อยเกินไป',
                                advice: 'คุณควรที่จะกินให้มากกว่านี้และออกกำลังกายอย่างน้อยอาทิตย์ละ5ครั้ง'
                            ) ;
                          } else if (_bmi > 25 && _bmi <= 30) {
                            _bmiModel = BMIModel(
                                bmi: _bmi,
                                isNormal: false,
                                comments: 'คุณมีน้ำหนักเกิน',
                                advice: 'คุณควรที่จะกินให้น้อยลงกว่านี้และออกกำลังกายอย่างน้อยอาทิตย์ละ5ครั้ง'
                            ) ;
                          } else {
                            _bmiModel = BMIModel(
                                bmi: _bmi,
                                isNormal: false,
                                comments: 'คุณอ้วน',
                                advice: 'คุณควรที่จะกินให้น้อยลงกว่านี้และออกกำลังกายอย่างน้อยอาทิตย์ละ5ครั้ง'
                            );
                          }
                        });
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ResultScreen(bmiModel: _bmiModel,)
                        ));
                      },
                      child: const Text(
                        'คำนวณ',
                        style: TextStyle(color: Colors.red, fontSize: 30.0),
                      ),
                    ),

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
