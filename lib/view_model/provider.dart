import 'dart:developer';

import 'package:firebasecrud/model/model.dart';
import 'package:firebasecrud/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EmployeeProvider extends ChangeNotifier {
  final TextEditingController name = TextEditingController();
  final TextEditingController position = TextEditingController();
  EmployeeServices employeeServices = EmployeeServices();
  List<EmployeeData> proDatalist = [];

  employeeProvider() async {
    proDatalist = await employeeServices.getAllEmployeeDataInStream();
    notifyListeners();
  }

  Future addData() async {
    try {
      await employeeServices.addDatatoFireStore(
        EmployeeData(name: name.text, position: position.text),
      );

      name.clear();
      position.clear();

      await employeeProvider();
      notifyListeners();
    } catch (e) {
      log("Error in provider add function: $e");
    }
  }

  Future deleteData(String id) async {
    try {
      await employeeServices.deletData(id);
      notifyListeners();
    } catch (e) {
      log('Erorr on provider delete function := $e');
    }
  }

  Future editData(String id, EmployeeData datas) async {
    try {
      await employeeServices.updatData(id, datas);
      log('the data deleted  == $datas');
    } catch (e) {
      log("Erorr on provider  updating function :=$e ");
    }
  }
}
