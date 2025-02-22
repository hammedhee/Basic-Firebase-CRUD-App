class EmployeeData {
  String? name;
  String? position;

  EmployeeData({required this.name, required this.position});
  Map<String, dynamic> toFireStore() {
    return {"name": name, "position": position};
  }

  factory EmployeeData.fromFireStore(Map<String, dynamic> fromFireBase) {
    return EmployeeData(
      name: fromFireBase['name'],
      position: fromFireBase['position'],
    );
  }
}
