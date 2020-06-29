import 'package:covid/networking/networking.dart';
class DataModel {
  Future<dynamic> getCurrentData() async {
    var Url = 'https://api.thevirustracker.com/free-api?global=stats';
    print(Url);
    NetworkHelp networkHelp = NetworkHelp(url: Url,);
    var wetherData = await networkHelp.getData();
    print("dhsdhc \n\n\n ${wetherData['results']}");
    return wetherData['results'];
  }

  Future<dynamic> getCountaryData(String name) async {
    NetworkHelp networkHelp = NetworkHelp(
        url:
        'https://pomber.github.io/covid19/timeseries.json');
    var wetherData = await networkHelp.getData();

    return wetherData['$name'];
  }
}