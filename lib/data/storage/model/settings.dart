// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:daylist/domain/model/city.dart';
import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/model/institution.dart';
import 'package:daylist/presentation/res/values.dart';

class Settings {
  City? city;
  Institution? institution;
  Group? group;
  int undergroup;

  bool isDark;
  bool isEvenWeek;
  bool isShowTime;
  bool isShortInitials;
  Color? primaryColor;
  Color? backgroundColor;
  double radius;

  Settings(
      {this.city,
      this.institution,
      this.group,
      this.primaryColor,
      this.isDark = false,
      this.isEvenWeek = false,
      this.undergroup = 1,
      this.backgroundColor,
      this.isShowTime = false,
      this.isShortInitials = false,
      this.radius = kDefaultRadius});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city!.toMap(),
      'institution': institution!.toMap(),
      'group': group!.toMap(),
      'undergroup': undergroup,
      'isDark': isDark,
      'isEvenWeek': isEvenWeek,
      'isShowTime': isShowTime,
      'primaryColor': primaryColor?.value,
      'backgroundColor': backgroundColor?.value,
      'radius': radius,
      'isShortInitials': isShortInitials
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
        city: City.fromMap(map['city']),
        institution: Institution.fromMap(map['institution']),
        group: Group.fromMap(map['group']),
        isEvenWeek: map['isEvenWeek'] ?? false,
        undergroup: map['undergroup'] ?? 1,
        isDark: map['isDark'] ?? false,
        isShowTime: map['isShowTime'] ?? false,
        isShortInitials: map['isShortInitials'] ?? false,
        primaryColor: map['primaryColor'] != null
            ? Color(map['primaryColor'] as int)
            : null,
        backgroundColor: map['backgroundColor'] != null
            ? Color(map['backgroundColor'] as int)
            : null,
        radius: map['radius'] ?? kDefaultRadius);
  }

  @override
  String toString() {
    return 'Settings(city: $city, institution: $institution, group: $group, undergroup: $undergroup, isDark: $isDark, isEvenWeek: $isEvenWeek, primaryColor: $primaryColor, backgroundColor: $backgroundColor, radius: $radius)';
  }

  Settings copyWith({
    City? city,
    Institution? institution,
    Group? group,
    int? undergroup,
    bool? isDark,
    bool? isEvenWeek,
    bool? isShowTime,
    bool? isShortInitials,
    Color? primaryColor,
    Color? backgroundColor,
    double? radius,
  }) {
    return Settings(
      city: city ?? this.city,
      institution: institution ?? this.institution,
      group: group ?? this.group,
      undergroup: undergroup ?? this.undergroup,
      isDark: isDark ?? this.isDark,
      isEvenWeek: isEvenWeek ?? this.isEvenWeek,
      isShowTime: isShowTime ?? this.isShowTime,
      isShortInitials: isShortInitials ?? this.isShortInitials,
      primaryColor: primaryColor ?? this.primaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      radius: radius ?? this.radius,
    );
  }
}
