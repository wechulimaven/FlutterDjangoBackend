import 'package:app/api/apointmentApi.dart';
import 'package:app/api/cartApi.dart';
import 'package:app/api/tutorApi.dart';
import 'package:app/dependencies/colorScheme.dart';
import 'package:app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/cartscreen.dart';
import 'screens/tutordetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => TutorProvider(),
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TutorProvider()),
        ChangeNotifierProvider.value(value: cartProvider()),
        ChangeNotifierProvider.value(value: AppointmentProvider()),
      ],
      child: MaterialApp(
          title: 'Online Class',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(),
          routes: {
            '/HomePage': (context) => Home(),
            '/tutorsPage': (context) => DetailPage(),
            '/cart': (context) => CartScreen(),
          }),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tutorP = Provider.of<TutorProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tution App'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: tutorP.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    tutorP.deleteTutor(tutorP.items[index]);
                  }),
              title: Text(
                tutorP.items[index].tutor_name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                tutorP.items[index].description,
                style: TextStyle(fontSize: 15, color: Colors.black),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (ctx) => AddTodoScreen()));
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightblue,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gokids.COM",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'circe'),
                  ),
                  Text(
                    "Skip",
                    // onTap: openHomePage,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'circe'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/splash.png'),
                      fit: BoxFit.contain)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "WHERE KIDS LOVE LEARNING",
                    style: TextStyle(fontSize: 12, fontFamily: 'circe'),
                  ),
                  Text(
                    "Distant Learning & Home \nSchooling Made Easy",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'circe'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Book Filtered Top Rated Professional \nTutors from the comfort \nOf your home in just a few clicks",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'circe'),
                    textAlign: TextAlign.center,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 15,
                            color: Colors.black.withOpacity(0.1),
                          )),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: darkblue,
                        ),
                        child: IconButton(
                          onPressed: openHomePage,
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void openHomePage() {
    Navigator.pushNamed(context, '/HomePage');
  }
}
