import 'package:firebasecrud/view_model/provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Addscreen extends StatefulWidget {
  const Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter',
                        style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                      Gap(10),
                      Text(
                        'employee',
                        style: TextStyle(fontSize: 20, color: Colors.amber),
                      ),
                      Gap(10),
                      Text(
                        'detials',
                        style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                      ),
                    ],
                  ),
                  Gap(25),
                  SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: Card(
                      color: Colors.amberAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Consumer<EmployeeProvider>(
                          builder: (context, value, child) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name;',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(20),
                                TextFormField(
                                  controller: value.name,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Flease fill all fealds';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Enter the name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                Gap(20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Position;',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(20),
                                TextFormField(
                                  controller: value.position,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please fill all fealds';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter the position',
                                    hintStyle: TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Gap(25),
                  Container(
                    height: 45,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Provider.of<EmployeeProvider>(
                            context,
                            listen: false,
                          ).addData();
                          Navigator.pop(context);
                        },
                        child: Text('SUBMIT'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
