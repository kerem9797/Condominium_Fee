import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  )
);

const kContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
  topLeft: Radius.circular(20.0),
  topRight: Radius.circular(20.0),
  ),
);

const kTextTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.grey,
  fontWeight: FontWeight.w700,
);

const kSizedBox10 = SizedBox(height: 10,);

const kSizedBox20 = SizedBox(height: 20,);

