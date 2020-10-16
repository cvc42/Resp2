import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  //get variables

  runApp(PatientCard());
}

class PatientCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget demographics = Container(
      margin: const EdgeInsets.only(left: 12.0, right: 12.0),
      padding: const EdgeInsets.all(12),
      //demographics and vital columns:
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0x99f5e6bc),
              border: Border.all(color: Colors.black38, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            //demographics column
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 8, top: 8, left: 12, right: 24),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Age: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Gender: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Race: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 8, top: 8, left: 12, right: 24),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '27',
                          ),
                          Text(
                            'F',
                          ),
                          Text(
                            'Black',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0x99f5e6bc),
              border: Border.all(color: Colors.black38, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 8, top: 8, left: 12, right: 24),
                  child: Text(
                    'Temperature: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 8, left: 12, right: 24),
                  child: Text(
                    'Respiratory Rate: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 8, left: 12, right: 24),
                  child: Text(
                    'Blood Pressure: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 8, left: 12, right: 24),
                  child: Text(
                    'O\u2082 Saturation:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(bottom: 8, left: 12, right: 24),
                  child: Text(
                    'O\u2082 Received:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget patientHistory = Container(
      margin: const EdgeInsets.only(left: 12.0, right: 12.0),
      decoration: BoxDecoration(
        color: const Color(0x99f5e6bc),
        border: Border.all(color: Colors.black38, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Age: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Gender: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Race: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.wb_sunny, 'ORDER X-RAYS'),
          _buildButtonColumn(color, Icons.folder_shared, 'ORDER TESTS')
        ],
      ),
    );

    return MaterialApp(
      title: 'Patient Chart',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xffe34646),
          title: Text('Patient Chart'),
        ),
        body: ListView(
          children: [
            Padding(padding: EdgeInsets.only(top: 16.0)),
            demographics,
            Padding(padding: EdgeInsets.only(top: 16.0)),
            patientHistory,
            Padding(padding: EdgeInsets.only(top: 16.0)),
            buttonSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
