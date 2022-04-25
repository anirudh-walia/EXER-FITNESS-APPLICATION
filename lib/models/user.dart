class User{
  final String uid;

  User({this.uid});
}

class UserData{
  final String uid;
  final String name;
  final String gender;
  final int age;
  final int weight;
  final int height_feet;
  final int height_inches;
  UserData({this.uid, this.name, this.gender, this.age, this.weight, this.height_feet, this.height_inches});
}