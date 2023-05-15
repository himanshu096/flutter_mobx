import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@Collection()
class User {
  Id id = Isar.autoIncrement;

  late String firstName;

  late String? lastName;

  late DateTime? createdAt;

  late DateTime? updatedAt;

  User({required this.firstName, this.lastName, this.createdAt, this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}