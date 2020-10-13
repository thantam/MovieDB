import 'package:flutter/material.dart';

class Theater {
  final String id;
  final String name;

  Theater({
    @required this.id,
    @required this.name
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Theater &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode;

}
