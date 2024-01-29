import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/pages/homepage/home_page.dart';
import 'package:mini_project/utilities.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<StatefulWidget> createState() => _VerificationPage();
}

class _VerificationPage extends State<VerificationPage> {
  TextEditingController email = TextEditingController();
  bool canResend = true;
  final user = FirebaseAuth.instance.currentUser!;
  bool isVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    ///user needs to be created before
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isVerified) {
      sendVerificationEmail();

      //checking continouesly
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isVerified) {
      timer?.cancel();
    }
  }

  Future<void> sendVerificationEmail() async {
    final user = FirebaseAuth.instance.currentUser!;
    try {
      await user.sendEmailVerification();

      setState(() => canResend = false);
      await Future.delayed(const Duration(seconds: 6));
      setState(() => canResend = true);
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isVerified
        ? const HomePage()
        : Material(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Theme.of(context).primaryColor,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Text(
                              "Verify Email",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Please verify your email to continue",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.35,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "We have sent a varification link on ${user.email}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: canResend
                                ? () => sendVerificationEmail()
                                : () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: canResend
                                  ? Theme.of(context).primaryColor
                                  : Colors.green.shade100,
                              elevation: 2,
                              minimumSize: const Size(280, 46),
                            ),
                            child: const Text(
                              "Resend Email",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          OutlinedButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              backgroundColor: Theme.of(context).cardColor,
                              maximumSize: const Size(280, 60),
                            ),
                            child: const Text(
                              "Cancle",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Resend after 5 seconds"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
