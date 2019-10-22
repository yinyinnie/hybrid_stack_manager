import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hybrid_stack_manager/hybrid_stack_manager_plugin.dart';

class FDemoWidget extends StatelessWidget {
  RouterOption routeOption;
  FDemoWidget(RouterOption option, {Key key}) : super(key: key) {
    routeOption = option;
  }
  Widget build(BuildContext context) {
    Map m = Utils.parseUniquePageName(routeOption.userInfo);
    return new Scaffold(
        appBar: new AppBar(
          leading: new GestureDetector(
              child: new Icon(Icons.arrow_back),
              onTap: () {
                HybridStackManagerPlugin.hybridStackManagerPlugin.popCurPage();
              }),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text("Flutter Page(${m["id"]})"),
        ),
        body: Builder(builder:(context) => Center(
          child: new Column(
            // Column is also layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug paint" (press "p" in the console where you ran
            // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
            // window in IntelliJ) to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new SizedBox(width: 1.0, height: 200.0),
              new GestureDetector(
                child: new Text("Click to open FlutterPage"),
                onTap: () {
                  _showToast(context);
                  HybridStackManagerPlugin.hybridStackManagerPlugin
                      .openUrlFromNative(
                          url: "hrd://fdemo", query: {"flutter": true});
                }
              ),
              new SizedBox(width: 1.0, height: 200.0),
              new GestureDetector(
                child: new Text("Click to open NativePage"),
                onTap: () {
                  _showToast(context);
                  HybridStackManagerPlugin.hybridStackManagerPlugin
                      .openUrlFromNative(url: "hrd://ndemo");
                },
              )
            ],
          ),
        )),
        floatingActionButton:
            null // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }



}


