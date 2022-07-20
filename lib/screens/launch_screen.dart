import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override // OnCreate
  void initState() {
    super.initState();
    // TODO: Navigate to HomeScreen after 3 seconds
    Future.delayed(Duration(seconds: 5), () {
      // مدير الانتقالات navigator انتقال عبر راوت بالاسم بيتم فقط استبدال الواجهة والمحافظة على السابقة
      //  Navigator.pushNamed(context, '/home_screen');
      // ازالة الشاشة الحالية واستبدلها بالجديدة بدون المقدرة على الروجع لها
      Navigator.pushReplacementNamed(context, '/home_screen');
      // بتزيل الرجوع بس بتبين لما تنتقل من الشاشة الاولة للشاشة الثانية في سواد الي هوا المتيريال
      // Navigator.popAndPushNamed(context,'/home_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [
              Color(0xFF495C83),
              Color(0xFFA8A4CE),
            ])),
        child: Text('تطبيق  المسبحة ',
            style: GoogleFonts.almarai(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}
