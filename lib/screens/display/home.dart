import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/components/components.dart';
import 'package:hotel/cubit/cubit.dart';
import 'package:hotel/api/const.dart';

import 'package:hotel/cubit/states.dart';
import 'package:hotel/screens/add/addBooking.dart';
import 'package:hotel/screens/add/addRoom.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentindex]),
            ),
            body: cubit.screens[cubit.currentindex],
            floatingActionButton: FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: () {
                cubit.currentindex == 0
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddBooking(
                                title: cubit.titles[cubit.currentindex])))
                    : cubit.currentindex == 1
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddData(
                                    title: cubit.titles[cubit.currentindex])))
                        : Messanger(
                            context: context,
                            message: cubit.titles[cubit.currentindex]);
              },
              child: const Icon(
                Icons.add_outlined,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: primaryColor,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.archive_outlined,
                      ),
                      label: 'Bookings'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.room_outlined), label: 'Rooms'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.group_outlined), label: 'Employees'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_3_outlined),
                    label: 'Profile',
                  ),
                ],
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.currentindex,
                onTap: (index) {
                  cubit.changeIndex(index);
                }),
          );
        },
      ),
    );
  }
}
