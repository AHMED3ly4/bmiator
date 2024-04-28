import 'package:cloud_firestore/cloud_firestore.dart';

class BMIModel {
  final int weight;
  String id;
  double grade;
  final int height;
  final int age;
  final String statue;
  final DateTime date;

  BMIModel({required this.statue,required this.grade, this.id='', required this.weight, required this.height, required this.age,required this.date});

  factory BMIModel.fromJson(Map<String,dynamic> json) => BMIModel(
      statue :json["statue"],
      grade :json["grade"],
      id: json["id"],
      weight: json["weight"],
      height: json["height"],
      age: json["age"],
      date: (json["date"] as Timestamp ).toDate(),
  );

  Map<String,dynamic> toJson() => {
    "statue":statue,
    "grade":grade,
    "id":id,
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