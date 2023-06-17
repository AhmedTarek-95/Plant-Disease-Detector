import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_disease_detector/constants/constants.dart';
import 'package:plant_disease_detector/services/disease_provider.dart';
import 'package:plant_disease_detector/src/home_page/home.dart';
import 'package:plant_disease_detector/src/home_page/models/disease_model.dart';
import 'package:plant_disease_detector/src/login_page/Login_Plants.dart';
import 'package:plant_disease_detector/src/login_page/about_page.dart';
import 'package:plant_disease_detector/src/login_page/user_page.dart';
import 'package:plant_disease_detector/src/suggestions_page/components/plant_image.dart';
import 'package:plant_disease_detector/src/suggestions_page/components/text_property.dart';
import 'package:provider/provider.dart';



class Suggestions extends StatelessWidget {
  const Suggestions({Key? key}) : super(key: key);

  static const routeName = '/suggestions';

  @override
  Widget build(BuildContext context) {
    // Get disease from provider
    final _diseaseService = Provider.of<DiseaseService>(context);

    Disease _disease = _diseaseService.disease;
    Size size = MediaQuery.of(context).size;

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
        title: const Text('Suggestion'),
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
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/rodion-kutsaiev-049M_crau5k-unsplash.jpg'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.all((0.02 * size.height)),
            child: Column(
              children: [
                Flexible(
                    child: Center(
                        child: PlantImage(
                          size: size,
                          imageFile: File(_disease.imagePath),
                        ))),
                Divider(
                  thickness: (0.0066 * size.height),
                  height: (0.013 * size.height),
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: ListView(
                    children: [
                      TextProperty(
                        title: 'Disease name',
                        value: _disease.name,
                        height: size.height,
                      ),
                      TextProperty(
                        title: 'Possible causes',
                        value: _disease.possibleCauses,
                        height: size.height,
                      ),
                      TextProperty(
                        title: 'Possible solution',
                        value: _disease.possibleSolution,
                        height: size.height,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}