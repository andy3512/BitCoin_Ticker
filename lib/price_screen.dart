import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'networking.dart';
import 'package:flutter/cupertino.dart';
class PriceScreen extends StatefulWidget {

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  int Rate;
  GetData rateData =GetData();
  void initState(){
    super.initState();
    getRate('AUD');
  }

  Future<void> getRate(String SelectedCurrency)async{
    var rate = await rateData.getData(SelectedCurrency);
    setState(() {
      Rate = rate;
    });
  }

  String selectedCurrency = 'AUD';

  //List<DropdownMenuItem<String>> getDropdownListItems(){
    //List<DropdownMenuItem<String>> dropdownitems=[];
    //for(String currency in currenciesList){
      //var items = DropdownMenuItem(
        //child: Text(currency),
        //value: currency,
    //);
      //dropdownitems.add(items);
    //}
    //return dropdownitems;
  //}
  List<Widget> getPickerItems(){
    List<Text> pickerItems=[];
    for(String currency in currenciesList){
      pickerItems.add(Text(currency));
    }
    return pickerItems;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $Rate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlue,
                itemExtent: 32.0,
                onSelectedItemChanged: (selectedIndex){
                   setState(() {
                     selectedCurrency=currenciesList[selectedIndex];
                     getRate(currenciesList[selectedIndex]);
                   });
                },
                children: getPickerItems(),
            ),
          ),
        ],
      ),
    );
  }
}
//DropdownButton(
//value: selectedCurrency,
//items: getDropdownListItems(),
//onChanged: (value){
//setState(() {
//selectedCurrency=value;
//getRate(value);
//});
//},
//),