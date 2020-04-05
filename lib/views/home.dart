import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:rmi/style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildTopStack(),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: <Widget>[
                  _buildDonationHeader(),
                  _buildDonationList(),
                ],
              ),
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
          color: mainForeColor,
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
            height: 80,
            width: MediaQuery.of(context).size.width - 50,
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

  _buildDonationHeader() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Bantu siapa hari ini?",
            style: headerTextStyle,
          ),
          Text(
            "Lihat Semua",
            style: headerTextLinkStyle,
          )
        ],
      ),
    );
  }

  _buildDonationList() {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return Container(
      child: ListView.builder(
          itemCount: entries.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('Entry ${entries[index]}')),
            );
          }),
    );
  }
}
