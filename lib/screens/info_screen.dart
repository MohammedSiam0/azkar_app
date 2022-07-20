import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({Key? key}) : super(key: key);
  String _messageLocal = 'No Message';

  @override
  Widget build(BuildContext context) {
    //  في ال Model Route  يتم استقبال البيانات لانه المسوؤل عن عمليات ال route
    // ال of  بترجع null  ف بنحط للعملية ?  علشان يساوي الي جاي ونعمل عليه if
    //ModalRoute modelRoute =ModalRoute.of(context);
    ModalRoute? modelRoute = ModalRoute.of(context);
    // عملية تحقق اذا ال model Route  بتساوي null  واساسا ال of  بتعطي null
   // if (modelRoute != null) {
    //  هلوقت بدنا نعمل فحص علشان لو كان ال arguments فاضي ما يعمل مشكلة تسمى  InternalLinked
    if (modelRoute != null && modelRoute.settings.arguments != null) {
      // هذا السطر بخليني اول لل arguments  الموجود في الصفحة الي بعتت البيانات
      // modelRoute.settings.arguments ;
      // لو بدي ابعت اكثر من بيانات بنستخدم
      //  ال Map  بتستقبل بيانات كثيرة بس برضه في مشكلة انه بتساوي object  مع Map  يعني مساحات مختلفة ف بنعمل عملية downcasting
      // هلوقت الmap  بتجيب البيانات ال String  وكمان احتياط حطينا dynamic
      // عملية downcasting عبارة عن : as  مع العملية
      // هلوقت برضه صح فحصنا اذا فاضي بس برضه بعتبر فاضي {} علشانها Map  ف بنعمل فحص ثاني
      // الفحص عبارة عن انه  ال arguments هي  Map  لانه الفحص الاول برجع InternalLinked وانا بقارن Map مش InternalLinked
      Map<String, dynamic> map =
          modelRoute.settings.arguments as Map<String, dynamic>;
      // اذا  كان map  الي بالصفحة الاولة (Home Screen) فيه key  اسمه message ف خليلي المتغير ال messageLocal بيساوي المتغير الي جاي
      if(map.containsKey('message')){
        _messageLocal = map['message'];
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('عن التطبيق '),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            // هذا السطر يعني عكس عملية ال PupNamed  عن طريق الرابط pop يعني الرجوع للصفحة
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
          child: Text(
            _messageLocal,
        style: GoogleFonts.nunito(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      )),
    );
  }
}
