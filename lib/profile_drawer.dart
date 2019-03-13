import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class ProfileDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileDrawer();
  }
}

class _ProfileDrawer extends State<ProfileDrawer> {
  File _image = File("assets/avatar.jpg");
  
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: height * .05,
          ),
          GestureDetector(
            child: ClipOval(
              child: Image.asset(
              _image.path,
                fit: BoxFit.cover,
                width: 90.0,
                height: 90.0,
              ),
            ),
            onTap: getImage,
          ),
          Container(
            margin: EdgeInsets.only(top: height * .05),
            child: Text('MORE INFO BELOW'),
          ),
        ],
      ),
    );
  }
}
