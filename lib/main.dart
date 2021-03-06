// @dart=2.9
import 'package:flutter/material.dart';
import 'package:toggle_bar/toggle_bar.dart';
import 'package:upload_file_ui_app/widgets/card_textfield.dart';
import 'package:upload_file_ui_app/widgets/uploading_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> labels = ["Phone", "Video", "Audio", "Document"];
  int currentIndex = 0;
  String tit = 'Upload File';
  String sub = 'Browse and chose the files you want to upload.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UploadScreen(1, '1', tit, sub)));
        },
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                  width: 125.0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.filter_list),
                          color: Colors.white,
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ]),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    height: 0,
                    width: 0,
                  ),
                  fit: FlexFit.tight,
                ),
                SizedBox(
                  width: 10.0,
                )
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75.0),
                  topRight: Radius.circular(75.0),
                )),
            child: ListView(
              primary: false,
              padding: EdgeInsets.all(0.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ToggleBar(
                          labels: labels,
                          textColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          labelTextStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          selectedTabColor: Colors.amber,
                          selectedTextColor: Colors.black,
                          onSelectionUpdated: (index) =>
                              setState(() => currentIndex = index),
                        ),
                        Expanded(
                            child: GridView.count(
                          crossAxisCount: 2,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(25),
                          children: const <Widget>[
                            MyCard(
                                backgroundColor: Colors.amber, title: 'Voice'),
                            MyCard(
                                backgroundColor: Colors.amberAccent,
                                title: 'Rehersals'),
                            MyCard(
                                backgroundColor: Colors.grey, title: 'Audio'),
                          ],
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
