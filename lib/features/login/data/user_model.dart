// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user_model.freezed.dart';
// part 'user_model.g.dart';

// @freezed
// class UserModel with _$UserModel {
//   const factory UserModel({
//     required String id,
//     required String name,
//     required String email,
//   }) = _UserModel;

//   factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => 
      _$UserModelFromJson(json);
}