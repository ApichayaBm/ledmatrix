import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 177, 187, 243),
        appBar: AppBar(
          title: Text('CP-SU LED MATRIX'),
          titleTextStyle: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 95, 173),
        ),
        body: LEDMatrixCounter(),
      ),
    );
  }
}

class LEDMatrixCounter extends StatefulWidget {
  @override
  _LEDMatrixCounterState createState() => _LEDMatrixCounterState();
}

class _LEDMatrixCounterState extends State<LEDMatrixCounter> {
  int _number = 0;

  // 0 = จุดมืด (LED off), 1 = จุดสว่าง (LED on)
  List dotsData = [
    // Digit 0
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 1
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
    ],
    // Digit 2
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Digit 3
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 4
    [
      [0, 0, 0, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 1, 0, 1, 0],
      [1, 0, 0, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 0],
    ],
    // Digit 5
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 6
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 7
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
    ],
    // Digit 8
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 9
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.0, color: Colors.white),
                borderRadius: BorderRadius.circular(64.0),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_drop_up, size: 75, color: Color.fromARGB(255, 51, 50, 50)),
                onPressed: () {
                  setState(() {
                    _number = (_number + 1) % 100;
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black, 
                border: Border.all(width: 13.0, color: Colors.white),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    _buildDigit(((_number ~/ 10) % 10)),
                    SizedBox(width: 35.0),
                    _buildDigit((_number % 10)),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.0, color: Colors.white),
                borderRadius: BorderRadius.circular(64.0),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_drop_down, size: 75, color: Color.fromARGB(255, 51, 50, 50)),
                onPressed: () {
                  setState(() {
                    _number = (_number - 1) < 0 ? 99 : (_number - 1) % 100;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDigit(int digit) {
    return Column(
      children: _buildRow(dotsData[digit]),
    );
  }


  List<Widget> _buildRow(List<List<int>> values) {
    return values.map((row) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: row.map((value) {
          return _buildDot(value);
        }).toList(),
      );
    }).toList();
  }

  Widget _buildDot(int value) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: value == 1
            ? Color.fromARGB(255, 226, 91, 219)
            : Color.fromARGB(255, 45, 45, 46),
      ),
      margin: EdgeInsets.all(1),
    );
  }
}
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('CP-SU LED MAXTRIX'),
//         ),
//         body: LEDDisplay(),
//       ),
//     );
//   }
// }

// class LEDDisplay extends StatefulWidget {
//   @override
//   _LEDDisplayState createState() => _LEDDisplayState();
// }

// class _LEDDisplayState extends State<LEDDisplay> {
//   int _number = 0;

//   void _incrementNumber() {
//     setState(() {
//       if (_number < 99) {
//         _number++;
//       } else {
//         _number = 0;
//       }
//     });
//   }

//   void _decrementNumber() {
//     setState(() {
//       if (_number > 0) {
//         _number--;
//       } else {
//         _number = 99;
//       }
//     });
//   }

//   Widget _buildDot(int value) {
//     return Container(
//       width: 20,
//       height: 20,
//       margin: const EdgeInsets.all(2),
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: value == 0 ? Color.fromARGB(98, 68, 67, 67) : Color.fromARGB(237, 172, 223, 54)    ),//31, 20, 19, 19
//     );
//   }

//     Widget _buildRow(List<int> dotList) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: dotList.map((dot) => _buildDot(dot)).toList(),
//     );
//   }
//   Widget _buildDigit(List<List<int>> rowList) {
//     return Column(
//       children: rowList.map((row) => _buildRow(row)).toList(),
//     );
//   }

