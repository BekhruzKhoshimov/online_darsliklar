// ignore_for_file: non_constant_identifier_names

class Book {

  String? img_url;
  String? pdf_url;
  String? book_name;

  bool isLiked = false;

  Book({this.img_url,this.pdf_url,this.book_name});

  static Book fromJson(Map<String,dynamic> json) => Book(
    img_url: json["img_url"],
    pdf_url: json["pdf_url"],
    book_name: json["book_name"],
  );

  Map<String, dynamic> toJson() => {
    "img_url": img_url,
    "pdf_url": pdf_url,
    "book_name": book_name,
  };
  
}