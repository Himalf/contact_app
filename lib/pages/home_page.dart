import 'dart:io';

import 'package:contact/models/contact_model.dart';
import 'package:contact/models/lat_lng_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  List<ContactModel> contacts = [
    ContactModel(
        name: "Himal",
        phoneNumber: "9867527352",
        image:
            "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        position: LatLngModel(latitude: 27.6866, longitude: 27.6866)),
    ContactModel(
        name: "Hari",
        phoneNumber: "9765310103",
        image:
            "https://images.pexels.com/photos/1542085/pexels-photo-1542085.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        position: LatLngModel(latitude: 27.6866, longitude: 27.6866)),
    ContactModel(
        name: "Ramlal",
        phoneNumber: "9765310103",
        image:
            "https://images.pexels.com/photos/2848028/pexels-photo-2848028.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        position: LatLngModel(latitude: 27.6866, longitude: 27.6866)),
  ];
  final ImagePicker picker = ImagePicker();
  File? image;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 1,
        title: Text(
          "Contacts",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        // leading: Icon(
        //   Icons.back_hand,
        //   color: Colors.white,
        // ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    // isDismissible: true,
                    context: context,
                    builder: (_) =>
                        StatefulBuilder(builder: (context, setState) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: SingleChildScrollView(
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.close))
                                    ],
                                  ),
                                  Text(
                                    "Add Contact",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: deviceHeight * 0.02,
                                  ),
                                  Container(
                                    height: 90,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: image == null
                                        ? IconButton(
                                            onPressed: () async {
                                              final XFile? pickedImage =
                                                  await picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              print(pickedImage!.path);
                                              setState(() {
                                                image = File(pickedImage.path);
                                              });
                                            },
                                            icon: Icon(Icons.add_a_photo))
                                        : Image.file(
                                            image!,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            label: Text(
                                              "Name",
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            hintText: "Enter Name of person",
                                          ),
                                        ),
                                        SizedBox(
                                          height: deviceHeight * 0.02,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              label: Text(
                                                "PhoneNumber",
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              hintText: "Enter Phone number"),
                                        ),
                                        SizedBox(
                                          height: deviceHeight * 0.02,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {},
                                            child: Text("Add Contacts"))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }));
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    contacts[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].phoneNumber),
              trailing: IconButton(
                onPressed: () {
                  _makePhoneCall(contacts[index].phoneNumber);
                },
                icon: Icon(Icons.phone),
              ),
            );
          }),
    );
  }
}