//   Widget _buildDisplay(String value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _buildDigit(dotsData[int.parse(value.substring(0, 1))]),
//         SizedBox(width: 10),
//         _buildDigit(dotsData[int.parse(value.substring(1))]),
//       ],
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     String formattedNumber = _number.toString().padLeft(2, '0');
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ElevatedButton(
//           onPressed: _incrementNumber,
//           child: Text('+'),
//         ),
//         SizedBox(height: 30),
//         _buildDisplay(formattedNumber),
//         SizedBox(height: 30),
//         ElevatedButton(
//           onPressed: _decrementNumber,
//           child: Text('-'),
//         ),
//       ],
//     );
//   }
// }

//   const dotsData = [
//   // Digit 0
//   [
//     [0, 1, 1, 1, 0],
//     [1, 0, 0, 0, 1],
//     [1, 0, 0, 0, 1],
//     [1, 0, 0, 0, 1],
//     [1, 0, 0, 0, 1],
//     [1, 0, 0, 0, 1],
//     [0, 1, 1, 1, 0],
//   ],
//   // Digit 1
//   [
//     [0, 0, 1, 0, 0],
//     [0, 1, 1, 0, 0],
//     [0, 0, 1, 0, 0],
//     [0, 0, 1, 0, 0],
//     [0, 0, 1, 0, 0],
//     [0, 0, 1, 0, 0],
//     [0, 1, 1, 1, 0],
//   ],
//   // Digit 2
//   [
//     [0, 1, 1, 1, 0],
//     [1, 0, 0, 0, 1],
//     [0, 0, 0, 0, 1],
//     [0, 0, 0, 1, 0],
//     [0, 0, 1, 0, 0],
//     [0, 1, 0, 0, 0],
//     [1, 1, 1, 1, 1],
//   ],
//   // Digit 3
//   [
//     [0, 1, 1, 1, 0],
//     [1, 0, 0, 0, 1],
//     [0, 0, 0, 0, 1],
//     [0, 1, 1, 1, 0],
//     [0, 0, 0, 0, 1],
//     [1, 0, 0, 0, 1],
//     [0, 1, 1, 1, 0],
//   ],
//   // Digit 4
//   [
//     [0, 0, 0, 1, 0],
//     [0, 0, 1, 1, 0],
//     [0, 1, 0, 1, 0],
//     [1, 0, 0, 1, 0],
//     [1, 1, 1, 1, 1],
//     [0, 0, 0, 1, 0],
//     [0, 0, 0, 1, 0],
//   ],
//   // Digit 5
//   [
//     [1, 1, 1, 1, 1],
//     [1, 0, 0, 0, 0],
//     [1, 1, 1, 1, 0],
//     [0, 0, 0, 0, 1],
//     [0, 0, 0, 0, 1],
//     [1, 0, 0, 0, 1],
//     [0, 1, 1, 1, 0],
//   ],
//   // Digit 6
//   [
//     [0, 1, 1, 1, 0],
//     [1, 0, 0, 0, 1],
//     [1, 0, 0, 0, 0],
//     [1, 1, 1, 1, 0],
//     [1, 0, 0, 0, 1],
//     [1, 0, 0, 0, 1],
//     [0, 1, 1, 1, 0],
//   ],
//   // Digit 7
//   [
//     [1, 1, 1, 1, 1],
//     [0, 0, 0, 0, 1],
//     [0, 0, 0, 1, 0],
//     [0, 0, 1, 0, 0],
//     [0, 1, 0, 0, 0],
//     [0, 1, 0, 0, 0],
//     [0, 1, 0, 0, 0],
//   ],
//   // Digit 8
//   [
//     [0, 1, 1, 1, 0],
//     [1, 0, 0, 0, 1],
//     [1, 0, 0, 0, 1],
//     [0, 1, 1, 1, 0],
//     [1, 0, 0, 0, 1],
//     [1, 0, 0, 0, 1],
//     [0, 1, 1, 1, 0],
//   ],
//   // Digit 9
//   [
//     [0, 1, 1, 1, 0],
//     [1, 0, 0, 0, 1],
//     [1, 0, 0, 0, 1],
//     [0, 1, 1, 1, 1],
//     [0, 0, 0, 0, 1],
//     [1, 0, 0, 0, 1],
//     [0, 1, 1, 1, 0],
//   ],
// ];
