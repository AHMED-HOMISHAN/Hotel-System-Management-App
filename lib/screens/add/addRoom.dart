import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/api/const.dart';
import 'package:hotel/components/components.dart';
import 'package:hotel/cubit/cubit.dart';
import 'package:hotel/cubit/states.dart';

class AddData extends StatefulWidget {
  const AddData({super.key, required this.title});

  final String title;
  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController messageController = TextEditingController();
    var key = GlobalKey<FormState>();
    return BlocProvider(
        create: (context) => ADDRoomsCubit()..getRoomType(context: context),
        child: BlocConsumer<ADDRoomsCubit, RoomsStates>(
            listener: (context, state) {},
            builder: (BuildContext context, RoomsStates state) {
              var list = ADDRoomsCubit.get(context).getRoomTypeList;

              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Add ${widget.title}',
                    style: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          verticalSpacing,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Room Type',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              verticalSpacing,
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (var i in list) ...{
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isRoomActive = roomTypeitems
                                                .indexOf(i['roomType']);
                                            index = i['id'];
                                          });
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                                color: i['roomType'] ==
                                                        roomTypeitems[
                                                            isRoomActive]
                                                    ? primaryColor
                                                    : Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Center(
                                                child: Text(
                                              i['roomType'],
                                              style: TextStyle(
                                                  color: i['roomType'] ==
                                                          roomTypeitems[
                                                              isRoomActive]
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 13),
                                            ))),
                                      ),
                                      horizantelSpacing,
                                    }
                                  ],
                                ),
                              ),
                            ],
                          ),
                          verticalSpacing,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Food',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              verticalSpacing,
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (var i in fooditems) ...{
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isFoodActive = fooditems.indexOf(i);
                                          });
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                                color:
                                                    i == fooditems[isFoodActive]
                                                        ? primaryColor
                                                        : Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Center(
                                                child: Text(
                                              i,
                                              style: TextStyle(
                                                  color: i ==
                                                          fooditems[
                                                              isFoodActive]
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 13),
                                            ))),
                                      ),
                                      horizantelSpacing,
                                    }
                                  ],
                                ),
                              ),
                            ],
                          ),
                          verticalSpacing,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Bed Count',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              verticalSpacing,
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (var i in bedCountitems) ...{
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isBedCountActive =
                                                bedCountitems.indexOf(i);
                                          });
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                                color: i ==
                                                        bedCountitems[
                                                            isBedCountActive]
                                                    ? primaryColor
                                                    : Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Center(
                                                child: Text(
                                              i,
                                              style: TextStyle(
                                                  color: i ==
                                                          bedCountitems[
                                                              isBedCountActive]
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 13),
                                            ))),
                                      ),
                                      horizantelSpacing,
                                    }
                                  ],
                                ),
                              ),
                            ],
                          ),
                          verticalSpacing,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Charges For Cancellation ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              verticalSpacing,
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (var i in cancellationitems) ...{
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isCancellationActive =
                                                cancellationitems.indexOf(i);
                                          });
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                                color: i ==
                                                        cancellationitems[
                                                            isCancellationActive]
                                                    ? primaryColor
                                                    : Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Center(
                                                child: Text(
                                              i,
                                              style: TextStyle(
                                                  color: i ==
                                                          cancellationitems[
                                                              isCancellationActive]
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 13),
                                            ))),
                                      ),
                                      horizantelSpacing,
                                    },
                                  ],
                                ),
                              ),
                            ],
                          ),
                          verticalSpacing,
                          // defaultForm(
                          //     controller: rentController,
                          //     validate: true,
                          //     type: TextInputType.number,
                          //     prefixIcon: Icons.attach_money_rounded,
                          //     label: 'Rent'),
                          verticalSpacing,
                          defaultForm(
                              validate: true,
                              controller: phoneNumberController,
                              type: TextInputType.number,
                              prefixIcon: Icons.phone,
                              label: 'Phone Number'),
                          verticalSpacing,
                          defaultForm(
                              controller: messageController,
                              type: TextInputType.name,
                              prefixIcon: Icons.messenger_outline_sharp,
                              label: 'Message'),
                          verticalSpacing,
                          verticalSpacing,
                          ConditionalBuilder(
                            builder: (context) => defaultButton(
                                width: double.infinity,
                                function: () {
                                  if (key.currentState!.validate()) {
                                    Map creds = {
                                      'roomType': index,
                                      'Food': fooditems[isFoodActive],
                                      'BedCount':
                                          bedCountitems[isBedCountActive],
                                      'cancellation': cancellationNUMitems[
                                          cancellationitems.indexOf(
                                              cancellationitems[
                                                  isCancellationActive])],
                                      // 'Rent': rentController.text,
                                      'PhoneNumber': phoneNumberController.text,
                                      'image': 'testapp.jpg',
                                      'message': messageController.text
                                    };
                                    ADDRoomsCubit.get(context).StoreRoom(
                                        context: context, creds: creds);
                                  }
                                },
                                label: 'Add Room Now'),
                            condition: state is! ADDRoomsLoadingState,
                            fallback: (BuildContext context) {
                              return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          186, 0, 150, 135),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: CircularProgressIndicator(
                                          color: Colors.white),
                                    ),
                                  ));
                            },
                          ),
                          verticalSpacing,
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
