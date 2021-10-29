// id": 3,
//     "first_name": "Shae",
//     "last_name": "Muldoon",
//     "username": "smuldoon2",
//     "last_seen_time": "2:17 PM",
//     "avatar": "https://robohash.org/laudantiumsitvoluptatem.png?size=50x50&set=set1",
//     "status": "Re-engineered",
//     "messages": 2

class DetailsDataModel {
  //data Type
  int? id;
  // ignore: non_constant_identifier_names
  String? first_name;
  // ignore: non_constant_identifier_names
  String? last_name;
  String? username;
  // ignore: non_constant_identifier_names
  DateTime? last_seen_time;
  String? avatar;
  String? status;
  int? messages;

// constructor
  DetailsDataModel(
      {this.id,
      // ignore: non_constant_identifier_names
      this.first_name,
      // ignore: non_constant_identifier_names
      this.last_name,
      this.username,
      // ignore: non_constant_identifier_names
      this.last_seen_time,
      this.avatar,
      this.status,
      this.messages});

  //method that assign values to respective datatype vairables
  DetailsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    username = json['username'];
    last_seen_time = json['last_seen_time'];
    avatar = json['avatar'];
    status = json['status'];
    messages = json['messages'];
  }
}
