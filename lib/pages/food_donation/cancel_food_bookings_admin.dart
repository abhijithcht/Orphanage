import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../../model/user_model.dart';

class FoodCancel extends StatefulWidget {
  const FoodCancel({super.key});

  @override
  State<FoodCancel> createState() => _FoodCancelState();
}

class _FoodCancelState extends State<FoodCancel> {
  Future<List<FoodModel>> getRequest() async {
    String url = "http://$iPAddress/Hope/user_food_donation_display.php";
    final response = await http.get(Uri.parse(url));
    var responseData = jsonDecode(response.body);

    List<FoodModel> foods = [];
    for (var singleUser in responseData) {
      FoodModel food = FoodModel(
        id: singleUser["id"].toString(),
        date: singleUser["date"].toString(),
        donor: singleUser["donor"].toString(),
        food: singleUser["food"].toString(),
      );
      foods.add(food);
    }
    return foods;
  }

  Future<void> deleteData(String id) async {
    String url = "http://$iPAddress/Hope/admin_delete_food_bookings.php";
    var res = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    var response = jsonDecode(res.body);
    if (response["success"] == "true") {
      print('success');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'F O O D -  D O N A T I O N S',
        ),
      ),
      body: FutureBuilder(
        future: getRequest(),
        builder: (BuildContext ctx, AsyncSnapshot<List<FoodModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red[900],
                strokeWidth: 5,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data available.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 5,
                    ),
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(snapshot.data![index].donor),
                              leading: Text(snapshot.data![index].food),
                              subtitle: Text(snapshot.data![index].date),
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Confirm Deletion"),
                                        content: const Text(
                                            "Are you sure you want to delete this craft?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              deleteData(
                                                  snapshot.data![index].id);
                                              Navigator.of(context).pop();
                                              setState(() {});
                                            },
                                            child: const Text("Delete"),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}