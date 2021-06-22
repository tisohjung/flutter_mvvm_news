import 'dart:convert';

class NewsArticle {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String url;
  final String publishedAt;
  final String content;

  NewsArticle(
    this.title,
    this.author,
    this.description,
    this.urlToImage,
    this.url,
    this.publishedAt,
    this.content,
  );

  NewsArticle copyWith({
    String? title,
    String? author,
    String? description,
    String? urlToImage,
    String? url,
    String? publishedAt,
    String? content,
  }) {
    return NewsArticle(
      title ?? this.title,
      author ?? this.author,
      description ?? this.description,
      urlToImage ?? this.urlToImage,
      url ?? this.url,
      publishedAt ?? this.publishedAt,
      content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'urlToImage': urlToImage,
      'url': url,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory NewsArticle.fromMap(Map<String, dynamic> map) {
    return NewsArticle(
      map['title'],
      map['author'],
      map['description'],
      map['urlToImage'],
      map['url'],
      map['publishedAt'],
      map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsArticle.fromJson(String source) =>
      NewsArticle.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewsArticle(title: $title, author: $author, description: $description, urlToImage: $urlToImage, url: $url, publishedAt: $publishedAt, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsArticle &&
        other.title == title &&
        other.author == author &&
        other.description == description &&
        other.urlToImage == urlToImage &&
        other.url == url &&
        other.publishedAt == publishedAt &&
        other.content == content;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        author.hashCode ^
        description.hashCode ^
        urlToImage.hashCode ^
        url.hashCode ^
        publishedAt.hashCode ^
        content.hashCode;
  }
}
