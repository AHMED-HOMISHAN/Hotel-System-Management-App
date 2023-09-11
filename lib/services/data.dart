import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:hotel/api/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data extends ChangeNotifier {

// --------------------- Rooms ---------------------//

// ------ Get Rooms ---------//
  Future<Response> getRooms() async {
    final prefs = await SharedPreferences.getInstance();

    Dio.Response response = await dio().get('/roomGet',
        options: Dio.Options(headers: {
          'Authorization': 'Bearer ${await prefs.getString('token')}'
        }));

    return response;
  }

// ------ ADD Room ---------//

  Future<Response> getRoomType() async {
    final prefs = await SharedPreferences.getInstance();
    Dio.Response response = await dio().get(
      '/getRoomType',
      options: Dio.Options(headers: {
        'Authorization': 'Bearer ${await prefs.getString('token')}'
      }),
    );
    return response;
  }

  Future<void> StoreRoom(Map creds) async {
    final prefs = await SharedPreferences.getInstance();

    await dio().post('/AddRoom',
        options: Dio.Options(headers: {
          'Authorization': 'Bearer ${await prefs.getString('token')}'
        }),
        data: creds);
  }

  // --------------------- Bookings ---------------------//
  Future<Response> getBookings() async {
    final prefs = await SharedPreferences.getInstance();

    Dio.Response response = await dio().get('/bookingGet',
        options: Dio.Options(headers: {
          'Authorization': 'Bearer ${await prefs.getString('token')}'
        }));
    return response;
  }

// ------ ADD Booking ---------//

  Future<void> AddBookings(Map creds) async {
    final prefs = await SharedPreferences.getInstance();

    await dio().post('/AddBooking',
        options: Dio.Options(headers: {
          'Authorization': 'Bearer ${await prefs.getString('token')}'
        }),
        data: creds);
  }


// --------------------- Staffs ---------------------//

// ------ Get Staffs ---------//
  Future<Response> getStaffs() async {
    final prefs = await SharedPreferences.getInstance();

    Dio.Response response = await dio().get('/getStaffs',
        options: Dio.Options(headers: {
          'Authorization': 'Bearer ${await prefs.getString('token')}'
        }));

    return response;
  }



}
