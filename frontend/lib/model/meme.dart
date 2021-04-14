class MemeModel {
  // Response and Payload Body Schema For a Meme
  final String username;
  final String caption;
  final String link;

  MemeModel(this.username, this.caption, this.link);

  MemeModel.fromJson(Map<String, dynamic> json)
    : username = json['name'],
      caption = json['caption'],
      link = json['url'];

  Map<String, dynamic> toJson() => {
    "name" : this.username,
    "caption": this.caption,
    "url": this.link
  };
}