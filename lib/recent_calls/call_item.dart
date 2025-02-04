import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/text_styles.dart';

class CallCard extends StatefulWidget {
  final String call;
  final String additional;
  final String date;
  const CallCard({Key? key,
    this.call = '+0 (000) 000-00-00',
    this.additional = 'Доп. информация',
    this.date = 'Дата',
  }) : super(key: key);

  @override
  State<CallCard> createState() => _CallCardState();
}

class _CallCardState extends State<CallCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 14, top: 15, right: 14, bottom: 31),
            child: Icon(
              Icons.phone_forwarded,
              color: AppColor.tertiary,
              //Color(0xFFC4C4C6),
              size: 14,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(widget.call,
                    style: AppTextStyle.bold17()),
                      // TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                Text(widget.additional, style: AppTextStyle.regular15()),
                //TextStyle(color:AppColor.secondary, //Color(0xff8A8A8D),
                    //fontSize: 15)),
              ],
            ),
          ),
           Text(widget.date, style: AppTextStyle.regular15()),
              //TextStyle(color: AppColor.secondary,//Color(0xff8A8A8D),
              //fontSize: 15)),
          IconButton(
              padding: const EdgeInsets.only(left: 8, right: 21),
              onPressed: () => Navigator.pushNamed(context, '/info'),
              icon: const Icon(
                Icons.info_outlined,
                color:AppColor.link, //Color(0xff3478f6),
                size: 22,
              )),
        ],
      ),
    );
  }
}

