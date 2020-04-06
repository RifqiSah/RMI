import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:rmi/style.dart';

class Covid extends StatefulWidget {
  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
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
            "Perkembangan hari ini",
            style: headerTextStyle,
          ),
          Text(
            "Selengkapnya",
            style: headerTextLinkStyle,
          )
        ],
      ),
    );
  }

  _buildDonationList() {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            child: Center(
              child: Card(
                  color: appOrangeDarkColor,
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Positif",
                          style: covidCaseTitleStyle,
                        ),
                        Text(
                          "0",
                          style: covidCaseCountStyle,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Container(
            child: Center(
              child: Card(
                  color: appRedColor,
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Meninggal",
                          style: covidCaseTitleStyle,
                        ),
                        Text(
                          "0",
                          style: covidCaseCountStyle,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Container(
            child: Center(
              child: Card(
                  color: appGreenColor,
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Sembuh",
                          style: covidCaseTitleStyle,
                        ),
                        Text(
                          "0",
                          style: covidCaseCountStyle,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Container(
            child: Center(
              child: Card(
                  color: appOrangeColor,
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "PDP",
                          style: covidCaseTitleStyle,
                        ),
                        Text(
                          "0",
                          style: covidCaseCountStyle,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Container(
            child: Center(
              child: Card(
                  color: appYellowColor,
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "ODP",
                          style: covidCaseTitleStyle,
                        ),
                        Text(
                          "0",
                          style: covidCaseCountStyle,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Container(
            child: Center(
              child: Card(
                  color: appBlueColor,
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "ODP +",
                          style: covidCaseTitleStyle,
                        ),
                        Text(
                          "0",
                          style: covidCaseCountStyle,
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
