import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rmi/utils.dart';

class Covid19 {
  DateTime lastUpdate;
  String source;
  int positif;
  int pdp;
  int pdp_negatif;
  int pdp_negatif_meninggal;
  int odp;
  int odp_selesai;
  int meninggal;
  int sembuh;

  Covid19({this.lastUpdate, this.source, this.positif, this.pdp, this.pdp_negatif, this.pdp_negatif_meninggal, this.odp, this.odp_selesai, this.meninggal, this.sembuh });

  factory Covid19.fromJson(json) {
    return Covid19(
      positif: int.parse(json['positif']['value'].toString()),
      pdp: int.parse(json['pdp']['value'].toString()),
      pdp_negatif: int.parse(json['pdp_negatif']['value'].toString()),
      pdp_negatif_meninggal: int.parse(json['pdp_negatif_meninggal']['value'].toString()),
      odp: int.parse(json['odp']['value'].toString()),
      odp_selesai: int.parse(json['odp_selesai']['value'].toString()),
      meninggal: int.parse(json['meninggal']['value'].toString()),
      sembuh: int.parse(json['sembuh']['value'].toString()),
      lastUpdate: DateTime.parse(json['metadata']['lastUpdate'].toString()).add(Duration(hours: 7)),
      source: json['metadata']['source'].toString(),
    );
  }

  static Future getCovid() async {
    String apiURL = API_ENDPOINT + "/covid";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    print("[INFO] : Get covid data.");
    return Covid19.fromJson(jsonObject);
  }
}