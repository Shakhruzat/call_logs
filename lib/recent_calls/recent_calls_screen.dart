import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:call_logs/recent_calls/call_item.dart';
import 'package:flutter/services.dart';
import '../styles/colors.dart';
import 'package:http/http.dart'as http;
class RecentCalls extends StatefulWidget {
  const RecentCalls({Key? key}) : super(key: key);

  @override
  State<RecentCalls> createState() => _RecentCallsState();
}

class _RecentCallsState extends State<RecentCalls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          'Журнал звонков',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: AppColor.appBar,//const Color(0xffF9F9FB),

        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: AppColor.appBar,//Color(0xffF9F9FB),

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),

      ),
      body:
      FutureBuilder<http.Response>(
        future: http.get(Uri.parse('https://raw.githubusercontent.com/Gammadov/data/main/calls/call_logs.json')),
          builder: (context, snapshot) {
          final decoded = jsonDecode(snapshot.data!.body);

          /*List <Widget> cards = [];
          for (int i = 0; i<decoded.length; i++){
            final single_map = decoded[i];
            cards.add(CallCard(
            call: single_map['person'] + '('+single_map['count'].toString() +')',
            additional: single_map['additional'],
            date: single_map['date'],
            ));
          }*/

          return ListView.builder(
            itemCount: decoded.length,
              itemBuilder: (context, index) {
            final single_map = decoded[index];
            return CallCard(
                call: single_map['person'] + '('+single_map['count'].toString() +')',
            additional: single_map['additional'],
            date: single_map['date'],);
          });
            //(children: cards);
            //CallCard(date: 'Вчера'),
            //CallCard(call: 'Дядя Ваня (3)'),

            //Text(snapshot.data!.body),] );
        //return CallCard(additional:'FaceTime video');
      }),

    );
  }
}


