class AlbumResponse{
  int ? userId;

  int ? id;
  String ? title;
  AlbumResponse(this.userId, this.id, this.title);
  AlbumResponse.fromJson(Map<String ,dynamic> json){
    id=json["id"];
    userId=json["userId"];
    title=json["title"];

  }
  AlbumResponse.toJson(Map<String, dynamic> toJson){
    Map<String,dynamic> data=Map<String,dynamic>();
    data["userId"]=this.userId;
    data["id"]=this.id;
    data["title"]=this.title;

  }
}