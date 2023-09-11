import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/api/const.dart';
import 'package:hotel/components/components.dart';
import 'package:hotel/cubit/cubit.dart';
import 'package:hotel/cubit/states.dart';

class AddBooking extends StatefulWidget {
  const AddBooking({super.key, required this.title});
  final String title;
  @override
  State<AddBooking> createState() => _AddBookingState();
}

class _AddBookingState extends State<AddBooking> {
  String ArrivalDate = '';
  String DepatureDate = '';
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController presonalNameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ADDBookingsCubit(),
      child: BlocConsumer<ADDBookingsCubit, BookingsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Add ${widget.title}'),
              ),
              body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                      child: Form(
                    key: formKey,
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
                                  for (var i in roomTypeitems) ...{
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isRoomActive =
                                              roomTypeitems.indexOf(i);
                                        });
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                              color: i ==
                                                      roomTypeitems[
                                                          isRoomActive]
                                                  ? primaryColor
                                                  : Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                              child: Text(
                                            i,
                                            style: TextStyle(
                                                color: i ==
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
                            const Text('Total Members',
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
                        defaultButton(
                            width: double.infinity,
                            function: () async {
                              final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: initselectedDate,
                                  firstDate: DateTime(2023),
                                  lastDate: DateTime(2101));

                              if (picked != null &&
                                  picked != initselectedDate) {
                                setState(() {
                                  initselectedDate = picked;
                                  ArrivalDate = initselectedDate
                                      .toString()
                                      .substring(0, 10);
                                });
                              }
                            },
                            label: 'Arrival Date  ${ArrivalDate}'),
                        verticalSpacing,
                        defaultButton(
                            width: double.infinity,
                            function: () async {
                              final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: initselectedDate,
                                  firstDate: DateTime(2023),
                                  lastDate: DateTime(2101));

                              if (picked != null &&
                                  picked != initselectedDate) {
                                setState(() {
                                  initselectedDate = picked;
                                  DepatureDate = initselectedDate
                                      .toString()
                                      .substring(0, 10);
                                });
                              }
                            },
                            label: 'Depature Date  ${DepatureDate}'),
                        verticalSpacing,
                        defaultForm(
                            validate: true,
                            controller: presonalNameController,
                            type: TextInputType.name,
                            prefixIcon: Icons.person,
                            label: 'Personal Name'),
                        verticalSpacing,
                        defaultForm(
                            validate: true,
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            prefixIcon: Icons.email_outlined,
                            label: 'Email'),
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
                            type: TextInputType.multiline,
                            prefixIcon: Icons.message_rounded,
                            label: 'Message'),
                        verticalSpacing,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Payment',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            verticalSpacing,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (var i in payChoices) ...{
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          ispayChoicesActive =
                                              payChoices.indexOf(i);
                                        });
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                              color: i ==
                                                      payChoices[
                                                          ispayChoicesActive]
                                                  ? primaryColor
                                                  : Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                              child: Text(
                                            i,
                                            style: TextStyle(
                                                color: i ==
                                                        payChoices[
                                                            ispayChoicesActive]
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
                        verticalSpacing,
                        ConditionalBuilder(
                          builder: (context) => defaultButton(
                              width: double.infinity,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  Map creds = {
                                    'roomNumber': roomTypeitems[isRoomActive],
                                    'totalMembers':
                                        bedCountitems[isBedCountActive],
                                    'arrivalDate': ArrivalDate,
                                    'depatureDate': DepatureDate,
                                    'personalName': presonalNameController.text,
                                    'email': emailController.text,
                                    'phoneNumber': phoneNumberController.text,
                                    'message': messageController.text,
                                    'image': 'testApp.png',
                                    'paied': payChoicesNUM[ispayChoicesActive]
                                  };
                                  ADDBookingsCubit.get(context).StoreBooking(
                                      context: context, creds: creds);
                                }
                              },
                              label: 'Reserve Now'),
                          condition: state is! ADDBookingsLoadingState,
                          fallback: (BuildContext context) {
                            return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(186, 0, 150, 135),
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
                  ))),
            );
          }),
    );
  }
}
