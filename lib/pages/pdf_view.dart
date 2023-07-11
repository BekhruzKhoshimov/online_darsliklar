// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatefulWidget {
  final String? pdf_name;
  final String? url_pdf;
  const PdfView({Key? key, this.url_pdf, this.pdf_name}) : super(key: key);

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  PdfViewerController pdfViewerController = PdfViewerController();
  double zoom = 0.0;
  TextEditingController controller = TextEditingController();
  int pageNo = 0;
  jumpTo(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (val) {
                pageNo = int.parse(val);
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    pdfViewerController.jumpToPage(pageNo);
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.pdf_name}"),
        actions: [
          IconButton(
            onPressed: () {
              FileDownloader.downloadFile(
                url: '${widget.url_pdf}',
                name: "${widget.pdf_name}.pdf"
              );
              print('${widget.url_pdf}');
            },
            icon: const Icon(CupertinoIcons.tray_arrow_down),
          )
        ],
      ),
      body: SfPdfViewer.network('${widget.url_pdf}', password: 'syncfusion'),
    );
  }
}
//
// class SingleDownloadScreen extends StatefulWidget {
//   const SingleDownloadScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<SingleDownloadScreen> createState() => _SingleDownloadScreenState();
// }
//
// class _SingleDownloadScreenState extends State<SingleDownloadScreen> {
//   TextEditingController url = TextEditingController();
//   double? _progress;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Download Any File From URL\nin Flutter',
//               style: TextStyle(
//                 fontSize: 20,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               controller: url,
//               decoration: const InputDecoration(label: Text('Url*')),
//             ),
//             const SizedBox(height: 16),
//             _progress != null
//                 ? const CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: () {
//                       FileDownloader.downloadFile(
//                           url: url.text.trim(),
//                           onProgress: (name, progress) {
//                             setState(() {
//                               _progress = progress;
//                             });
//                           },
//                           onDownloadCompleted: (value) {
//                             print('path  $value ');
//                             setState(() {
//                               _progress = null;
//                             });
//                           });
//                     },
//                     child: const Text('Download')),
//           ],
//         ),
//       ),
//     );
//   }
// }
