// ignore_for_file: non_constant_identifier_names

class Member {
  String img_url = "";
  String pdf_url = "";
  String book_name = "";

  bool like = false;

  Member();

  Member.fromJson(Map<String, dynamic> json)
      : img_url = json['img_url'],
        pdf_url = json['pdf_url'],
        book_name = json['book_name'];

  Map<String, dynamic> toJson() => {
    'img_url' : img_url,
    'pdf_url' : pdf_url,
    'book_name' : book_name,
  };
}