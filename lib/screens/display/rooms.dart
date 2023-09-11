// ignore_for_file: unrelated_type_equality_checks
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/cubit/cubit.dart';
import 'package:hotel/cubit/states.dart';

class Rooms extends StatefulWidget {
  const Rooms({super.key});

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
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
        create: (BuildContext context) => RoomsCubit()..getRooms(),
        child: BlocConsumer<RoomsCubit, RoomsStates>(
            listener: (BuildContext context, RoomsStates state) {},
            builder: (BuildContext context, RoomsStates state) {
              var list = RoomsCubit.get(context).getRoomsList;
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
                            condition: state is! RoomsLoadingState,
                            builder: (context) => SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(columns: const [
                                DataColumn(label: Text('Room Number')),
                                DataColumn(label: Text('Room Type')),
                                DataColumn(label: Text('Active')),
                                DataColumn(label: Text('Food')),
                                DataColumn(label: Text('BedCount')),
                                DataColumn(label: Text('Cancellation')),
                                DataColumn(label: Text('Rent')),
                                DataColumn(label: Text('Phone Number')),
                                DataColumn(label: Text('Message')),
                              ], rows: [
                                for (int i = 0; i < list.length; ++i) ...{
                                  DataRow(cells: [
                                    DataCell(Text(list[i]['id'].toString())),
                                    DataCell(Text(list[i]['room_price']
                                            ['roomType']
                                        .toString())),
                                    DataCell(Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: list[i]['AC'] == 1
                                                ? Colors.green
                                                : Colors.redAccent),
                                        child: list[i]['AC'] == 1
                                            ? const Text(
                                                'Active',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            : const Text(
                                                'Not Active',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))),
                                    DataCell(Text(list[i]['Food'].toString())),
                                    DataCell(
                                        Text(list[i]['BedCount'].toString())),
                                    DataCell(list[i]['cancellation']
                                                .toString() ==
                                            '0.05'
                                        ? const Text('5% Before 24Hours')
                                        : (list[i]['cancellation'].toString() ==
                                                '1.00'
                                            ? const Text('Free')
                                            : const Text(
                                                'No Cancellation Allow'))),
                                    DataCell(Text(list[i]['room_price']['price']
                                        .toString())),
                                    DataCell(Text(
                                        list[i]['PhoneNumber'].toString())),
                                    DataCell(list[i]['message'] == null
                                        ? const Text('No Message')
                                        : Text(list[i]['message'].toString())),
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
