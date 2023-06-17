import 'package:flutter/material.dart';
import 'Loginpage.dart';
import 'SginUp.dart';

class LoginPlants extends StatelessWidget {
  static const String loginPlants = 'Login_Plants';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome to Detection of plant diseases '),
      // ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/welcomepage2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),

                  //#########################
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text(' Log In '),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20.0),
                          fixedSize: Size(200, 70),
                          textStyle: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            child: Text(' Sign Up '),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SginupPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(20.0),
                              fixedSize: Size(200, 70),
                              textStyle: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                              primary: Colors.green,
                              onPrimary: Colors.white,
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                          ),
                          SizedBox(
                            height: 31,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}