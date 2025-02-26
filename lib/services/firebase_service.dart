import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/model/model.dart';

class EmployeeServices {
  final CollectionReference employeeColluction = FirebaseFirestore.instance
      .collection('employee data');

  Future addDatatoFireStore(EmployeeData data) async {
    try {
      log('adding a data ${data.name}');
      await employeeColluction.add(data.toFireStore());
    } catch (e) {
      log('ERORR ON ADDING DATA TO THE COLLUCTION $e');
    }
  }

  Future updatData(String id, EmployeeData data) async {
    try {
      await employeeColluction.doc(id).update(data.toFireStore());
      log('Updated data with id: $id');
    } catch (e) {
      log('ERORR ON UPDATING DATA == $e ');
    }
  }

  Future deletData(String id) async {
    try {
      await employeeColluction.doc(id).delete();
      log('deleted data with id  :  $id');
    } catch (e) {
      log('ERORR ON DELETING DATA $id');
    }
  }

  Future<List<EmployeeData>> getAllEmployeeDataInStream() async {
    QuerySnapshot querySnapshot = await employeeColluction.get();
    return querySnapshot.docs
        .map(
          (doc) => EmployeeData.fromFireStore(
            doc.data() as Map<String, dynamic>,
            doc.id,
          ),
        )
        .toList();
  }
}
