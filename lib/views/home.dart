import 'package:flutter/material.dart';
import 'package:rmi/style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildTopStack(),
            SizedBox(
              height: 100.0,
            ),
            Container(
              height: 100.0,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildTopStack() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          color: Colors.green,
          height: 210.0,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Donasi terkumpul",
                  style: donationSubText,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text("Rp. 15.000.000", style: donationText),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "* Sampai 01 Januari 2020",
                  style: donationSubTextItalic,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -40,
          child: Container(
            height: 85,
            width: MediaQuery.of(context).size.width - 55,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 5.5, blurRadius: 5.5)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
