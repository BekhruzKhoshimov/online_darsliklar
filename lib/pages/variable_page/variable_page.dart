import 'package:flutter/material.dart';
import 'package:online_darsliklar/pages/pdf_view.dart';
import '../../modellar/barchasi_uchun/itemofcontainer.dart';
import '../../models/post_model.dart';
import '../../servis_pages/file_service.dart';
import '../upload_page/upload_sinf_uchun.dart';

class VariablePages extends StatefulWidget {
  final PageController? pageController;

  final String? f;
  final String? appbar;

  ///Appbar uchun o'zgaruvchi

  const VariablePages({Key? key, this.pageController, this.f, this.appbar})
      : super(key: key);

  @override
  State<VariablePages> createState() => _VariablePagesState();
}

class _VariablePagesState extends State<VariablePages> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              widget.f!,
              style: const TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
              ),
            ),
          ),
          body: Stack(
            children: [
              StreamBuilder<List<Book>>(
                  stream: readBooks(widget.f),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                          "Internetga ulanishni tekshiring!${snapshot.error}");
                    } else if (snapshot.hasData) {
                      final books = snapshot.data!;
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,childAspectRatio: 2 / 1.8
                        ),
                        itemCount: books.length,
                        itemBuilder: (context, index) {
                          return itemOfContainer2(
                              "${books[index].img_url}",
                              "${books[index].book_name}",
                              PdfView(
                                  url_pdf: "${books[index].pdf_url}",
                                  pdf_name: "${widget.f} ${books[index].book_name}"),
                              deleteBook(name: '${books[index].book_name}',sinf: "${widget.f}"));
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UploadSinf(
                            sinf: widget.f,
                          )));
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
