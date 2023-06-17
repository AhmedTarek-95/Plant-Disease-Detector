
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:plant_disease_detector/src/home_page/home.dart';
import 'package:plant_disease_detector/src/login_page/user_page.dart';

import '../../constants/constants.dart';
import 'Login_Plants.dart';



class AboutPage extends StatelessWidget {
  static const String aboutPage = 'About_Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer:Drawer(
        width: 250.0,
        child: ListView(
          children: [
            DrawerHeader(
                decoration:
                BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/omar.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child:
                Row(
                  children: [
                    CircleAvatar(
                      child:
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('assets/images/person-icon.png'),
                        backgroundColor: Colors.black,

                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      'Hello : Username',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              leading: Icon(Icons.document_scanner_outlined,
                size: 30.0,
                color: Colors.black,),
              onTap: (){
                Navigator.pushNamed(
                  context,
                  Home.routeName,
                );
              },

            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              leading: Icon(Icons.person,
                size: 30.0,
                color: Colors.black,),
              onTap: (){
                Navigator.pushNamed(
                  context,
                  UserPage.userPage,
                );
              },

            ),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              leading: Icon(Icons.info_outlined,
                size: 30.0,
                color: Colors.black,),
              onTap: (){
                Navigator.pushNamed(
                  context,
                  AboutPage.aboutPage,
                );
              },
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              leading: Icon(Icons.logout,
                size: 30.0,
                color: Colors.black,)
              , onTap: (){
              Navigator.pushNamed(
                context,
                LoginPlants.loginPlants,
              );
            },
            ),
          ],
        ),

      ) ,

      appBar: AppBar(
        backgroundColor: kMain,
        title: const Text('About'),
        actions:[ Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              );
            }
        ),],
      ),
      body:  Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/omar.png.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        //#########################
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text('AI-Powered Recognition of Plants, Flowers & Diseases in a SnapNeed help identifying a plant? There\'s an app for that! With the Plant detect identifier app, you can quickly and easily identify plants, flowers, and weeds. Plus, you\'ll get tips on plant care and disease diagnosis',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text('Plant identification:',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    Text(
                      'Plant detect is easy to use. Take a photo or type in information about the plant in question, and Plant detect will provide you with accurate identification. Its 98% accuracy rate helps you to quickly identify flowers, trees and leaves, common weeds, cacti and succulents, ferns and conifers, and many more - even if all you have to do is taking a photo of them!',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,

                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text('Plant Disease Diagnosis:',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    Text('Keeping plants healthy is a tough job! Luckily, Plant detect uses AI to diagnose common pests and diseases, making it easy for even novice gardeners to understand what might be going wrong in their gardens.',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}