import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  var nftImg = [
    'assets/images/nft1.jpg',
    'assets/images/nft3.png',
    'assets/images/nft2.jpg',
    'assets/images/nft1.jpg',
  ];

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
    ],
    [ 'DeerGOG',
      '3600',
      'Martin Gogołowicz',
      'assets/images/avatar1.jpg',
      'assets/images/nft1.jpg',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height-55,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
           children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar1.jpg',),
                radius: 80,
                //backgroundColor: isDarkMode ? Colors.black : Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Martin Gogołowicz', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 450,//MediaQuery.of(context).size.height/2,
              child: GridView.count(
                shrinkWrap: true,
                primary: false,
                //physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(4, (index) {
                  return Center(
                    child: InkWell(
                      onTap: (){
                        Get.to(
                              () => DetailsPage(
                            title: list[index][0],
                            price: int.parse(list[index][1]),
                            author: list[index][2],
                            authorImg: list[index][3],
                            nftImg: list[index][4],
                            isDarkMode: false,
                            size: MediaQuery.of(context).size,
                          ),
                        );
                      },
                      child: Image.asset(
                        nftImg[index],
                        fit: BoxFit.fill,
                        width: 200,//MediaQuery.of(context).size.width/2,
                        height: 200,//MediaQuery.of(context).size.width/4,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: MediaQuery.of(context).size.width/2,
                            height: MediaQuery.of(context).size.width/4,
                            decoration: const BoxDecoration(
                               borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
