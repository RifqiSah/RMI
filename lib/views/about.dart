import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rmi/style.dart';
import 'package:rmi/utils.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainBgColor,
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Ruang Muda Indramayu v1.0.0", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),),
                  SizedBox(height: 20.0,),
                  Text("Aplikasi ini dibuat untuk Ruang Muda Indramayu.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15.0),),
                  SizedBox(height: 50.0,),
                  Text("© 2020 Alrif Technology", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15.0),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
