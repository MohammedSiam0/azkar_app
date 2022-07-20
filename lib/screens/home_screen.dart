import 'package:azkar_app/screens/faqs_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // زيادة في عدد التسبيح
  int _counter = 0;

  // المحتوى او المقارنة الرسمية في المحتوى
  String _content = 'استغفر الله ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'مسبحة الاذكار  ',
          style: GoogleFonts.almarai(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,

        //  pushNamedاخفاء زر الرجوع الي موجود ديفولت مع
        //  automaticallyImplyLeading: false ,
        //   pushReplacementNamed , true  مع خاصية الاستبدال لا يوجد زر من الاساس حتى لو كان
        automaticallyImplyLeading: true,
        actions: [
          // الشكل الديفولت لل Pop up Menu Button
          //  PopupMenuButton(itemBuilder: itemBuilder)
          //  PopupMenuButton ( itemBuilder: (context) { return [   PopupMenuItem()    ]}),
          PopupMenuButton<String>(onSelected: (String value) {
            // اعملت شرط ادا المحتوى ما بساوي ال value  يخلي المحتوى نفس قيمة ال value  ويحط التسبيح صفر
            if (_content != value) {
              setState(() {
                _content = value;
                _counter = 0;
              });
            }
          }, itemBuilder: (context) {
            return [
              PopupMenuItem(
                height: 20,
                value: 'استغفر الله',
                child: Text(
                  'استغفر الله',
                  style: GoogleFonts.arefRuqaa(),
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                height: 20,
                value: 'الحمد الله',
                child: Text(
                  'الحمد الله',
                  style: GoogleFonts.arefRuqaa(),
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                height: 20,
                value: 'سبحان الله',
                child: Text(
                  // 'سبحان الله ',
                  'سبحان الله',
                  style: GoogleFonts.arefRuqaa(),
                ),
              ),
            ];
          }),

          // اضافة ايقونة على شكل زر فقط للانتقال
          IconButton(
            // ال  Icon Botton بتاخد شغلتين onPressed()  , Icon
            onPressed: () {
              // ال navigator هوا المسؤول عن الانتقال  push Named  هوا انه انتقلل عن طريق الرابط الي موجود في صفحة main
              // ال arguments بتساعد على نقل بيانات
              Navigator.pushNamed(
                context, '/Info_screen',
                // حتى لو ما ممرت القيمة هنا ف ال if  الي حكيتها في صفحة info  بتحل المشاكل كلها
                //  arguments: {} ,
                arguments: {'message': 'Info Screen'},
                // لو بدنا نشيل الفحص من صفحة info  تبع انه يساويلي بين ال map  او  ال InternalLinked ف بهاي الطريقة عرفت انه map  لانه محددة القيم
                //  arguments:  <String ,dynamic> {} ,
              );
            },
            icon: const Icon(Icons.info),
          ),
          // زر الانتقال بطريقة ال push
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //  builder: (context) => FaqsScreen(),
                  // بدي امرر البيانات عبر الكنستركتور
                  builder: (context) => FaqsScreen(message: 'Faqs Screen '),
                ),
              );
            },
            icon: const Icon(Icons.question_answer),
          )
        ],
      ),
      body: Container(
        // ال Container بيعطيني خاصية التدرج اللوني
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            end: AlignmentDirectional.topStart,
            begin: AlignmentDirectional.bottomEnd,
            colors: [Colors.grey, Colors.blueGrey],
          ),
        ),

        child: Column(
          // هاي علشان تحل مشكلة تقلص ال column
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  // color: Color(0xFFE4DCCF),
                  color: Colors.white,
                  // طريقة الاولة لعمل Container  من rectangle الي circle
                  shape: BoxShape.circle,
                  // الطريقة  الثانية  لعمل Container  من rectangle الي circle
                  // shape: BoxShape.rectangle,
                  // borderRadius: BorderRadius.circular(35)
                  /*image: const DecorationImage(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0OSUMb4-m2yakmNZAt7xfG_KJOOA4JOtslw&usqp=CAU'),
                  ),
                  */
                  image: const DecorationImage(
                    image: AssetImage('images/maspaha.jpg'),
                  ),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black45,
                      blurRadius: 6,
                      offset: Offset(0, 6),
                    ),
                    BoxShadow(
                      // شفافية من 0 ل 255
                      //color: Colors.pink.withAlpha(100),
                      // شفافية من 0 ل 1
                      // color: Colors.pink.withOpacity(0.5),
                      color: const Color(0xFFE4DCCF).withOpacity(0.5),
                      blurRadius: 6,
                      offset: const Offset(0, -6),
                    ),
                  ]),
            ),
            Container(
              // هذا السطر بخلي كل اشي بارز عن الابو مقصوص يعني ما في اشي بارز
              clipBehavior: Clip.antiAlias,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 6,
                      offset: Offset(0, 0),
                    ),
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      //'استغفر الله ',
                      _content,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.arefRuqaa(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    color: const Color(0xFFE4DCCF),
                    child: Text(
                      // علشان عندي المغير int  وال  text  بقبلش غغير String  حطينا المتغير مع ال toString
                      _counter.toString(),
                      style: GoogleFonts.arefRuqaa(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            // ال Stack  هي طبقات وبتعطينا حريقة استخدام يعني كل عنصر بطبقة

            /*const Positioned(
            bottom: 10,
            // لما ضفنا الleft and right  خلينا العنصر بالنص وتحت
            left: 10,
            right: 10,
            child: Text(
              'تجميعة',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
                fontFamily: 'Fcairo',
              ),
            ),
          )
            */
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      // اعطاء خصائص للزر
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFE4DCCF),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        // الاثنين نفس العملية بتزيد واحد
                        //_counter += 1;
                        // ++_counter;
                        // set State المسؤولة عن تغير المحتوى والتحديث حسب تغير المستخدم
                        // setState( ()=> {++_counter});
                        // setState( ()=> ++_counter);

                        //Ephemeral State Management
                        //SingleScreen State Management
                        //Internal State Management
                        //Local State State Management
                        //StateFull State Management
                        setState(() {
                          ++_counter; // الفاصلة المنقطة توضع فقط عند ازالة ال = >
                        });
                      },
                      child: Text(
                        'تسبيح ',
                        style: GoogleFonts.arefRuqaa(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0XFFB7D3DF),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _counter =
                              0; // الفاصلة المنقطة توضع فقط عند ازالة ال = >
                        });
                      },
                      child: Text(
                        'اعادة ',
                        style: GoogleFonts.arefRuqaa(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // ازر العائم الي بكون اسفل اتطبيق 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _counter += 1);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
