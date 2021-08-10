import 'package:flutter/material.dart';
import '../ui/screens.dart';

class Pages {
  static var pages = <Widget>[
    const Contracts(),
    const History(),
    const NewContract(),
    const Saved(),
    const Profile(),
  ];
}

class Titles {
  static List<String> labels = <String>[
    'Contracts',
    'History',
    'New Contract',
    'Saved',
    'Profile',
    'New Invoice',
  ];
}

class Status {
  static List<String> statuses = <String>[
    'Paid',
    'In process',
    'Rejected by IQ',
    'Rejected by Payme',
  ];
}

class Entity{
  static List<String> entity=<String>[
    'Individual',
    'Legal Entity',
  ];
}