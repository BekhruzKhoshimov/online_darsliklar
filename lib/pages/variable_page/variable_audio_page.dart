
import 'package:flutter/material.dart';
import '../../modellar/barchasi_uchun/itemofcontainer.dart';
import '../../models/post_model.dart';
import '../../servis_pages/file_service.dart';
import '../feed_page/audio_darsliklar/audio_player.dart';
import '../pdf_view.dart';
import '../upload_page/upload_sinf_uchun.dart';

class VariableAudioPages extends StatefulWidget {
  final PageController? pageController;

  final String? f;

  ///Appbar uchun o'zgaruvchi

  const VariableAudioPages({Key? key, this.pageController,this.f}) : super(key: key);

  @override
  State<VariableAudioPages> createState() => _VariableAudioPagesState();
}

class _VariableAudioPagesState extends State<VariableAudioPages> {
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
                              AudioDrasliklar(audio_img: "${books[index].img_url}",pdf_name: "${books[index].book_name}",url_audio: "${books[index].pdf_url}",sinf: "Audio"),
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
