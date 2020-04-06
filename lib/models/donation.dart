import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rmi/utils.dart';

class Donation {
  DateTime lastUpdate;
  int pemasukan;
  int pengeluaran;
  String nama;
  String rek;
  String other;

  Donation({this.lastUpdate, this.pemasukan, this.pengeluaran, this.nama, this.rek, this.other });

  factory Donation.fromJson(json) {
    return Donation(
      lastUpdate: DateTime.parse(json['lastUpdate'].toString()),
      pemasukan: int.parse(json['pemasukan'].toString()),
      pengeluaran: int.parse(json['pengeluaran'].toString()),
      nama: json['info']['name'].toString(),
      rek: json['info']['rek'].toString(),
      other: json['info']['other'].toString(),
    );
  }

  static Future getDonation() async {
    String apiURL = API_ENDPOINT + "/donation";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    print("[INFO] : Get donation data.");
    return Donation.fromJson(jsonObject);
  }
}