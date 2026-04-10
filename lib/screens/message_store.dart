// lib/screens/message_store.dart

import 'package:flutter/material.dart';

class MessageStore {
  static List<Map<String, dynamic>> messages = [
    {
      'product':   'Surgical Knife – Pack of 10',
      'seller':    'MedSupply Co.',
      'myMessage': 'Hi, I am interested in this product. Is it available?',
      'reply':     'Yes we have stock, minimum order is 5 packs.',
      'time':      '01:25 PM',
      'hasReply':  true,
      'icon':      Icons.content_cut_rounded,
      'color':     const Color(0xFF0284C7),
      'bg':        const Color(0xFFE0F2FE),
      'price':     'Rs.1,299.00',
    },
    {
      'product':   'N95 Masks – Box of 50',
      'seller':    'HealthMart India',
      'myMessage': 'Can I get bulk pricing for 10 boxes?',
      'reply':     'We can offer 12% discount for 10+ boxes.',
      'time':      '11:40 AM',
      'hasReply':  true,
      'icon':      Icons.masks_rounded,
      'color':     const Color(0xFF16A34A),
      'bg':        const Color(0xFFDCFCE7),
      'price':     'Rs.499.00',
    },
    {
      'product':   'Oxygen Cylinder & Mask',
      'seller':    'GlobalMed Supplies',
      'myMessage': 'Is delivery available to Puducherry?',
      'reply':     '',
      'time':      '09:10 AM',
      'hasReply':  false,
      'icon':      Icons.air_rounded,
      'color':     const Color(0xFF0284C7),
      'bg':        const Color(0xFFE0F2FE),
      'price':     'Rs.2,199.00',
    },
  ];
}