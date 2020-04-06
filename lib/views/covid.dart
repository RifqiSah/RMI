import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rmi/models/covid19.dart';
import 'package:rmi/models/donation.dart';
import 'package:rmi/style.dart';

class Covid extends StatefulWidget {
  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  Donation _donation;
  String _dona_in = "0";
  String _dona_out = "0";
  String _dona_lastUpdate = "--";

  String _dona_name = "";
  String _dona_rek = "";
  String _dona_other = "";

  Covid19 _covid;
  String _lastUpdate = "--";

  void loadDonation() {
    Donation.getDonation().then((val) {
      setState(() {
        _donation = val;
        _dona_in = NumberFormat("#,##0", "id").format(_donation.pemasukan);
        _dona_out = NumberFormat("#,##0", "id").format(_donation.pengeluaran);

        _dona_name = "a.n " + _donation.nama;
        _dona_rek = _donation.rek;
        _dona_other = _donation.other;

        _dona_lastUpdate = DateFormat("dd MMM yyyy").format(_donation.lastUpdate);
      });
    });
  }

  void loadCovid() {
    Covid19.getCovid().then((val) {
      setState(() {
        _covid = val;
        _lastUpdate = DateFormat("dd-MMM-yyyy HH:mm").format(_covid.lastUpdate);
      });
    });
  }

  @override
  void initState() {
    super.initState();

    loadDonation();
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
        Positioned(
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 25.0, right: 25.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Donasi Terkumpul",
                          style: donationSubText,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Rp.",
                          style: donationSubSubText,
                        ),
                        Text(_dona_in, style: donationText),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Pengeluaran",
                          style: donationSubText,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Rp.",
                          style: donationSubSubText,
                        ),
                        Text(_dona_out, style: donationText),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "*) Sampai " + _dona_lastUpdate,
                      style: donationSubTextItalic,
                    ),
                  ],
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
            child: Column(
              children: <Widget>[
                Text(
                  _dona_rek,
                  style: notificationCardStyle,
                ),
                Text(
                  _dona_other,
                  style: notificationCardStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  _dona_name,
                  style: notificationCardBoldStyle,
                ),
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
    return _covid == null ? Padding(padding: EdgeInsets.only(top: 50.0),child: CircularProgressIndicator()) : Container(
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            child: Center(
              child: Card(
                  color: appOrangeDarkColor,
                  margin: EdgeInsets.only(right: 5, bottom: 5),
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
                  margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
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
                  margin: EdgeInsets.only(left: 5, bottom: 5),
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
                  margin: EdgeInsets.only(right: 5, top: 5),
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
                  margin: EdgeInsets.only(left: 5, right: 5, top: 5),
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
                  margin: EdgeInsets.only(left: 5, top: 5),
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
    return _covid == null ? Container() : Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Text("Sumber: " + _covid.source),
      ),
    );
  }
}
