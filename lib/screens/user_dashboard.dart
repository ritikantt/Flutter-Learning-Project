import 'package:flutter/material.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() {
    return _UserDashboardScreen();
  }
}

class _UserDashboardScreen extends State<UserDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      const Text('Welcome to your Expenses tracker!'),
      const SizedBox(height: 20),
      Row(children: [
        const SizedBox(width: 35),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 70,
              color: const Color.fromARGB(255, 158, 230, 160),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Column(
                    children: [
                      Text('Total Income'),
                      SizedBox(height: 12),
                      Text('₹'),
                    ],
                  ),
                )),
          ],
        ),
        const SizedBox(width: 15),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 70,
              color: const Color.fromARGB(255, 248, 123, 123),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Column(
                    children: [
                      Text('Total Expenses'),
                      SizedBox(height: 12),
                      Text('₹'),
                    ],
                  ),
                )),
          ],
        ),
      ]),
      const SizedBox(height: 20),
      Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 150,
            height: 70,
            color: const Color.fromARGB(255, 160, 235, 240),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Column(
                  children: [
                    Text('Total Savings'),
                    SizedBox(height: 12),
                    Text('₹'),
                  ],
                ),
              )),
        ],
      ),
      const SizedBox(height: 20),
      const Text('The Chart'),
    ]);
  }
}
