import 'package:daylist/presentation/res/values.dart';
import 'package:flutter/material.dart';

import 'package:daylist/domain/model/city.dart';
import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/model/institution.dart';

class Settings {
  City? city;
  Institution? institution;
  Group? group;
  int undergroup;

  bool isDark;
  Color? primaryColor;
  Color? backgroundColor;
  double radius;

  Settings(
      {this.city,
      this.institution,
      this.group,
      this.undergroup = 1,
      this.isDark = false,
      this.primaryColor,
      this.backgroundColor,
      this.radius = kDefaultRadius});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city!.toMap(),
      'institution': institution!.toMap(),
      'group': group!.toMap(),
      'undergroup': undergroup,
      'isDark': isDark,
      'primaryColor': primaryColor?.value,
      'backgroundColor': backgroundColor?.value,
      'radius': radius
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
        city: City.fromMap(map['city']),
        institution: Institution.fromMap(map['institution']),
        group: Group.fromMap(map['group']),
        undergroup: map['undergroup'] ?? 1,
        isDark: map['isDark'] as bool,
        primaryColor: map['primaryColor'] != null
            ? Color(map['primaryColor'] as int)
            : null,
        backgroundColor: map['backgroundColor'] != null
            ? Color(map['backgroundColor'] as int)
            : null,
        radius: map['radius']);
  }
}
