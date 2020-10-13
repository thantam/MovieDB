import 'package:meta/meta.dart';

class Actor {
  Actor({
    @required this.name,
    this.avatarUrl,
  });

  String name;
  String avatarUrl;

  Actor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatarUrl = json['profile_path'];
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Actor &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              avatarUrl == other.avatarUrl;

  @override
  int get hashCode =>
      name.hashCode ^
      avatarUrl.hashCode;
}
