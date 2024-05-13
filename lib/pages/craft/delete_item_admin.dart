// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hope_orphanage/main.dart';
import 'package:http/http.dart' as http;

import '../../model/user_model.dart';

class CraftDelete extends StatefulWidget {
  const CraftDelete({Key? key}) : super(key: key);

  @override
  State<CraftDelete> createState() => _CraftDeleteState();
}

class _CraftDeleteState extends State<CraftDelete> {
  Future<void> deleteData(String id) async {
    String url = "http://$iPAddress/Hope/admin_craft_delete.php";
    var res = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    var response = json.decode(res.body);
    if (response["success"] == "true") {
      if (kDebugMode) {
        print('success');
      }
    }
  }

  Future<List<CraftModel>> getRequest() async {
    //replace your restFull API here.
    final response = await http.get(
      Uri.parse(
        "http://$iPAddress/Hope/admin_craft_display.php",
      ),
    );
    var responseData = json.decode(response.body);
    //Creating a list to store input data;
    List<CraftModel> crafts = [];
    for (var singleUser in responseData) {
      CraftModel craft = CraftModel(
        name: singleUser["name"].toString(),
        id: singleUser["id"].toString(),
        craftID: singleUser["craft_id"].toString(),
        price: singleUser["price"].toString(),
        description: singleUser["description"].toString(),
        image: singleUser["image"].toString(),
      );
      crafts.add(craft);
    }
    return crafts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C R A F T - S H O P"),
      ),
      body: FutureBuilder(
        future: getRequest(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red[900],
                strokeWidth: 5,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return Center(
              child: Text("No crafts available."),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: ListTile(
                      leading: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: NetworkImage(
                              snapshot.data[index].image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        "Craft Name: ${snapshot.data[index].name}",
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            "Craft Price: ${snapshot.data[index].price}",
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Confirm Deletion"),
                                content: Text(
                                    "Are you sure you want to delete this craft?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      deleteData(snapshot.data[index].id);
                                      Navigator.of(context).pop();
                                      setState(() {});
                                    },
                                    child: Text("Delete"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}