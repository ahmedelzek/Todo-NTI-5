class TaskModel{
  int? id ;
  String? createdAt;
  String? title;
  String? description;
  String? imagePath;
  TaskModel({this.id, this.createdAt, this.title, this.description, this.imagePath});

  TaskModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    createdAt = json['created_at'];
    title = json['title'];
    description = json['description'];
    imagePath = json['image_path'];
  }


  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'created_at': createdAt,
      'title': title,
      'description': description,
      'image_path': imagePath
    };
  }
}