import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late Future<List<Welcome>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 212, 212),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Users List'),
      ),
      body: Center(
        child: FutureBuilder<List<Welcome>>(
          future: futureAlbums,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Welcome album = snapshot.data![index];
                  return Card(
                    elevation: 2.0,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        album.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      subtitle: Text(
                        album.email,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonDetailsPage(
                              persons: snapshot.data!,
                              currentIndex: index,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return const Text('No data found');
            }
          },
        ),
      ),
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
    );
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}

class Welcome {
  final String name;
  final String email;
  final String username;
  final Address address;
  final String website;
  final Company company;
  final String phone;

  Welcome({
    required this.name,
    required this.email,
    required this.username,
    required this.address,
    required this.website,
    required this.company,
    required this.phone,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      name: json['name'],
      email: json['email'],
      username: json['username'],
      address: Address.fromJson(json['address']),
      website: json['website'],
      company: Company.fromJson(json['company']),
      phone: json['phone'],
    );
  }
}

Future<List<Welcome>> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((data) => Welcome.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}