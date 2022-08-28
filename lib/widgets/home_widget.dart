import 'package:flutter/material.dart';

import 'bid_widget.dart';
import 'category.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  List<List<String>> list = [
    [ 'DeerGOG',
      '3600',
      'Martin Gogołowicz',
      'assets/images/avatar1.jpg',
      'assets/images/nft1.jpg',
    ],
    [
      'Nature',
      '1500',
      'Nicole Boa',
      'assets/images/avatar2.jpg',
      'assets/images/nft3.png',
    ],
    [
      'Blue and Red',
      '1250',
      'Nicole Boa',
      'assets/images/avatar2.jpg',
      'assets/images/nft2.jpg',
    ]
  ];

  late bool isDarkMode;
  var dropdownValue;

  void dropDown(val){
    setState(() {
      dropdownValue =val ;
    });
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    isDarkMode = brightness ==
        Brightness.dark; //check if device is in dark or light mode
    Color defaultFontColor = isDarkMode ? Colors.white : Colors.black;
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height -55,
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          child: ListView(
            children: [
              //buildVideoThumbnail(isDarkMode, size),
              buildCategory("Popular Bids", defaultFontColor, size,dropdownValue,dropDown),
              SizedBox(
                width: size.width,
                height: size.height-200,
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    //! example bids
                    //if (i == 0) {
                      return buildBid(
                        list[i][0],
                        int.parse(list[i][1]),
                        list[i][2],
                        list[i][3],
                        list[i][4],
                        defaultFontColor,
                        isDarkMode,
                        size,
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget bidBuilder(){
    List<Widget> listWidget=[];
    for(int i=0;i<list.length;i++){
      listWidget.add(bidWidget(index:i));
    }
    return Column(
      children: listWidget,
    );
  }

  Widget bidWidget({index}){
    return Container();
  }
}
