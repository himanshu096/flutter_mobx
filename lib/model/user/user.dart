import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

class User {
  int id;

  late String firstName;

  late String? lastName;

  late DateTime? createdAt;

  late DateTime? updatedAt;

  User({required this.id, required this.firstName, this.lastName, this.createdAt, this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}