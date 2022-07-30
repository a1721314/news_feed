import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //TODO
        body: Center(
          child: AnimatedContainer(
            width:  _selected? 300 : 50,
            height: _selected? 200 : 25,

            child: _selected 
            ? Text("News Feed App", style: TextStyle(fontSize: 40.0),)
            : Text("News Feed App", style: TextStyle(fontSize: 6.0),),
            alignment: _selected ? Alignment.center : Alignment.topCenter,
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          tooltip: "飛び出すよ",
          onPressed: () {
            setState(() {
              _selected = !_selected;
            });
          },
        ),
      ),
    );
  }
}
