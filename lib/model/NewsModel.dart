class NewsModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  List<String>? country;
  String? imageUrl;
  String? videoUrl;
  String? category;
  String? language;

  NewsModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.imageUrl,
    this.videoUrl,
    this.content,
    this.publishedAt
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        content: json['content'],
        publishedAt: json['publishedAt'],
        imageUrl: json['image_url'],
        videoUrl: json['video_url']
    );
  }

  Map<String, dynamic> toJson () {
    return {
      'author' : author,
      'title' : title,
      'description' : description,
      'url' : url,
      'urlToImage' : urlToImage,
      'content' : content,
      'publishedAt' : publishedAt,
      'image_Url' : imageUrl,
      'video_Url' : videoUrl
    };
  }
}

//2bd9bcec4fa44f01ae4ee7394d0cdae7
//5b400d36femsh25afa73c7388c8ep158cedjsnb2591273489a

//Newsdata api pub_53707d4c7355eb34ee99baef756a8488fbe78