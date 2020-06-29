import 'package:covid/Charts/Chart.dart';
import 'package:covid/constents.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  bool isShowingMainData;
  String date;
  int  confirmed;
  int deaths;
  int recovered;
  void updateUI(dynamic data) {
    print(data);
    if(data== null){
      date='null';
      confirmed=0;
      deaths=0;
      recovered=0;
      return;

    }
    setState(() {
      date=data['date'];
      confirmed = data['confirmed'];
      deaths = data['deaths'];
      recovered =data['recovered'];
    });
  }
  void getCountary(String name)async{
    if(name!=null){
      var data= await dataModel.getCountaryData(name);
      print(data.last);
      updateUI(data.last);
    }
  }
  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
    setState(() {
      getCountary(name);
    });
  }
  @override
  Widget build(BuildContext context) {
    return DataCard(name);
  }

  Container DataCard(String string) {
    name=string;
    return Container(

      color: Colors.black,
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(18)),
//                gradient: LinearGradient(
//                  colors: const [
//                    Color(0xff2c274c),
//                    Color(0xff46426c),
//                  ],
//                  begin: Alignment.bottomCenter,
//                  end: Alignment.topCenter,
//                ),
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(
                        height: 37,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${name}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                            child: (MediaQuery.of(context).orientation == Orientation.landscape)?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Card(
                                  elevation: 10,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.red.withOpacity(0.5),
                                      borderRadius:
                                      new BorderRadius.all(Radius.circular(10)),
                                    ),
                                    height: MediaQuery.of(context).size.height/5,
                                    width: MediaQuery.of(context).size.width/4,
                                    child: Center(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Deaths',
                                            style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)
                                        ),
                                        Divider(color: Colors.black, thickness: 3,),
                                        SizedBox(height: 50,),
                                        Text('${deaths}', style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),)
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  elevation: 10,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.purple.withOpacity(0.5),
                                      borderRadius:
                                      new BorderRadius.all(Radius.circular(10)),
                                    ),
                                    height: MediaQuery.of(context).size.height/5,
                                    width: MediaQuery.of(context).size.width/4,
                                    child: Center(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Confirmed',
                                            style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)
                                        ),
                                        Divider(color: Colors.black, thickness: 3,),
                                        SizedBox(height: 50,),
                                        Text('${confirmed}', style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),)
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  elevation: 10,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.green.withOpacity(0.5),
                                      borderRadius:
                                      new BorderRadius.all(Radius.circular(10)),
                                    ),
                                    height: MediaQuery.of(context).size.height/5,
                                    width: MediaQuery.of(context).size.width/4,
                                    child: Center(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Recovered',
                                            style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)
                                        ),
                                        Divider(color: Colors.black, thickness: 3,),
                                        SizedBox(height: 50,),
                                        Text('${recovered}', style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),)
                                      ],
                                    )),
                                  ),
                                ),
                              ],
                            )
                                :Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Card(
                                  elevation: 10,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.red.withOpacity(0.5),
                                      borderRadius:
                                      new BorderRadius.all(Radius.circular(10)),
                                    ),
                                    height: MediaQuery.of(context).size.height/5,
                                    width: MediaQuery.of(context).size.width/4,
                                    child: Center(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Deaths',
                                            style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)
                                        ),
                                        Divider(color: Colors.black, thickness: 3,),
                                        SizedBox(height: 50,),
                                        Text('${deaths}', style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),)
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  elevation: 10,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.purple.withOpacity(0.5),
                                      borderRadius:
                                      new BorderRadius.all(Radius.circular(10)),
                                    ),
                                    height: MediaQuery.of(context).size.height/5,
                                    width: MediaQuery.of(context).size.width/4,
                                    child: Center(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Confirmed',
                                            style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)
                                        ),
                                        Divider(color: Colors.black, thickness: 3,),
                                        SizedBox(height: 50,),
                                        Text('${confirmed}', style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),)
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  elevation: 10,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.green.withOpacity(0.5),
                                      borderRadius:
                                      new BorderRadius.all(Radius.circular(10)),
                                    ),
                                    height: MediaQuery.of(context).size.height/5,
                                    width: MediaQuery.of(context).size.width/4,
                                    child: Center(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Recovered',
                                            style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)
                                        ),
                                        Divider(color: Colors.black, thickness: 3,),
                                        SizedBox(height: 50,),
                                        Text('${recovered}', style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),)
                                      ],
                                    )),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.white.withOpacity(
                          isShowingMainData ? 1.0 : 0.5),
                    ),
                    onPressed: () {
                      setState(() {
                        isShowingMainData = !isShowingMainData;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}