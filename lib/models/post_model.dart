class PostModel{
  String uId;
  String postImage;
  String dateTime;
  String title;
  String description;

  PostModel({
    this.uId,
    this.postImage,
    this.dateTime,
    this.title,
    this.description,

});
  PostModel.fromJson(Map<String, dynamic> json){
    uId = json['uId'];
    postImage = json['postImage'];
    dateTime = json['dateTime'];
    title = json['title'];
    description = json['description'];
  }
  Map<String, dynamic> toMap(){
    return{
      'uId' : uId,
      'postImage' : postImage,
      'dateTime' : dateTime,
      'title' : title,
      'description' : description,
    };
}
}