import 'package:json_annotation/json_annotation.dart';

part 'profile_entity.g.dart';

@JsonSerializable(anyMap: true)
class Profile {
  final String name;
  final String cpf;
  final String email;
  final String? password;

  Profile({
    required this.cpf,
    required this.email,
    required this.name,
    this.password,
  });

  String get nameFormatted => name.toUpperCase();

  factory Profile.fromJson(Map json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
