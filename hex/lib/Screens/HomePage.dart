import 'package:covid/Charts/Chart.dart';
import 'package:covid/constents.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
double fontSize=10;
class _HomeState extends State<Home> {
  bool isShowingMainData;
  int  totalCases;
  int totalRecovered;
  int totalUnresolved;
  int totalDeaths;
  int totalNewCasesToday;
  int totalNewDeathsToday;
  int totalActiveCases;
  int totalSeriousCases;
  int totalAffectedCountries;
  void updateUI(dynamic data) {
    print(data);
    if(data== null){
      totalCases=0;
      totalRecovered=0;
      totalUnresolved=0;
      totalDeaths=0;
      totalNewCasesToday=0;
      totalNewDeathsToday=0;
      totalActiveCases=0;
      totalSeriousCases=0;
      totalAffectedCountries=0;
      return;

    }
    print("hi\n\n\n\n\n $data \n\n\n\n\n");
    setState(() {
      totalRecovered=data['total_cases'];
      totalCases = data['total_recovered'];
      totalUnresolved = data['total_unresolved'];
      totalDeaths =data['total_deaths'];
      totalNewCasesToday=data['total_new_cases_today'];
      totalNewDeathsToday=data['total_new_deaths_today'];
      totalActiveCases=data['total_active_cases'];
      totalSeriousCases=data['total_serious_cases'];
      totalAffectedCountries=data['total_affected_countries'];
    });
  }
  void getCountary(String name)async{

      var data= await dataModel.getCurrentData();
      print(data.last);
      updateUI(data.last);
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
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color:  Colors.blueAccent.withOpacity(0.4),
                border: Border.all(
                  color: Colors.blueAccent,
                  width: 1, //                   <--- border width here
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Today',
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
                  Padding(
                      padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Card(
                            elevation: 10,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.cyan.withOpacity(0.5),
                                borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                              ),
                              height: MediaQuery.of(context).size.height/5+30,
                              width: MediaQuery.of(context).size.width/4,
                              child: Center(child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(' New Cases',
                                      style: TextStyle(fontSize: fontSize,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)
                                  ),
                                  Divider(color: Colors.black, thickness: 3,),
                                  SizedBox(height: 50,),
                                  Text('${totalNewCasesToday}', style: TextStyle(
                                      fontSize: fontSize,
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
                                color: Colors.red.withOpacity(0.5),
                                borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                              ),
                              height: MediaQuery.of(context).size.height/5+30,
                              width: MediaQuery.of(context).size.width/4,
                              child: Center(child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('New Deaths',
                                      style: TextStyle(fontSize: fontSize,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)
                                  ),
                                  Divider(color: Colors.black, thickness: 3,),
                                  SizedBox(height: 50,),
                                  Text('${totalNewDeathsToday}', style: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),)
                                ],
                              )),
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Total',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
                textAlign: TextAlign.center,
              ),
            ),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
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
                      height: MediaQuery.of(context).size.height/5+20,
                      width: MediaQuery.of(context).size.width/5,

                      child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Cases',
                              style: TextStyle(fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent.withOpacity(0.8))
                          ),
                          Divider(color: Colors.black, thickness: 3,),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('${totalCases}', style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent.withOpacity(0.8)),),
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
                        color: Colors.red.withOpacity(0.5),
                        borderRadius:
                        new BorderRadius.all(Radius.circular(10)),
                      ),
                      height: MediaQuery.of(context).size.height/5+20,
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
                            child: Text('${totalDeaths}', style: TextStyle(
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
                        height: MediaQuery.of(context).size.height/5+20,
                      width: MediaQuery.of(context).size.width/5,
                      child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Recovered',
                              style: TextStyle(fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent.withOpacity(0.8))
                          ),
                          Divider(color: Colors.black, thickness: 3,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('${totalRecovered}', style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent.withOpacity(0.8)),),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    elevation: 10,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.deepOrange.withOpacity(0.5),
                        borderRadius:
                        new BorderRadius.all(Radius.circular(10)),
                      ),
                      height: MediaQuery.of(context).size.height/5+20,
                      width: MediaQuery.of(context).size.width/5,

                      child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Active',
                              style: TextStyle(fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent.withOpacity(0.8))
                          ),
                          Divider(color: Colors.black, thickness: 3,),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),

                            child: Text('${totalActiveCases}', style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent.withOpacity(0.8)),),
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
                        color: Colors.pinkAccent.withOpacity(0.5),
                        borderRadius:
                        new BorderRadius.all(Radius.circular(10)),
                      ),
                      height: MediaQuery.of(context).size.height/5+20,
                      width: MediaQuery.of(context).size.width/5,
                      child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Serious Cases',
                              style: TextStyle(fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)
                          ),
                          Divider(color: Colors.black, thickness: 3,),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),

                            child: Text('${totalSeriousCases}', style: TextStyle(
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
                        color: Colors.brown.withOpacity(0.5),
                        borderRadius:
                        new BorderRadius.all(Radius.circular(10)),
                      ),
                      height: MediaQuery.of(context).size.height/5+20,
                      width: MediaQuery.of(context).size.width/5,
                      child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Unresolved',
                              style: TextStyle(fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent.withOpacity(0.8))
                          ),
                          Divider(color: Colors.black, thickness: 3,),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('${totalUnresolved}', style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent.withOpacity(0.8)),),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}