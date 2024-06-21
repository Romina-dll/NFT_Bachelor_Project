import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/models/NFT.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/values/app.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/values/colors.dart';

class HomeScreen extends StatefulWidget{
  HomeScreen({
    Key? key
  }): super(key: key);

  static const name = '/home';

  @override
  State<HomeScreen> createState() {
    // TODO: implement createState
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        actions: [
          Padding(
              padding: EdgeInsets.only(left: 20),
            child: CircleAvatar(backgroundColor: AppColors.primaryColor),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications_none_rounded , size: 30,),
            )
          ),

        ],
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: appSize.getWidth(widthSize: 20),
              vertical: appSize.getHeight(heightSize: 20)
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.textColor.withOpacity(0.5)
                        ),
                        width: appSize.getWidth(widthSize:300),
                        child: TextField(
                          style: TextStyle(
                            color: AppColors.gray
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: AppColors.gray),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(Icons.search , color: AppColors.gray,),
                            hintMaxLines: 1,
                            
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryColor
                        ),
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.settings) , color: Colors.white,),
                      )
                    ],
                  ),
                  SizedBox(height: appSize.getHeight(heightSize: 20),),
                  Row(children: [
                    Text("Gallery" , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),

                  ],),
                  SizedBox(height: appSize.getHeight(heightSize: 10),),
                  Container(
                    height: appSize.getHeight(heightSize: 600),
                      child: ListView.separated(
                          itemBuilder:(context , index) =>
                              NFTCard(nft: nft[index], bottomMargin: index == nft.length-1 ? 20 : 0,),
                          separatorBuilder:(context, index) => SizedBox(
                            height: appSize.getHeight(heightSize: 20),
                          ),
                          itemCount: nft.length
                      )),
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}

List<NFTModel> nft = [
  NFTModel(name: 'Girl', description: "girl", image: 'assets/nft_girl.jpg', price: 10.2 , isSold: false),
  NFTModel(name: 'Motor', description: 'motor', image: 'assets/nft_motor.jpg',price: 5.4 , isSold:  true),
  NFTModel(name: 'Man', description: 'man', image: 'assets/nft_man.jpg', price: 3 , isSold: false)
];

class NFTCard extends StatelessWidget{
  NFTCard({
    Key? key,
    required this.nft,
    required this.bottomMargin
  }):super(key: key);

  final NFTModel nft;
  final double bottomMargin;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){},
      child: Card(
        color: AppColors.primaryColor,
        // shape: RoundedRectangleBorder(
        //     side: new BorderSide(color: AppColors.primaryColor, width: 3.0),
        //   borderRadius: BorderRadius.all(Radius.circular(10))
        // ),
        margin: EdgeInsets.only(bottom: bottomMargin),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)
              ),
              child: Image.asset(nft.image,
                height: appSize.getHeight(heightSize: 410),
                width: double.infinity,
                fit: BoxFit.fitWidth,),
            ),
            ListTile(
                title: Text(nft.name ,
                  style: TextStyle(
                      decoration: nft.isSold ? TextDecoration.lineThrough : null,
                      decorationColor: AppColors.t,
                      decorationThickness: 2,
                      fontWeight: FontWeight.w900,
                      color: AppColors.t,
                      fontSize: 20),
                ),
                subtitle:!nft.isSold ? Row(
                  children: [
                    Image.asset('assets/ETH_icon.png' , scale: 1.6,),
                    Text(' ' + nft.price.toString(),style: TextStyle(fontSize:17 , color: AppColors.t))
                  ] ,
                ) : Text( 'Sold',style: TextStyle(fontSize:17 , color: AppColors.t)),
                trailing: Container(

                  child: IconButton(
                    icon: Icon(Icons.favorite_border, color: AppColors.t,),
                    onPressed: (){

                    },
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}