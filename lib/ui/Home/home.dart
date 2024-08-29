import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  Color individualContainerColor = Color(0xffC60000);
  Color organizationContainerColor = Colors.white;
  Color individualTextColor = Colors.white;
  Color organizationTextColor = Color(0xffC60000);
  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  TextEditingController FnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.greenAccent[400],
          actions: [
            IconButton(
              onPressed: () {
                //open siderbar menu
              },
              icon: Icon(Icons.more_vert),
            ),
          ],
          title: Center(child: Text('Lawyer Diary')),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.008,
              ),
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height * 0.7855,
                  decoration: BoxDecoration(
                      color: Color(0xffF5F7F9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(
                            color: Color(0xff19212C),
                            fontSize: size.width * 0.045,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 8.0
                              // left: 20.0,
                              // right: 20.0,
                              ),
                          child: Container(
                            width: size.width * 0.9,
                            child: TextFormFieldAuth(
                              Controller: FnameController,
                              size: size,
                              text: 'Title',
                              onpressed: () {},
                              // icon: Icon(
                              //   Icons.person,
                              //   size: size.width * 0.01,
                              //   color: Colors.black,
                              // )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(
                            color: Color(0xff19212C),
                            fontSize: size.width * 0.045,
                          ),
                        ),
                        //container size.width*0.9 and height size.height*0.3 in which user can write message to the giver upto 500 characters and in write bottom write hint text that you can write upto 500 characters

                        Container(
                          width: size.width * 0.9,
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              maxLines: 10,
                              maxLength: 500,
                              decoration: InputDecoration(
                                hintText: 'Write your Case descritpion here...',
                                hintStyle: TextStyle(
                                  color: Color(0xffA4A4A4),
                                  fontSize: 15,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        //container size.width*0.9 and height size.height*0.3 in which user caan upload pictures in vedio
                        DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: [8, 4],
                          strokeWidth: 2,
                          radius: Radius.circular(10),
                          color: Colors.greenAccent[400]!,
                          child: InkWell(
                            onTap: () {
                              print('tapped');
                              getImage();
                            },
                            child: Container(
                                width: size.width * 0.9,
                                height: size.height * 0.16,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 247, 218, 218),
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: _image == null
                                        ? AssetImage(
                                            'assets/images/image (15) 1 (Traced).png')
                                        : FileImage(File(_image!.path))
                                            as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),

                                  //dotid border
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Container(
                                      width: size.width * 0.15,
                                      height: size.height * 0.06,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6))),
                                      child: Image.asset(
                                          'assets/images/image (15) 1 (Traced).png'),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Text(
                                      'Upload pictures and videos',
                                      style: TextStyle(
                                        color: Color(0xff19212C),
                                        fontSize: size.width * 0.05,
                                      ),
                                    ),
                                    Text(
                                      'Up to 52 MB',
                                      style: TextStyle(
                                        color: Color(0xff7C7878),
                                        fontSize: size.width * 0.04,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        ),

                        ButtonRedForAuth(
                            size: size,
                            text: 'Submit Nomination',
                            onpressed: () {})
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
        // bottomNavigationBar: BottomMenu(),
        );
  }
}
//function for image picker from gallery

class ButtonRedForAuth extends StatelessWidget {
  const ButtonRedForAuth({
    Key? key,
    required this.size,
    required this.text,
    required this.onpressed,
    this.width,
    this.height,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function onpressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onpressed();
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent[400]!,
          minimumSize:
              Size(width ?? size.width * 0.9, height ?? size.height * 0.06),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 8,
          shadowColor: Colors.black),
    );
  }
}

class TextFormFieldAuth extends StatelessWidget {
  final TextEditingController Controller;
  final Size size;
  final String text;
  final Function onpressed;
  final Icon? icon;
  final bool obscureText;
  final Icon? suffixIcon;
  TextFormFieldAuth({
    Key? key, // Add the key parameter here
    required this.Controller,
    required this.size,
    required this.text,
    required this.onpressed,
    this.icon, // no need to add the icon parameter here

    this.obscureText = false,
    this.suffixIcon,

    // Add the onpressed parameter here
  } // Add the onpressed parameter here

      ) : super(key: key); // Initialize the super constructor with the key parameter

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.light,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      controller: Controller,
      decoration: InputDecoration(
        labelText: text,
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          color: Color(0xff9E9E9E),
          fontSize: size.height * 0.02,
        ),
        contentPadding: EdgeInsets.only(left: 15, right: 20),
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Color(0xffffffff),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xffffffff)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xffF5F7F9)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xffF5F7F9)),
        ),
      ),
    );
  }
}
