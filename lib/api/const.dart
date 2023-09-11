import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(186, 0, 150, 135);

const Widget verticalSpacing = SizedBox(
  height: 20,
);

const Widget horizantelSpacing = SizedBox(
  width: 20,
);

const List<String> roomTypeitems = [
  'Single',
  'Double',
  'King',
  'Quad',
  'Suite',
  'Villa'
];

const List<String> fooditems = [
  'Free Breakfast',
  'Free Lunch',
  'Free Dinner',
  'Free Breakfast & Dinner',
  'Free Welcome Drink',
  'No Free Food'
];
const List<String> bedCountitems = ['1', '2', '3', '4', '5', '6', '7', '8'];

const List<String> cancellationitems = [
  'Free',
  '5% Before 24 Hours',
  'No Cancellation Allow'
];

const List<String> payChoices = ['Pay', 'Not Pay'];
const List<String> payChoicesNUM = ['1', '0'];

const List<String> cancellationNUMitems = ['1.0', '0.05', '0.0'];

DateTime initselectedDate = DateTime.now();

int isRoomActive = 0;
int isFoodActive = 0;
int isBedCountActive = 0;
int isCancellationActive = 0;
int ispayChoicesActive = 0;
int index = 0;
