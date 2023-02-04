import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notes_pages.dart';



class MainScreen extends StatefulWidget {
  static const String id = 'main-Screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget currentScreen =const NotesPage() ;

  int index = 0;

  final PageStorageBucket _bucket = PageStorageBucket();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: (){
          return Future.value(false);
        },
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: const Color(0xff675492),
            child: PageStorage(
              bucket: _bucket,
              child: currentScreen,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: const Color(0xffF0F0FA),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    setState(() {
                      index = 0;
                      currentScreen =const NotesPage();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotatedBox(
                          quarterTurns: 2,
                          child:index == 0? Container(
                              height: 28,
                              width: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset('assets/images/menu-2.png',color: Colors.white,),
                              )):Image.asset('assets/images/menu-2.png',height: 18,color: Colors.grey,)

                      ),
                      const SizedBox(height: 4,),
                      Text(
                        'Notes',
                        style: TextStyle(
                          color: index == 0 ? Colors.black : Colors.grey,
                          fontWeight: index == 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    setState(() {
                      index = 1;
                      currentScreen =const NotesPage();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      index == 1? Container(
                          height: 28,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset('assets/images/star.png',color: Colors.white,),
                          )):Image.asset('assets/images/star.png',height: 18,color: Colors.grey,),
                      const SizedBox(height: 4,),
                      Text(
                        'Favorites',
                        style: TextStyle(
                          color: index == 1 ? Colors.black : Colors.grey,
                          fontWeight: index == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    setState(() {
                      index = 2;
                      currentScreen =const NotesPage();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      index == 2? Container(
                          height: 28,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset('assets/images/check.png',color: Colors.white,),
                          )):Image.asset('assets/images/check.png',height: 18,color: Colors.grey,),
                      const SizedBox(height: 4,),
                      Text(
                        'To-doc',
                        style: TextStyle(
                          color: index == 2 ? Colors.black : Colors.grey,
                          fontWeight: index == 2
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 35,
                  onPressed: () {
                    setState(() {
                      index = 3;
                      currentScreen =const NotesPage();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      index == 3? Container(
                          height: 28,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset('assets/images/setting.png',color: Colors.white,),
                          )):Image.asset('assets/images/setting.png',height: 18,color: Colors.grey,),
                      const SizedBox(height: 4,),
                      Text(
                        'Settings',
                        style: TextStyle(
                          color: index == 3 ? Colors.black : Colors.grey,
                          fontWeight: index == 3
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
