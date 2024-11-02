import 'package:flutter/material.dart';

extension SpacerExtension on num{
  Widget get spacerHight => SizedBox(height: toDouble(),);
  Widget get spacerWidth =>SizedBox(width: toDouble(),);
}