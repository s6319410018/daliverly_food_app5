import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/foodshoplist.dart';

class DeliveryFoodDetailUI extends StatefulWidget {
  //สร้างตัวแปรธรรมดาประเภท FoodShopList เพื่อเอาไว้รับค่าที่ส่งมาจากหน้า DeliveryFoodHomeUI

  FoodShopList? foodShopList;

  DeliveryFoodDetailUI({super.key, this.foodShopList});

  @override
  State<DeliveryFoodDetailUI> createState() => _DeliveryFoodDetailUIState();
}

class _DeliveryFoodDetailUIState extends State<DeliveryFoodDetailUI> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 54, 190, 244),
        title: Text(
          'สายด่วนชวนกิน (' + widget.foodShopList!.shopName + ')',
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/' + widget.foodShopList!.shopImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.yellow,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.store,
                    color: Color.fromARGB(255, 213, 65, 65),
                  ),
                  title: Text(
                    'ชื่อร้าน : ' + widget.foodShopList!.shopName,
                    style: GoogleFonts.kanit(),
                  ),
                  tileColor: Color.fromARGB(185, 237, 144, 144),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08),
                child: ListTile(
                  onTap: () {
                    _makePhoneCall(widget.foodShopList!.shopPhone);
                  },
                  leading: Icon(
                    FontAwesomeIcons.phone,
                    color: Colors.green,
                  ),
                  title: Text(
                    'เบอร์โทรร้าน : ' + widget.foodShopList!.shopPhone,
                    style: GoogleFonts.kanit(),
                  ),
                  tileColor: Colors.amber,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse('https://www.facebook.com/' +
                          widget.foodShopList!.shopFacebook),
                    );
                  },
                  leading: Icon(
                    FontAwesomeIcons.facebook,
                    color: Color.fromARGB(255, 24, 4, 156),
                  ),
                  title: Text(
                    'FB ร้าน : ' + widget.foodShopList!.shopFacebook,
                    style: GoogleFonts.kanit(),
                  ),
                  tileColor: Colors.amber,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.foodShopList!.shopWeb),
                    );
                  },
                  leading: Icon(
                    FontAwesomeIcons.globe,
                    color: Color.fromARGB(255, 24, 116, 255),
                  ),
                  title: Text(
                    'เว็บไชต์ : ' + widget.foodShopList!.shopWeb,
                    style: GoogleFonts.kanit(),
                  ),
                  tileColor: Colors.amber,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(
                          'https://www.google.com/maps/search/?api=1&query=' +
                              widget.foodShopList!.shopLatitude +
                              ',' +
                              widget.foodShopList!.shopLongitude),
                    );
                  },
                  leading: Icon(
                    FontAwesomeIcons.mapLocationDot,
                    color: Color.fromARGB(255, 0, 14, 20),
                  ),
                  title: Text(
                    'สถานที่ตั้ง Let\'s Go',
                    style: GoogleFonts.kanit(),
                  ),
                  tileColor: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
