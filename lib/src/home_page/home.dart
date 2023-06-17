import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_disease_detector/constants/constants.dart';
import 'package:plant_disease_detector/services/classify.dart';
import 'package:plant_disease_detector/services/disease_provider.dart';
import 'package:plant_disease_detector/services/hive_database.dart';
import 'package:plant_disease_detector/src/home_page/components/greeting.dart';
import 'package:plant_disease_detector/src/home_page/components/history.dart';
import 'package:plant_disease_detector/src/home_page/components/instructions.dart';
import 'package:plant_disease_detector/src/home_page/components/titlesection.dart';
import 'package:plant_disease_detector/src/home_page/models/disease_model.dart';
import 'package:plant_disease_detector/src/suggestions_page/suggestions.dart';
import 'package:plant_disease_detector/src/login_page/Login_Plants.dart';
import 'package:plant_disease_detector/src/login_page/user_page.dart';
import 'package:provider/provider.dart';

import '../login_page/about_page.dart';



class Home extends StatefulWidget {
const Home({Key? key}) : super(key: key);

static const routeName = '/';

@override
State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
@override
void dispose() {
Hive.close();
super.dispose();
}

@override
Widget build(BuildContext context) {
// Get disease from provider
final _diseaseService = Provider.of<DiseaseService>(context);

// Hive service
HiveService _hiveService = HiveService();

// Data
Size size = MediaQuery.of(context).size;
final Classifier classifier = Classifier();
late Disease _disease;

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
title: const Text('Plant Disease Detection'),
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
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
floatingActionButton: SpeedDial(
icon: Icons.camera_alt,
spacing: 10,
children: [
SpeedDialChild(
child: const FaIcon(
FontAwesomeIcons.file,
color: kWhite,
),
label: "Choose image",
backgroundColor: kMain,
onTap: () async {
late double _confidence;
await classifier.getDisease(ImageSource.gallery).then((value) {
_disease = Disease(
name: value![0]["label"],
imagePath: classifier.imageFile.path);

_confidence = value[0]['confidence'];
});
// Check confidence
if (_confidence > 0.8) {
// Set disease for Disease Service
_diseaseService.setDiseaseValue(_disease);

// Save disease
_hiveService.addDisease(_disease);

Navigator.restorablePushNamed(
context,
Suggestions.routeName,
);
} else {
// Display unsure message

}
},
),
SpeedDialChild(
child: const FaIcon(
FontAwesomeIcons.camera,
color: kWhite,
),
label: "Take photo",
backgroundColor: kMain,
onTap: () async {
late double _confidence;

await classifier.getDisease(ImageSource.camera).then((value) {
_disease = Disease(
name: value![0]["label"],
imagePath: classifier.imageFile.path);

_confidence = value[0]['confidence'];
});

// Check confidence
if (_confidence > 0.8) {
// Set disease for Disease Service
_diseaseService.setDiseaseValue(_disease);

// Save disease
_hiveService.addDisease(_disease);

Navigator.restorablePushNamed(
context,
Suggestions.routeName,
);
} else {
// Display unsure message

}
},
),
],
),
body: Container(
decoration: const BoxDecoration(
image: DecorationImage(

image: AssetImage('assets/images/nahil-naseer-xljtGZ2-P3Y-unsplash.jpg'), fit: BoxFit.cover),
),
child: CustomScrollView(
slivers: [
GreetingSection(size.height * 0.2),
TitleSection('Instructions', size.height * 0.066),
InstructionsSection(size),
TitleSection('Your History', size.height * 0.066),
HistorySection(size, context, _diseaseService)
],
),
),
);
}
}
