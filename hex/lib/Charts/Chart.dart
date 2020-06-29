import 'package:covid/Charts/networking/data.dart';
import 'package:covid/Screens/HomePage.dart';
import 'package:covid/constents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LineChartSample1 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}
DataModel dataModel = DataModel();
class LineChartSample1State extends State<LineChartSample1> {
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
  void getCountary()async{
    if(name!=null){
      List data= await dataModel.getCountaryData(name);
      print(data.last);
      updateUI(data.last);
    }
  }
  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
    setState(() {
      getCountary();
    });
  }
  @override
  Widget build(BuildContext context) {
    getCountary();
//    if (cData == null) {
//      LineChartSample1();
//      return Center(
//        child: SpinKitRotatingCircle(color: Colors.white),
//
//      );
//    }
    return Container(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          Container(
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
                      height: 10,
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

                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child:SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
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
                                  width: MediaQuery.of(context).size.width/5,
                                  child: Center(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Deaths',
                                          style: TextStyle(fontSize: fontSize,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)
                                      ),
                                      Divider(color: Colors.black, thickness: 3,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20),
                                        child: Text('${deaths}', style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),),
                                      )
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
                                          style: TextStyle(fontSize: fontSize,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)
                                      ),
                                      Divider(color: Colors.black, thickness: 3,),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20),
                                        child: Text('${confirmed}', style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),),
                                      )
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
                                          style: TextStyle(fontSize: fontSize,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)
                                      ),
                                      Divider(color: Colors.black, thickness: 3,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20),
                                        child: Text('${recovered}', style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),),
                                      )
                                    ],
                                  )),
                                ),
                              ),
                            ],
                          ),
                        )
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
        ],
      ),
    );
  }
}