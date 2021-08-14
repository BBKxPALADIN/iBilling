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
    'contracts',
    'history',
    'new_contract',
    'saved',
    'profile',
    'new_invoice',
  ];

  static List<String> statuses = <String>[
    'paid',
    'in_process',
    'rejected_by_IQ',
    'rejected_by_payme',
  ];

  static List<String> entity=<String>[
    'individual',
    'legal_entity',
  ];
}

