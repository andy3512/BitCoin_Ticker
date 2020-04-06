import 'package:http/http.dart';
import 'dart:convert';


class GetData{

  Future getData(String changeInTo) async{
    var response = await get('https://rest.coinapi.io/v1/exchangerate/BTC/$changeInTo?apikey=58C25500-6375-43F6-B512-E1575A61FEF2');
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      var rate = data['rate'];
      print(rate.toInt());
      return rate.toInt();
    }
    else{
      print(response.statusCode);
      return 2;
    }
  }

}