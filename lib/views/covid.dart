import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:rmi/models/covid19.dart';
import 'package:rmi/style.dart';

class Covid extends StatefulWidget {
  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  Covid19 _covid;
  String _lastUpdate = "--";

  void loadCovid() {
    Covid19.getCovid().then((val) {
      setState(() {
        _covid = val;
        _lastUpdate = DateFormat("dd-MMM-yyyy hh:mm").format(_covid.lastUpdate);
      });
    });
  }

  @override
  void initState() {
    super.initState();

    loadCovid();
  }

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
                  _buildCovidHeader(),
                  _buildCovidData(),
                  _buildCovidFooter(),
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

  _buildCovidHeader() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Update terakhir pada",
            style: headerTextStyle,
          ),
          Text(
            _lastUpdate,
            style: headerTextLinkStyle,
          )
        ],
      ),
    );
  }

  _buildCovidData() {
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
                          _covid.positif.toString(),
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
                          _covid.meninggal.toString(),
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
                          _covid.sembuh.toString(),
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
                          _covid.pdp.toString(),
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
                          _covid.odp.toString(),
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
                          _covid.odp_selesai.toString(),
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

  _buildCovidFooter() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Text("Sumber: " + _covid.source),
      ),
    );
  }
}
