import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: 1050,
        padding: const EdgeInsets.all(10),
        //color: const Color.fromARGB(189, 196, 236, 198),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 90,
            ),
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                " Blogs",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const SizedBox(
                height: 200,
                width: double.infinity,
                child: Card(
                  color: Color.fromARGB(189, 196, 236, 198),
                  child: Center(
                    child: Expanded(
                      child: Image(
                        image: AssetImage("lib/assets/images/sucessStory.jpeg"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "Our Service",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Wrap(
              children: [
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 160,
                    width: 160,
                    child: Card(
                      color: Colors.purple,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.capsules,
                            size: 60,
                            color: Colors.white,
                          ),
                          Text(
                            "View",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            "Prescription",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 160,
                    width: 160,
                    child: Card(
                      color: Colors.blue,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.file,
                              size: 60,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "My Records",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 160,
                    width: 160,
                    child: Card(
                      color: Colors.green,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.calendarCheck,
                              size: 60,
                              color: Colors.white,
                            ),
                            Text(
                              "Book",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              "Appointment",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 160,
                    width: 160,
                    child: Card(
                      color: Colors.pink,
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.database,
                              size: 60,
                              color: Colors.white,
                            ),
                            Text(
                              "Upload",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              "Document",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "Invite your friend",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const SizedBox(
                height: 110,
                width: double.infinity,
                child: Card(
                  child: Center(
                    child: Expanded(
                      child: Image(
                        image: AssetImage("lib/assets/images/invite.jpeg"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "Helpline",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const SizedBox(
                height: 100,
                width: double.infinity,
                child: Card(
                  color: Color.fromARGB(188, 28, 212, 37),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.call),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Tollfree no:14446",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.call),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Tollfree no:011 2553 2553",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
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
