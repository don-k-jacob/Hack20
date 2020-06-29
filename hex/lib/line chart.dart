import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<charts.Series<cases, int>> _seriesLineData;

  _generateData() {

    var linesalesdata = [
      new cases(0, 45),
      new cases(1, 56),
      new cases(2, 55),
      new cases(3, 60),
      new cases(4, 61),
      new cases(5, 70),
    ];
    var linesalesdata1 = [
      new cases(0, 35),
      new cases(1, 46),
      new cases(2, 45),
      new cases(3, 50),
      new cases(4, 51),
      new cases(5, 60),
    ];

    var linesalesdata2 = [
      new cases(0, 20),
      new cases(1, 24),
      new cases(2, 25),
      new cases(3, 40),
      new cases(4, 45),
      new cases(5, 60),
    ];


    _seriesLineData.add(
      charts.Series(
        colorFn: (_,__) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (cases sales, _) => sales.yearval,
        measureFn: (cases sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (cases sales, _) => sales.yearval,
        measureFn: (cases sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (cases sales, _) => sales.yearval,
        measureFn: (cases sales, _) => sales.salesval,
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesLineData = List<charts.Series<cases, int>>();
    _generateData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            body: TabBarView(
                children: [



            Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: Center(
                child: Column(
                    children: <Widget>[
                Text(
                ‘cases in 5 month',
                style: TextStyle(
                fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: charts.LineChart(_seriesLineData,
                    defaultRenderer: new charts.LineRendererConfig(
                        includeArea: true, stacked: true),
                    animate: true,
                    animationDuration: Duration(seconds: 5),
                    behaviors: [
                      new charts.ChartTitle('months',
                          behaviorPosition:
                          charts.BehaviorPosition.bottom,
                          titleOutsideJustification: charts
                              .OutsideJustification.middleDrawArea),
                      new charts.ChartTitle('cases',
                          behaviorPosition:
                          charts.BehaviorPosition.start,
                          titleOutsideJustification: charts
                              .OutsideJustification.middleDrawArea),
                    ]),
              ),
              ],
            ),
          ),
        ),
      ),
      ],
    ),
    ),
    ),
    );
  }
}

