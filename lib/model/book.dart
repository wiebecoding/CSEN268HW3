// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Book {
  final String coverURL;
  final String bookTitle;
  final String bookAuthor;
  final String bookDescription;

  Book({
    required this.coverURL,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookDescription,
  });

  Book copyWith({
    String? coverURL,
    String? bookTitle,
    String? bookAuthor,
    String? bookDescription,
  }) {
    return Book(
      coverURL: coverURL ?? this.coverURL,
      bookTitle: bookTitle ?? this.bookTitle,
      bookAuthor: bookAuthor ?? this.bookAuthor,
      bookDescription: bookDescription ?? this.bookDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coverURL': coverURL,
      'bookTitle': bookTitle,
      'bookAuthor': bookAuthor,
      'bookDescription': bookDescription,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      coverURL: map['coverURL'] as String,
      bookTitle: map['bookTitle'] as String,
      bookAuthor: map['bookAuthor'] as String,
      bookDescription: map['bookDescription'] as String,
    );
  }
 
  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(coverURL: $coverURL, bookTitle: $bookTitle, bookAuthor: $bookAuthor, bookDescription: $bookDescription)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;
  
    return 
      other.coverURL == coverURL &&
      other.bookTitle == bookTitle &&
      other.bookAuthor == bookAuthor &&
      other.bookDescription == bookDescription;
  }

  @override
  int get hashCode {
    return coverURL.hashCode ^
      bookTitle.hashCode ^
      bookAuthor.hashCode ^
      bookDescription.hashCode;
  }
}
