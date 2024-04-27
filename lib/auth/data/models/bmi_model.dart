import 'package:cloud_firestore/cloud_firestore.dart';

class BMIModel {
  final double weight;
  final double height;
  final int age;
  final String statue;
  final DateTime date;

  BMIModel(this.statue, {required this.weight, required this.height, required this.age,required this.date});

  factory BMIModel.fromJson(Map<String,dynamic> json) => BMIModel(
      json["statue"],
      weight: json["weight"],
      height: json["height"],
      age: json["age"],
    date: (json["date"] as Timestamp ).toDate(),
  );

  Map<String,dynamic> toJson() => {
    "statue":statue,
    "weight":weight,
    "height":height,
    "age":age,
    "date":Timestamp.fromDate(date),
  };
}

enum BMIStatue{
  underWeight,
  normal,
  overWeight,
  obesity,
}