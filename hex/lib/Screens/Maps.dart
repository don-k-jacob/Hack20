
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
int val=0;
class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}
double progress = 0;
class _MapState extends State<Map> {
  final Completer<WebViewController> _completer =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    List<Widget> body=[

      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:


        WebView(
          initialUrl: "https://www.trackcorona.live/map",
          javascriptMode: JavascriptMode.unrestricted,

          onWebViewCreated: (WebViewController webViewController){
            _completer.complete(webViewController);
          },

        ),

      ),
    ];
    return body[val];
  }

}
void map(String url)
async{
  if (await canLaunch(url)) {
 val=1;
} else {
    val=0;
throw 'Could not launch $url';
}
}