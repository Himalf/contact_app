import 'package:contact/models/contact_model.dart';
import 'package:contact/models/lat_lng_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
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
                    // isDismissible: true,
                    context: context,
                    builder: (_) => BottomSheet(
                        onClosing: () {},
                        builder: (_) => Container(
                              height: deviceHeight,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                    TextFormField(
                                      decoration: InputDecoration(
                                          label: Text(
                                            "PhoneNumber",
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          hintText: "Enter Phone number"),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          label: Text(
                                            "Image",
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          hintText: "Enter Image URL"),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(30),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Add Contacts")),
                                    )
                                  ],
                                ),
                              ),
                            )));
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
                onPressed: () {},
                icon: Icon(Icons.phone),
              ),
            );
          }),
    );
  }
}
