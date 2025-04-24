import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<Result>? results;

  const BookModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
      };

  BookModel copyWith({
    int? count,
    String? next,
    dynamic previous,
    List<Result>? results,
  }) {
    return BookModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}

class Result extends Equatable {
  final int? id;
  final String? title;
  final List<Author>? authors;
  final List<String>? subjects;
  final Formats? formats;

  const Result({
    this.id,
    this.title,
    this.authors,
    this.subjects,
    this.formats,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        authors: json["authors"] == null ? [] : List<Author>.from(json["authors"]!.map((x) => Author.fromJson(x))),
        subjects: json["subjects"] == null ? [] : List<String>.from(json["subjects"]!.map((x) => x)),
        formats: json["formats"] == null ? null : Formats.fromJson(json["formats"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "authors": authors == null ? [] : List<dynamic>.from(authors!.map((x) => x.toJson())),
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x)),
        "formats": formats?.toJson(),
      };

  @override
  List<Object?> get props => [id, title, authors, subjects, formats];
}

class Author extends Equatable {
  final String? name;

  const Author({this.name});

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };

  @override
  List<Object?> get props => [name];
}

class Formats extends Equatable {
  final String? imageJpeg;

  const Formats({this.imageJpeg});

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        imageJpeg: json["image/jpeg"],
      );

  Map<String, dynamic> toJson() => {
        "image/jpeg": imageJpeg,
      };

  @override
  List<Object?> get props => [imageJpeg];
}
