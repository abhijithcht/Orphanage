import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hope_orphanage/app_imports.dart';
import 'package:http/http.dart' as http;

class AddToCart extends StatefulWidget {
  const AddToCart({
    super.key,
    required this.craftID,
    required this.name,
    required this.price,
    required this.description,
    this.image,
  });

  final String craftID;
  final String name;
  final String price;
  final String description;
  final dynamic image;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  TextEditingController qty = TextEditingController(text: "1");

  final _style = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );

  Future<void> addToCart() async {
    var url = "http://$iPAddress/Hope/user_add_to_cart.php";
    Map<String, String> mapedData = {
      'craft_id': widget.craftID,
      'qty': qty.text,
      'uid': uidUser,
    };
    http.Response response = await http.post(Uri.parse(url), body: mapedData);

    if (response.body.isEmpty) {
      if (mounted) {
        setState(() {});
      }
    } else {
      var data = jsonDecode(response.body);
      var responseError = data["error"];
      if (responseError) {
        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD TO CART'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.name,
              style: _style,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.image,
                ),
              ),
            ),
            Text(
              'Price: ${widget.price}',
              style: _style,
            ),
            Text(
              'Description: ${widget.description}',
              style: _style,
            ),
            const SizedBox(
              height: 50,
            ),
            ELB(
              text: 'Add to Cart',
              onPressed: () {
                setState(() {
                  addToCart();
                });

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('INFO'),
                      content: Text('Item added to Cart.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
