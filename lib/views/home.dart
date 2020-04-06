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
              height: 40.0,
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
          height: 250.0,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 45.0, left: 25.0, right: 25.0),
            child: Column(
              children: <Widget>[
                Text("Ruang Muda Indramayu", style: donationText),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Donasi Terbuka Penanganan Covid-19 di Kab. Indramayu untuk tenaga medis dan warga terdampak.",
                  style: donationSubText,
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
            child: ListTile(
              leading: Icon(
                LineAwesomeIcons.gift,
                color: mainForeColor,
                size: 32,
              ),
              title: Text(
                "Salurkan donasi Anda untuk kebaikan bersama!",
                style: notificationCardStyle,
              ),
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
    return Container(
      child: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Scaffold
                  .of(context)
                  .showSnackBar(SnackBar(content: Text(index.toString()))),
              child: Container(
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Penanganan Covid-19",
                              style: donationListTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("#IndramayuLawancorona"),
                        SizedBox(
                          height: 2,
                        ),
                        Text("#AyoIndramayubisa"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Oleh Ruang Muda Indramayu",
                          style: donationListTextFooterStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
