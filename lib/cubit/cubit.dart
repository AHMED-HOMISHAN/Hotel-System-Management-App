import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/auth/auth.dart';
import 'package:hotel/components/components.dart';
import 'package:hotel/cubit/states.dart';
import 'package:hotel/screens/display/bookings.dart';
import 'package:hotel/screens/display/profile.dart';
import 'package:hotel/screens/display/rooms.dart';
import 'package:hotel/screens/display/staff.dart';
import 'package:hotel/services/data.dart';
import 'package:provider/provider.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;

  List<Widget> screens = const [
    Bookings(),
    Rooms(),
    Staffs(),
    Profile(),
  ];

  List<String> titles = const [
    'Bookings',
    'Rooms',
    'Staffs',
    'Profile',
  ];

  void changeIndex(int index) {
    currentindex = index;
    emit(AppChangeBottomNavBarState());
  }
}

// ----------------- AppLoginCubit ---------------//

class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(AppLoginIntialState());
  static AppLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required BuildContext context,
    required Map creds,
  }) {
    emit(AppLoginLoadingState());
    Provider.of<Auth>(context, listen: false)
        .login(creds, context)
        .then((value) => emit(AppLoginSuccessState()))
        .catchError((error) {
      emit(AppLoginErrorState(error.toString()));
    });
  }
}

// ----------------- RoomsCubit ---------------//

class RoomsCubit extends Cubit<RoomsStates> {
  RoomsCubit() : super(RoomsIntialState());
  static RoomsCubit get(context) => BlocProvider.of(context);
  var getRoomsList = [];
  void getRooms() {
    emit(RoomsLoadingState());
    Data().getRooms().then((value) {
      getRoomsList = value.data;
      emit(RoomsSuccessState());
    }).catchError((error) {
      emit(RoomsErrorState(error.toString()));
    });
  }
}

//------ADD ROOMCubit----//

class ADDRoomsCubit extends Cubit<RoomsStates> {
  ADDRoomsCubit() : super(ADDRoomsIntialState());
  static ADDRoomsCubit get(context) => BlocProvider.of(context);

  var getRoomTypeList = [];
  void getRoomType({
    required BuildContext context,
  }) {
    Provider.of<Data>(context, listen: false).getRoomType().then((value) {
      for (int i = 0; i < value.data.length; i++) {
        getRoomTypeList.add(value.data[i]);
      }
      emit(RoomsSuccessState());
    }).catchError((error) {});
  }

  void StoreRoom({
    required BuildContext context,
    required Map creds,
  }) {
    emit(ADDRoomsLoadingState());
    Provider.of<Data>(context, listen: false).StoreRoom(creds).then((value) {
      print(creds);
      emit(ADDRoomsSuccessState());
      Messanger(
          context: context,
          message: 'Room is added successfully',
          status: true);
    }).catchError((error) {
      emit(ADDRoomsErrorState(error.toString()));
      Messanger(context: context, message: error.toString(), status: false);
    });
  }
}

// ----------------- BookingsCubit ---------------//

class BookingsCubit extends Cubit<BookingsStates> {
  BookingsCubit() : super(BookingsIntialState());
  static BookingsCubit get(context) => BlocProvider.of(context);

  var getBookingsList = [];

  void getBookings() {
    emit(BookingsLoadingState());
    Data().getBookings().then((value) {
      getBookingsList = value.data;

      emit(BookingsSuccessState());
    }).catchError((error) {
      emit(BookingsErrorState(error.toString()));
    });
  }
}

//------ADD BookingCubit----//

class ADDBookingsCubit extends Cubit<BookingsStates> {
  ADDBookingsCubit() : super(ADDBookingsIntialState());
  static ADDBookingsCubit get(context) => BlocProvider.of(context);

  void StoreBooking({
    required BuildContext context,
    required Map creds,
  }) {
    emit(ADDBookingsLoadingState());
    Provider.of<Data>(context, listen: false).AddBookings(creds).then((value) {
      emit(ADDBookingsSuccessState());

      Messanger(
          context: context,
          message: 'Booking is added successfully',
          status: true);
    }).catchError((error) {
      emit(ADDBookingsErrorState(error.toString()));
      Messanger(context: context, message: error.toString(), status: false);
    });
  }
}

// ----------------- StaffsCubit ---------------//

class StaffsCubit extends Cubit<StaffsStates> {
  StaffsCubit() : super(StaffsIntialState());
  static StaffsCubit get(context) => BlocProvider.of(context);

  var getStaffsList = [];

  void getStaffs() {
    emit(StaffsLoadingState());
    Data().getStaffs().then((value) {
      getStaffsList = value.data;
      print(value.data.toString());
      emit(StaffsSuccessState());
    }).catchError((error) {
      emit(StaffsErrorState(error.toString()));
    });
  }
}
