import 'dart:convert';
import 'dart:core';

class PhotoResponse{

  int ? albumId;

  PhotoResponse(this.albumId, this.id, this.url, this.thumbnailUrl,this.title);

  int ? id;
  String ? url;
  String ? thumbnailUrl;
  String ? title;

  PhotoResponse.fromJson(Map<String ,dynamic> json){
    id=json["id"];
    albumId=json["albumId"];
    url=json["url"];
    thumbnailUrl= json["thumbnailUrl"];
    title= json["title"];
  }

  PhotoResponse.toJson(Map<String, dynamic> tojson){

    Map<String,dynamic>  data=Map<String,dynamic>();
    data["id"]=["id"];
    data["albumId"]=["albumId"];
    data["url"]=["url"];
    data["title"]=["title"];
    data["thumbnailUrl"]=["thumbnailUrl"];

  }
}