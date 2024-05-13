import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../../model/user_model.dart';

class EventView2 extends StatefulWidget {
  const EventView2({super.key});

  @override
  State<EventView2> createState() => _EventView2State();
}

class _EventView2State extends State<EventView2> {
  Future<List<EventModel>> getRequest() async {
    String url = "http://$iPAddress/Hope/admin_event_display.php";
    final response = await http.get(Uri.parse(url));
    var responseData = jsonDecode(response.body);

    List<EventModel> events = [];
    for (var singleUser in responseData) {
      EventModel event = EventModel(
        id: singleUser["id"].toString(),
        name: singleUser["name"].toString(),
        eventDate: singleUser["event_date"].toString(),
        eventTime: singleUser["event_time"].toString(),
        description: singleUser["description"].toString(),
      );
      events.add(event);
    }
    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'E V E N T S',
        ),
      ),
      body: FutureBuilder(
        future: getRequest(),
        builder: (BuildContext ctx, AsyncSnapshot<List<EventModel>> snapshot) {
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
              child: Text('No event data available.'),
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
                              title: Text(snapshot.data![index].name),
                              subtitle: Row(
                                children: [
                                  Text(
                                    snapshot.data![index].eventDate,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(snapshot.data![index].eventTime),
                                ],
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