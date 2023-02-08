import 'dart:convert';
import 'package:flutter/material.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Model> data = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromARGB(255, 241, 236, 236),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 30, 16, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'User ID: ${data[index].id}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 77, 42, 42)),
                        ),
                        Text('Name: \n${data[index].name}'),
                        Text('UserName: \n${data[index].username}'),
                        Text('Email: \n${data[index].email}'),
                        Text('Street: \n${data[index].address!.street}'),
                        Text('Suite:\n${data[index].address!.suite}'),
                        Text('City: \n${data[index].address!.city}'),
                        Text('ZipCode: \n${data[index].address!.zipcode}'),
                        Text('Latitude: \n${data[index].address!.geo!.lat}'),
                        Text('Longitude: \n${data[index].address!.geo!.lng}'),
                        Text('Phone:\n${data[index].phone}'),
                        Text('Website: \n${data[index].website}'),
                        Text('Name: \n${data[index].company!.name}'),
                        Text(
                            'Catch Phrase: \n${data[index].company!.catchPhrase}'),
                        Text('BS: \n${data[index].company!.bs}'),
                      ],
                    ),
                  ),
                );
              },
              itemCount: data.length,
              //10 item when kept 10 but infinite data when used length
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<Model>> getData() async {
    List<Model> modelData = [];
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        modelData.add(Model.fromJson(index));
      }
      return modelData;
    } else {
      return modelData;
    }
  }
}
