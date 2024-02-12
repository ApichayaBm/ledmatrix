import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LED Display'),
        ),
        body: LEDDisplay(),
      ),
    );
  }
}

class LEDDisplay extends StatefulWidget {
  @override
  _LEDDisplayState createState() => _LEDDisplayState();
}

class _LEDDisplayState extends State<LEDDisplay> {
  int _number = 0;

  void _incrementNumber() {
    setState(() {
      if (_number < 99) {
        _number++;
      } else {
        _number = 0;
      }
    });
  }

  void _decrementNumber() {
    setState(() {
      if (_number > 0) {
        _number--;
      } else {
        _number = 99;
      }
    });
  }

  Widget _buildDot(int value) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: value == 0 ? Colors.grey : Colors.blue,
      ),
    );
  }

  Widget _buildRow(List<int> dotList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dotList.map((dot) => _buildDot(dot)).toList(),
    );
  }

  Widget _buildDigit(List<List<int>> rowList) {
    return Column(
      children: rowList.map((row) => _buildRow(row)).toList(),
    );
  }

  Widget _buildDisplay(String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDigit(dotsData[int.parse(value.substring(0, 1))]),
        SizedBox(width: 10),
        _buildDigit(dotsData[int.parse(value.substring(1))]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedNumber = _number.toString().padLeft(2, '0');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _incrementNumber,
          child: Text('+'),
        ),
        SizedBox(height: 10),
        _buildDisplay(formattedNumber),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _decrementNumber,
          child: Text('-'),
        ),
      ],
    );
  }
}

const dotsData = [
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
  ],
];


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'LED Display',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LEDDisplayPage(),
//     );
//   }
// }

// class LEDDisplayPage extends StatefulWidget {
//   @override
//   _LEDDisplayPageState createState() => _LEDDisplayPageState();
// }

// class _LEDDisplayPageState extends State<LEDDisplayPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('LED Display'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // สร้างปุ่มเพิ่มค่า
//             ElevatedButton(
//               onPressed: () {
//                 // เพิ่มโค้ดสำหรับเพิ่มค่าตัวเลข
//               },
//               child: Icon(Icons.add),
//             ),
//             // Widget ที่ได้จาก _buildDisplay()
//             // ปุ่มลดค่า
//             ElevatedButton(
//               onPressed: () {
//                 // เพิ่มโค้ดสำหรับลดค่าตัวเลข
//               },
//               child: Icon(Icons.remove),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// Widget _buildDot(int value) {
//   return Container(
//     width: 10,
//     height: 10,
//     margin: EdgeInsets.all(2),
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       color: value == 1 ? Colors.red : Colors.grey, // จุดสว่าง: สีแดง, จุดมืด: สีเทา
//     ),
//   );
// }

// Widget _buildRow(List<int> dotList) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: dotList.map((dot) => _buildDot(dot)).toList(),
//   );
// }

// Widget _buildDigit(List<List<int>> rowList) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: rowList.map((row) => _buildRow(row)).toList(),
//   );
// }

// Widget _buildDisplay(String value) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       _buildDigit(dotsData[int.parse(value.substring(0, 1))]),
//       SizedBox(width: 10), // ระยะห่างระหว่างตัวเลข
//       _buildDigit(dotsData[int.parse(value.substring(1))]),
//     ],
//   );
// }
// String displayValue = '00';

// void _incrementValue() {
//   int newValue = int.parse(displayValue) + 1;
//   displayValue = (newValue % 100).toString().padLeft(2, '0');
//   setState(() {});
// }

// void _decrementValue() {
//   int newValue = int.parse(displayValue) - 1;
//   if (newValue < 0) {
//     newValue = 99;
//   }
//   displayValue = (newValue % 100).toString().padLeft(2, '0');
//   setState(() {});
// }
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('LED Display'),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: _incrementValue,
//             child: Icon(Icons.add),
//           ),
//           _buildDisplay(displayValue),
//           ElevatedButton(
//             onPressed: _decrementValue,
//             child: Icon(Icons.remove),
//           ),
//         ],
//       ),
//     ),
//   );
// }
