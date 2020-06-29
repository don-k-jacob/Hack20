import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Screens/HomePage.dart';
import 'constents.dart';
import 'package:covid/Screens/Maps.dart';
import 'package:covid/Screens/Search.dart';
List<Widget> _pages = [
  Home(),
  Map(),
  Search(),
];
int _selectedIndex = 0;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
Data data;

class _HomePageState extends State<HomePage> {
  @override
   initState()  {
    // TODO: implement initState
    super.initState();
    setState(() {
      covidData();
    });
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).orientation == Orientation.landscape)
    return Scaffold(
      backgroundColor: Colors.black,
      body:Container(
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
//              color: Colors.grey,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width/4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   GestureDetector(
                     onTap: (){
                       _onItemTapped(0);
                     },
                     child: Container(
                       width: MediaQuery.of(context).size.width/3-30,
                       height: MediaQuery.of(context).size.height/10,
                       decoration: BoxDecoration(
                         color:  (_selectedIndex==0)?Colors.blueAccent.withOpacity(0.2):Colors.transparent,
                         border: Border.all(
                           color: Colors.blueAccent,
                           width: 1, //                   <--- border width here
                         ),
                       ),
                       child: Center(
                         child: Text("Global",style: TextStyle(
                           fontFamily: 'Orbitron',
                           fontSize: 20,
                           color:  Colors.blueAccent,
                         ),),
                       ),
                     ),
                   ),

                   GestureDetector(
                     onTap: (){
                       _onItemTapped(1);
                     },
                     child: Container(
                       width: MediaQuery.of(context).size.width/3-30,
                       height: MediaQuery.of(context).size.height/10,
                       decoration: BoxDecoration(
                         color:  (_selectedIndex==1)?Colors.blueAccent.withOpacity(0.2):Colors.transparent,
                         border: Border.all(
                           color: Colors.blueAccent,
                           width: 1, //                   <--- border width here
                         ),
                       ),
                       child: Center(
                         child: Text("Map",style: TextStyle(
                           fontFamily: 'Orbitron',
                           fontSize: 20,
                           color:  Colors.blueAccent,
                         ),),
                       ),
                     ),
                   ),
                   GestureDetector(
                     onTap: (){
                       _onItemTapped(2);
                     },
                     child: Container(
                       width: MediaQuery.of(context).size.width/3-30,
                       height: MediaQuery.of(context).size.height/10,
                       decoration: BoxDecoration(
                         color:  (_selectedIndex==2)?Colors.blueAccent.withOpacity(0.2):Colors.transparent,
                         border: Border.all(
                           color: Colors.blueAccent,
                           width: 1, //                   <--- border width here
                         ),
                       ),
                       child: Center(
                         child: Text("country wise",style: TextStyle(
                           fontFamily: 'Orbitron',
                           fontSize: 20,
                           color:  Colors.blueAccent,
                         ),),
                       ),
                     ),
                   ),
                 ],
              ),
            ),
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(child: _pages[_selectedIndex]),

              ),
            )
          ],
        ),
      ),
    );
    else
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
        child: SafeArea(
          child: Stack(children: [_pages[_selectedIndex],
            Align(
              alignment: Alignment.topRight,
              child: IconButton(icon: Icon(Icons.list,color: Colors.white,), onPressed: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                _onItemTapped(0);
                                Navigator.pop(context);

                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width/3,
                                height: MediaQuery.of(context).size.height/10,
                                decoration: BoxDecoration(
                                  color:  (_selectedIndex==0)?Colors.blueAccent.withOpacity(0.4):Colors.blueAccent.withOpacity(0.2),
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                    width: 1, //                   <--- border width here
                                  ),
                                ),
                                child: Center(
                                  child: Text("Global",style: TextStyle(
                                    fontFamily: 'Orbitron',
                                    fontSize: 20,
                                    color:  Colors.blueAccent,
                                  ),),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: (){
                                _onItemTapped(1);
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width/3,
                                height: MediaQuery.of(context).size.height/10,
                                decoration: BoxDecoration(
                                  color:  (_selectedIndex==1)?Colors.blueAccent.withOpacity(0.4):Colors.blueAccent.withOpacity(0.2),
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                    width: 1, //                   <--- border width here
                                  ),
                                ),
                                child: Center(
                                  child: Text("Map",style: TextStyle(
                                    fontFamily: 'Orbitron',
                                    fontSize: 20,
                                    color:  Colors.blueAccent,
                                  ),),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                _onItemTapped(2);
                                Navigator.pop(context);

                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width/3,
                                height: MediaQuery.of(context).size.height/10,
                                decoration: BoxDecoration(
                                  color:  (_selectedIndex==2)?Colors.blueAccent.withOpacity(0.4):Colors.blueAccent.withOpacity(0.2),
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                    width: 1, //                   <--- border width here
                                  ),
                                ),
                                child: Center(
                                  child: Text("country wise",style: TextStyle(
                                    fontFamily: 'Orbitron',
                                    fontSize: 20,
                                    color:  Colors.blueAccent,
                                  ),),
                                ),
                              ),
                            ),
                          ],
                        )
                      );
                    });
              }),
            ),
          ]),
        ),
        ),
      );
  }
}


