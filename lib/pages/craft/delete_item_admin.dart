import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hope_orphanage/main.dart';
import 'package:hope_orphanage/widgets/slidable.dart';
import 'package:http/http.dart' as http;

import '../../model/user_model.dart';
import 'edit_craft_item.dart';

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
      print('success');
    }
  }

  Future<List<CraftModel>> getRequest() async {
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
        title: const Text("C R A F T - S H O P"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('INFO'),
                      content: Text(
                          'To update or delete the items swipe to the right on the tiles.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Understood'),
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.info),
          ),
        ],
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
            return const Center(
              child: Text("No crafts available."),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, index) {
                return Slidable(
                  startActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      CustomSlidable(onPressed: (context) async {
                        await deleteData(snapshot.data[index].id);
                        setState(() {});
                      }),
                      CustomSlidable(
                        onPressed: (context) async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CraftEdit(
                                craftUser: snapshot.data[index],
                              ),
                            ),
                          );
                        },
                        backgroundColor: Colors.blue,
                        label: 'Edit',
                        icon: Icons.edit,
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: 100,
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
                          snapshot.data[index].name,
                        ),
                        trailing: Text(
                          "Price: ${snapshot.data[index].price}",
                        ),
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