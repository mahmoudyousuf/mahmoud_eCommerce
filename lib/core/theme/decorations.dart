import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration shadowContainer = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      blurRadius: 10,
      offset: const Offset(0, 2),
      color: const Color(0xff000000).withOpacity(.12),
      spreadRadius: 0,
    ),
    BoxShadow(
      blurRadius: 5,
      offset: const Offset(0, 2),
      color: const Color(0xff000000).withOpacity(.16),
      spreadRadius: 0,
    )
  ],
) ;