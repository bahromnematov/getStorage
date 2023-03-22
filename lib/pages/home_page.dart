import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localdatabase_hive/servise/get_storage_service.dart';

import '../model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void doLogin() {
    String userName = userNameController.text.toString().trim();
    String passwords = passwordController.text.toString().trim();
    User user = User(userName, passwords);
    GetStorageService.storeUser(user);

    GetStorageService.loadUser()
        .then((value) => {print(value?.toJson().toString())});
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   var user = User("szdksghadga1231@gmail.com", "23142412");
  //   // HiveServise.stareUser(user);
  //   // var user2= HiveServise.loadUser();
  //   // print(user2.toJson().toString());
  //
  //   GetStorageService.storeUser(user);
  //   var user2 = GetStorageService.loadUser();
  //   print(user2.toJson().toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            // #login ,#Welcome to
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sign in to continue",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      //#email ,#password,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[200]!)),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: "User Name",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[200]!)),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Forget Password",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        //Sign up

                        InkWell(
                          onTap: () {
                            doLogin();
                          },
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  // color: Colors.blue[900],
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      colors: [
                                        Colors.blue[600]!,
                                        Colors.blue[500]!,
                                        Colors.blue[400]!,
                                        Colors.blue[200]!,
                                      ])),
                              child: Center(
                                  child:
                                      Image.asset("assets/icons/arrov.png"))),
                        ),

                        SizedBox(
                          height: 110,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            InkWell(
                                onTap: () {},
                                child: const Text("SIGN UP",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
