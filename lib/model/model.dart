class EmployeeData {
  String? id;
  String? name;
  String? position;

  EmployeeData({this.id, required this.name, required this.position});
  Map<String, dynamic> toFireStore() {
    return {"name": name, "position": position};
  }

  factory EmployeeData.fromFireStore(
    Map<String, dynamic> fromFireBase,
    String id,
  ) {
    return EmployeeData(
      id: id,
      name: fromFireBase['name'],
      position: fromFireBase['position'],
    );
  }
}
