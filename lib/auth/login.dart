import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/api/const.dart';
import 'package:hotel/components/components.dart';
import 'package:hotel/cubit/cubit.dart';
import 'package:hotel/cubit/states.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.text = "superAdmin@test.com";
    passwordController.text = "123456789";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppLoginCubit(),
        child: BlocConsumer<AppLoginCubit, AppLoginStates>(
          listener: (BuildContext context, AppLoginStates state) {},
          builder: (BuildContext context, AppLoginStates state) {
            return Scaffold(
                body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('LOGIN',
                              style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(185, 3, 85, 77),
                                fontWeight: FontWeight.w900,
                              )),
                          const SizedBox(
                            height: 80,
                          ),

                          // Email Input

                          defaultForm(
                            validate: true,
                            validationMessage: 'The Eamil is required',
                            controller: emailController,
                            label: 'Email',
                            prefixIcon: Icons.email_outlined,
                            type: TextInputType.emailAddress,
                          ),

                          verticalSpacing,

                          // password Input
                          defaultForm(
                              controller: passwordController,
                              isPassword: true,
                              validationMessage: 'The password is required',
                              validate: true,
                              type: TextInputType.visiblePassword,
                              prefixIcon: Icons.lock_open_rounded,
                              sufixIcon: Icons.remove_red_eye_outlined,
                              label: 'Password'),
                          const SizedBox(
                            height: 50,
                          ),

                          //LOGIN Button

                          ConditionalBuilder(
                              condition: state is! AppLoginLoadingState,
                              builder: (context) => defaultButton(
                                  label: 'Login',
                                  width: double.infinity,
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      Map creds = {
                                        'email': emailController.text,
                                        'password': passwordController.text,
                                      };
                                      AppLoginCubit.get(context).userLogin(
                                        context: context,
                                        creds: creds,
                                      );
                                    }
                                  }),
                              fallback: (context) {
                                return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            186, 0, 150, 135),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: const Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: CircularProgressIndicator(
                                            color: Colors.white),
                                      ),
                                    ));
                              }),
                          verticalSpacing,

                          //SIGN UP Button

                          defaultButton(
                              label: 'Sign UP',
                              width: double.infinity,
                              function: () {}),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
          },
        ));
  }
}
