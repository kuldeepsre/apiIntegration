class QuotesResponse{
  int ? id;
  String ? quote;
  String ? author;
  QuotesResponse(this.id, this.quote, this.author);
  QuotesResponse.fromJson(Map<String,dynamic> json){
    id=json['id'];
    quote=json['quote'];
    author=json['author'];
  }
  QuotesResponse.toJson(Map<String,dynamic> toJson){
    Map<String,dynamic> data=Map<String,dynamic>();
    data['id']=this.id;
    data['quote']=this.quote;
    data['author']=this.author;
  }
}