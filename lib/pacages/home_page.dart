import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:local_data_task2/pacages/sign_up.dart';

import '../model/home_models.dart';
import '../model/sign_in_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _doSign() async {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var home = Home(password: password, email: email);
    var box = await Hive.openBox('testBox');
    box.put("home", home.toJson());

    var newSignIn = Home.fromJson(box.get("home"));
    print(newSignIn.password);
    print(newSignIn.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/img_1.png",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Welcome",
                    style: TextStyle(color: Colors.tealAccent, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 37,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        MediaQuery.of(context).size.width * 0.10),
                    topRight: Radius.circular(
                        MediaQuery.of(context).size.width * 0.10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 80, left: 50, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        style: const TextStyle(color: Colors.grey),
                        decoration: const InputDecoration(
                          hintText: "Urmail@gmail.com",
                          hintStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        style: const TextStyle(color: Colors.grey),
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          hintStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: TextButton(
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal[800],
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          onPressed: _doSign,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.70,
                            height: 60,
                            child: const Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "OR",
                            style: TextStyle(color: Colors.grey, fontSize: 17),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 65),
                        child: Row(
                          children: const [
                            Expanded(
                              child: FaIcon(FontAwesomeIcons.facebook),
                            ),
                            Expanded(
                              child: FaIcon(FontAwesomeIcons.twitter),
                            ),
                            Expanded(
                              child: FaIcon(FontAwesomeIcons.instagram),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an accaunt ?  ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp(),
                                ),
                              );
                            },
                            child: const Text(
                              "SIGN UP",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
