import 'package:firebasecrud/view/add_page/addscreen.dart';
import 'package:firebasecrud/view_model/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<EmployeeProvider>(context, listen: false).employeeProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Addscreen();
              },
            ),
          );
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add_comment, color: Colors.amber, size: 28),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Employee', style: TextStyle(color: Colors.amber)),
            Text(' Details.', style: TextStyle(color: Colors.blueGrey)),
          ],
        ),
      ),
      body: Consumer<EmployeeProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.proDatalist.length,
            itemBuilder: (context, index) {
              final data = value.proDatalist[index];
              return ListTile(
                title: Text(data.name.toString()),
                subtitle: Text(data.position.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(
                      onPressed: () {
                        Provider.of<EmployeeProvider>(
                          context,
                          listen: false,
                        ).deleteData(data.id.toString());
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
