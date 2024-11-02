import 'package:flutter/material.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_styles.dart';

class DetailDiscription extends StatelessWidget {
  final String?mark;
  final String?killo;

  const DetailDiscription({super.key,required this.mark,required this.killo});
  @override
  Widget build(BuildContext context) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
          Text("$mark بحالة جيده",style: AppStyles.boldBlueStyle(context),),
          Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(text: "$killo",style: AppStyles.bigBoldBlackStyle(context)),
            TextSpan(text: " د.ك",style: AppStyles.boldBlueStyle(context)),

          ]))
        ],);
  }
}