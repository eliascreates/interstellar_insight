import 'package:flutter/material.dart';

enum CharacterStatus {
  alive,
  unknown,
  operational,
  deceased,
  destroyed,
  imprisoned,
}

extension CharacterStatusX on CharacterStatus {
  static CharacterStatus fromString(String status) {
    switch (status.split(' ').first.trim().toLowerCase()) {
      case 'alive':
        return CharacterStatus.alive;
      case 'unknown':
        return CharacterStatus.unknown;
      case 'operational':
        return CharacterStatus.operational;
      case 'deceased':
      case 'dead':
        return CharacterStatus.deceased;
      case 'destroyed':
        return CharacterStatus.destroyed;
      case 'imprisoned':
        return CharacterStatus.imprisoned;
      default:
        return CharacterStatus.unknown;
    }
  }

  Color get color {
    switch (this) {
      case CharacterStatus.alive:
        return Colors.greenAccent;
      case CharacterStatus.unknown:
        return Colors.orangeAccent;
      case CharacterStatus.operational:
        return Colors.blueAccent;
      case CharacterStatus.deceased:
        return Colors.redAccent;
      case CharacterStatus.destroyed:
        return Colors.blueGrey.shade900;
      case CharacterStatus.imprisoned:
        return Colors.purpleAccent;
    }
  }
}
