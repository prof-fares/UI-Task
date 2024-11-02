import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ui_challenge/app/main/main_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await ScreenUtil.ensureScreenSize();
  runApp(DevicePreview(builder: (BuildContext context) { return const MyApp(); },
  ));
}



