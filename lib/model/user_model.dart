class EventModel {
  final String id;
  final String name;
  final String eventDate;
  final String eventTime;
  final String description;

  EventModel({
    required this.id,
    required this.name,
    required this.eventDate,
    required this.eventTime,
    required this.description,
  });
}

class CraftModel {
  final String id;
  final String name;
  final String craftID;
  final String price;
  final String description;
  final String image;

  CraftModel({
    required this.id,
    required this.name,
    required this.craftID,
    required this.price,
    required this.description,
    required this.image,
  });
}

class DonationModel {
  final String name;
  final String place;
  final String phone;
  final String amount;
  final String bank;
  final String account;

  DonationModel({
    required this.name,
    required this.place,
    required this.phone,
    required this.amount,
    required this.bank,
    required this.account,
  });
}

class FoodModel {
  final String id;
  final String date;
  final String donor;
  final String food;

  FoodModel({
    required this.id,
    required this.date,
    required this.donor,
    required this.food,
  });
}

class CartModel {
  final String id;
  final String craftID;
  final String qty;
  final String cid;
  final String name;
  final String price;
  final String image;
  final String description;

  CartModel({
    required this.id,
    required this.craftID,
    required this.qty,
    required this.cid,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
}
