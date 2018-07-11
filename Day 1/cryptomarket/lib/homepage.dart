import 'package:flutter/material.dart';
import 'package:cryptomarket/modules/crypto_presenter.dart';
import 'package:cryptomarket/data/crypto_data.dart';


class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> implements CryptoListViewContract{

  bool isLoading;   //to give a loader so that when the length is null, the error doesn't appear on the screen
 CryptoListPresenter _presenter;
 List<Crypto> currencies;

  HomePageState(){
_presenter = new CryptoListPresenter(this);
  }

  @override
  void initState() {
    isLoading = true;   //initializing isLoading to true at the start
    super.initState();
    _presenter.loadCurrencies();
     }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Cryto Market')),

      ),
      body: isLoading ? new Center(   //checking if isLoading is true then we show a Progress Indicator
        child: new CircularProgressIndicator(),
      ) : cryptoWidget()
    );
  }


Widget cryptoWidget(){

  return new Container(
    child: new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(

              itemCount: currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Crypto currency = currencies[index]; //we are using map for key:value pairs, we will pass it in another method
                //We are mapping those currencies to another variable
                //We are using map to map currency name with a color
                final MaterialColor color = Colors.cyan;

                return _getListItemUi(currency, color);

              //The function expects a Widget to be returned. We return this function which is not Widget but it still works
                // because this function is of ListTile which itself is a Widget so its returning a widget indirectly.
              },

          ),

      ),],
    ),
  );



}


//I am just being specific here by mentioning ListTile, Widget also works perfectly well
//UI of the LIST
  ListTile _getListItemUi(Crypto currency, MaterialColor color){
    return new ListTile(

      leading: new CircleAvatar(    //leading will bring the CircleAvatar to be left
        backgroundColor: color,
        child: new Text(currency.name[0], style: new TextStyle(color: Colors.white),), //Fetching the first letter of the name of the currency and putting in Circle Avatar
      ),
      //giving the name of the coin as the title of a particular List View in bold
      title: new Text(
          currency.name,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
          ) ,
      ),
      subtitle: _getSubtitleText(currency.price_usd,currency.percent_change_1h),
      //giving subtitle is must, I don't know why
      isThreeLine: true,  //because we have CircleAvatar, then currency name and them this subtitle
    );
}

 Widget _getSubtitleText(String priceUSD, String percentageChange){

    //Want to show red colour for negative percentageChange, and green for positive


   //This for displaying the price in USD
   TextSpan priceTextWidget = new TextSpan(
       text: '\$$priceUSD\n',     //First dollar is for printing the dollar sign and second is to print the variable
       style: new TextStyle(
        color: Colors.black,
       )



   );

   String percentageChangeText = "1 Hour: $percentageChange%";
   TextSpan percentageChangeTextWidget;     //For specifying text colour according to rise or fall of price
   
   if(double.parse(percentageChange)>0){
     percentageChangeTextWidget = new TextSpan(
        text: percentageChangeText,
        style: new TextStyle(color: Colors.green),
     );
   }
   else
     {
       percentageChangeTextWidget = new TextSpan(
         text: percentageChangeText,
         style: new TextStyle(color: Colors.red),
       );

     }
     //can use only Text Widget too.colors[index % widget.currencies.length];

     return new RichText(
       text: new TextSpan(
           children: [priceTextWidget, percentageChangeTextWidget]     //the two Widgets that we get back from this method


         ),
     );
   }

 @override
 void onLoadCryptoComplete(List<Crypto> items){
    setState(() {
      isLoading = false;
      currencies = items;
    });
 }

 @override
  void onLoadCryptoError(){

 }

}