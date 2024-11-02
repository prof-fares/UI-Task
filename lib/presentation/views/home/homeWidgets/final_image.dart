import 'package:flutter/material.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_assets.dart';

class FinalImage extends StatelessWidget {
  const FinalImage({super.key});

  @override
  Widget build(BuildContext context) {
     return Image.asset(AppAssets.oneCar,fit: BoxFit.fitWidth,height: MediaQuery.sizeOf(context).height*0.35,);
  }
}