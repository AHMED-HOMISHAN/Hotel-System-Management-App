import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/cubit/cubit.dart';
import 'package:hotel/cubit/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Staffs extends StatefulWidget {
  const Staffs({super.key});

  @override
  State<Staffs> createState() => _StaffsState();
}

class _StaffsState extends State<Staffs> {
  List<String> info = ['', '', ''];

  Future<void> getInfo() async {
    final prefs = await SharedPreferences.getInstance();
    if (await prefs.getStringList('info')?.length != 0) {
      info = (await prefs.getStringList('info'))!;
      setState(() {});
    }
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => StaffsCubit()..getStaffs(),
        child: BlocConsumer<StaffsCubit, StaffsStates>(
            listener: (BuildContext context, StaffsStates state) {},
            builder: (BuildContext context, StaffsStates state) {
              var list = StaffsCubit.get(context).getStaffsList;

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
                            condition: state is! StaffsLoadingState,
                            builder: (context) => SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(columns: const [
                                DataColumn(label: Text('Personal Name')),
                                DataColumn(label: Text('User Name')),
                                DataColumn(label: Text('Birthdate')),
                                DataColumn(label: Text('Phone Number')),
                                DataColumn(label: Text('Email')),
                                DataColumn(label: Text('Gender')),
                                DataColumn(label: Text('Joined Date')),
                                DataColumn(label: Text('Country')),
                                DataColumn(label: Text('Address')),
                                DataColumn(label: Text('role')),
                              ], rows: [
                                for (int i = 0; i < list.length; ++i) ...{
                                  if (list[i]['user_detail']['name']
                                          .toString() !=
                                      info[0]) ...{
                                    DataRow(cells: [
                                      DataCell(Text(list[i]['user_detail']
                                              ['name']
                                          .toString())),
                                      DataCell(list[i]['userName'] == null
                                          ? const Text('No User Name')
                                          : Text(
                                              list[i]['userName'].toString())),
                                      DataCell(Text(
                                          list[i]['birthdate'].toString())),
                                      DataCell(Text(
                                          list[i]['phoneNumber'].toString())),
                                      DataCell(Text(list[i]['user_detail']
                                              ['email']
                                          .toString())),
                                      DataCell(
                                          list[i]['gender'].toString() == '1'
                                              ? const Text('Male')
                                              : const Text('Female')),
                                      DataCell(Text(
                                          list[i]['joinedDate'].toString())),
                                      DataCell(
                                          Text(list[i]['country'].toString())),
                                      DataCell(
                                          Text(list[i]['address'].toString())),
                                      DataCell(Text(list[i]['user_detail']
                                              ['type']
                                          .toString())),
                                    ])
                                  }
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
