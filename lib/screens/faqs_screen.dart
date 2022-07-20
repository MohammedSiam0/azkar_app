import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
  FaqsScreen({Key? key ,this.message}) : super(key: key);
  String? message ;
///  ملاحظة عامة لو حولنا الصفحة هاي ل statefullWidget  ف حنصل للمتغير الي اسمه message  عن طريق
  ///  widget.message


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQS'),
        centerTitle: true,
      ),
      body: Center(
        // عملية تسمى ال null colegen  ,    اذا ما ساوت القيمة اعطيها قيمة افتراضية  No Message
        child: Text(message  ?? 'No Message'),
      ),
    );
  }
}
