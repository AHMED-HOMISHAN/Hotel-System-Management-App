abstract class AppStates {}

class AppIntialState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

// ----------------- Login ---------------------//

abstract class AppLoginStates {}

class AppLoginIntialState extends AppLoginStates {}

class AppLoginLoadingState extends AppLoginStates {}

class AppLoginSuccessState extends AppLoginStates {}

class AppLoginErrorState extends AppLoginStates {
  final String error;
  AppLoginErrorState(this.error);
}

// ----------------- Rooms ---------------------//

abstract class RoomsStates {}

class RoomsIntialState extends RoomsStates {}

class RoomsLoadingState extends RoomsStates {}

class RoomsSuccessState extends RoomsStates {}

class RoomsErrorState extends RoomsStates {
  final String error;
  RoomsErrorState(this.error);
}

//----- ADD ROOM -----//

class ADDRoomsIntialState extends RoomsStates {}

class ADDRoomsLoadingState extends RoomsStates {}

class ADDRoomsSuccessState extends RoomsStates {}

class ADDRoomsErrorState extends RoomsStates {
  final String error;
  ADDRoomsErrorState(this.error);
}

// ----------------- Booking ---------------------//

abstract class BookingsStates {}

class BookingsIntialState extends BookingsStates {}

class BookingsLoadingState extends BookingsStates {}

class BookingsSuccessState extends BookingsStates {}

class BookingsErrorState extends BookingsStates {
  final String error;
  BookingsErrorState(this.error);
}

//----- ADD Booking -----//

class ADDBookingsIntialState extends BookingsStates {}

class ADDBookingsLoadingState extends BookingsStates {}

class ADDBookingsSuccessState extends BookingsStates {}

class ADDBookingsErrorState extends BookingsStates {
  final String error;
  ADDBookingsErrorState(this.error);
}

// ----------------- Staff ---------------------//

abstract class StaffsStates {}

class StaffsIntialState extends StaffsStates {}

class StaffsLoadingState extends StaffsStates {}

class StaffsSuccessState extends StaffsStates {}

class StaffsErrorState extends StaffsStates {
  final String error;
  StaffsErrorState(this.error);
}
