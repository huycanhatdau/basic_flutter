import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'import.dart';

SizedBox w(double w) => SizedBox(width: w);
SizedBox h(double h) => SizedBox(height: h);

bool empty([dynamic data, bool acceptZero = false]) {
  if (data != null) {
    if ((data is Map || data is List) &&
        (data.length == 0 ||
            (data is List &&
                data.length == 1 &&
                empty(data.first, acceptZero)))) {
      return true;
    }
    if ((data is Map || data is Iterable) && data.isEmpty) {
      return true;
    }
    if (data is bool) {
      return !data;
    }
    if ((data is String || data is num) && (data == '0' || data == 0)) {
      if (acceptZero) {
        return false;
      } else {
        return true;
      }
    }
    if (data.toString().trim().isNotEmpty) {
      return false;
    }
  }
  return true;
}

double parseDouble(dynamic data, [double defaultValue = 0]) {
  if (data is num && (data.isNaN || data.isInfinite)) {
    return 0.0;
  }
  if (data is int) {
    return (data * 1.0);
  }
  if (data is double) return data;
  if (data is String && data != '') {
    try {
      return double.parse(data);
    } catch (e) {
      return defaultValue;
    }
  }
  return defaultValue;
}

int parseInt(dynamic data) {
  if (data is num && (data.isNaN || data.isInfinite)) {
    return 0;
  }
  if (data is int) {
    return data;
  }
  if (data is double) {
    return data.ceil();
  }
  if (data is String && RegExp(r'^\d+$').hasMatch(data)) {
    try {
      return int.parse(data);
    } catch (e) {
      return 0;
    }
  }
  return 0;
}

Map<T, dynamic> toMap<T>(dynamic other) {
  if (other is Map<T, dynamic>) {
    if (other.containsKey('_id')) {
      other.remove('_id');
    }
    return other;
  }

  if (other is List || other is Map) {
    final mapOther = (other is Map) ? other : (other as List).asMap();
    if (mapOther.containsKey('_id')) {
      mapOther.remove('_id');
    }
    if (T.toString() == 'String') {
      return mapOther.map<T, dynamic>(
          (key, value) => MapEntry<T, dynamic>('${key ?? ''}' as T, value));
    }
    if (T.toString() == 'int') {
      return mapOther.map<T, dynamic>(
          (key, value) => MapEntry<T, dynamic>(parseInt(key) as T, value));
    }
    if (T.toString() == 'double') {
      return mapOther.map<T, dynamic>(
          (key, value) => MapEntry<T, dynamic>(parseDouble(key) as T, value));
    }
  }
  return <T, dynamic>{};
}

List toList(dynamic data) {
  if (data is List) {
    return data;
  } else if (data is Map) {
    return data.entries.map((e) {
      if (e.value is Map) {
        try {
          if (e.value is Map<String, dynamic> ||
              e.value is Map<dynamic, dynamic>) {
            e.value.addAll(<String, dynamic>{'listKey': e.key});
          }
          return e.value;
        } catch (error) {
          return e.value;
        }
      } else {
        return e.value;
      }
    }).toList();
  } else {
    return [];
  }
}

T? checkType<T>(dynamic value) {
  if (value is T) return value;
  return null;
}

List makeTreeItems(List? items, int? length) {
  if (length == null || length <= 1 || items == null) {
    return items ?? [];
  }
  int l = length;
  if (items.length < length) {
    l = items.length;
  }
  List items0 = [];
  for (int index = 0; index < (items.length / length).ceil(); index++) {
    int max = (index * l) + l;
    if (max > items.length) {
      max = items.length;
    }
    final subItems = items.sublist(index * l, max);
    List.generate(subItems.length, (i) {
      if (subItems.elementAt(i) is Map) {
        subItems
            .elementAt(i)
            .addAll({'itemIndex': ((index * l) + i).toString()});
      }
    });
    items0.add(subItems);
  }
  return items0;
}
