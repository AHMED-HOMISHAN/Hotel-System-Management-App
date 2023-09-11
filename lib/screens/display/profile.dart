import 'package:flutter/material.dart';
import 'package:hotel/auth/auth.dart';
import 'package:hotel/components/components.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
                child: SizedBox(
              width: double.infinity,
              height: 90,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 228, 228, 228),
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 50,
                ),
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 228, 228),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        'Name :  \t ${info[0]}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 228, 228),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        'Email Address :  \t  ${info[1]}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 228, 228),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        'User Role : \t ${info[2]}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            defaultButton(
                width: 100,
                function: () {
                  Auth().logout(context);
                },
                label: 'Log out',
                buttonColor: Colors.redAccent)
          ],
        ),
      ),
    );
  }
}
