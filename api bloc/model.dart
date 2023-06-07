class NewsModel {
  int? id;
  String? title;
  String? content;
  String? starts_at;
  String? ends_at;
  String? image;
  String? sent_by;

  NewsModel({this.id, this.title, 
  this.content, this.starts_at,this.ends_at,
   this.image,this.sent_by});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'] as String;
    content = json['content'] as String;
    starts_at = json['starts_at'] as String;
    ends_at = json['ends_at'] as String;
    image = json['image'] as String;
    sent_by = json['sent_by'] as String;
  }
}
