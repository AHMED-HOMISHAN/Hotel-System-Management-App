import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/cubit/cubit.dart';
import 'package:hotel/cubit/states.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => BookingsCubit()..getBookings(),
        child: BlocConsumer<BookingsCubit, BookingsStates>(
            listener: (BuildContext context, BookingsStates state) {},
            builder: (BuildContext context, BookingsStates state) {
              var list = BookingsCubit.get(context).getBookingsList;

              return SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(9),
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.grey[300]),
                        child: const Row(children: [
                          Text(
                            'search',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.search_rounded,
                            size: 20,
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          ConditionalBuilder(
                            condition: state is! BookingsLoadingState,
                            builder: (context) => SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(columns: const [
                                DataColumn(label: Text('Booking Number')),
                                DataColumn(label: Text('Room Number')),
                                DataColumn(label: Text('Personal Name')),
                                DataColumn(label: Text('Total Members')),
                                DataColumn(label: Text('Arrival Date')),
                                DataColumn(label: Text('Depature Date')),
                                DataColumn(label: Text('Email')),
                                DataColumn(label: Text('Phone Number')),
                                DataColumn(label: Text('Message')),
                                DataColumn(label: Text('Paied')),
                              ], rows: [
                                for (int i = 0; i < list.length; ++i) ...{
                                  DataRow(cells: [
                                    DataCell(Text(list[i]['id'].toString())),
                                    DataCell(
                                        Text(list[i]['roomNumber'].toString())),
                                    DataCell(Text(
                                        list[i]['personalName'].toString())),
                                    DataCell(Text(
                                        list[i]['totalMembers'].toString())),
                                    DataCell(Text(
                                        list[i]['arrivalDate'].toString())),
                                    DataCell(Text(
                                        list[i]['depatureDate'].toString())),
                                    DataCell(Text(list[i]['email'].toString())),
                                    DataCell(Text(
                                        list[i]['phoneNumber'].toString())),
                                    DataCell(list[i]['message'] == null
                                        ? const Text('No Message')
                                        : Text(list[i]['message'].toString())),
                                    DataCell(Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: list[i]['paied'] == 1
                                                ? Colors.green
                                                : Colors.redAccent),
                                        child: list[i]['paied'] == 1
                                            ? const Text(
                                                'Paied',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            : const Text(
                                                'Not Paied',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))),
                                  ])
                                }
                              ]),
                            ),
                            fallback: (BuildContext context) {
                              return const Center(
                                heightFactor: 14,
                                child: CircularProgressIndicator(
                                  color: Color.fromARGB(186, 0, 150, 135),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
            }));
  }
}
