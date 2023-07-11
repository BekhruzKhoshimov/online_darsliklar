// // ignore_for_file: avoid_print
//
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../servis_pages/file_service.dart';
// import '../../servis_pages/firebase_api.dart';
//
// class Upload extends StatefulWidget {
//
//   final String? sinf;
//   const Upload({Key? key, this.sinf}) : super(key: key);
//
//   @override
//   State<Upload> createState() => _UploadState();
// }
//
// class _UploadState extends State<Upload> {
//
//   TextEditingController nomiController = TextEditingController();
//
//   bool isloading = false;
//   get caption => nomiController.text;
//   UploadTask? img;
//   UploadTask? pdf;
//   File? file;
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   get pdfUrlDownload => nomiController.text;
//   String? imgUrl;
//   String? pdfUrl;
//
//   @override
//   Widget build(BuildContext context) {
//     final fileName = file != null ? (file!.path) : "No File Selected";
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Text("${widget.sinf}larga Kitob yuklash",style: const TextStyle(color: Colors.black),),
//           centerTitle: true,
//           leading: IconButton(
//             onPressed: (){
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//               children: [
//                 const SizedBox(height: 30,),
//                 Row(
//                   children: [
//                     itemOffile(_imgFromGallery, Icons.add_photo_alternate_outlined),
//                     const SizedBox(width: 25,),
//                     itemOfUpload(caption),
//                     const SizedBox(width: 25,),
//                     itemOffile(selectFile, Icons.picture_as_pdf),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: TextField(
//                     controller: nomiController,
//                     decoration: const InputDecoration(
//                       label: Text("Kitob nomi"),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.all(30),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "PDF: $fileName",
//                         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 30,),
//                       CupertinoButton(
//                         onPressed: () async {
//                           final name = nomiController.text;
//                           await uploadPdf(name);
//                           await uploadImage(name);
//                           if(widget.sinf == "Detiktiv hikoya"){
//                             createAudio(name: name,sinf: widget.sinf,imgDownload: imgDownload,pdfDownload: pdfDownload);
//                           } else {
//                             createBook(name: name,sinf: widget.sinf,imgDownload: imgDownload,pdfDownload: pdfDownload);
//                           }
//                         },
//                         child: Container(
//                           height: 70,
//                           width: 300,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: Colors.blueAccent,
//                                   spreadRadius: 1,
//                                   blurRadius: 8,
//                                   offset: Offset(4,4),
//                                 ),
//                                 BoxShadow(
//                                   color: Colors.transparent,
//                                   spreadRadius: 2,
//                                   blurRadius: 8,
//                                   offset: Offset(-4,-4),
//                                 )
//                               ]
//                           ),
//                           child: Center(
//                             child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(20),
//                                 child: const Text("Create Book")
//                             ),
//                           ),
//                         ),
//                       ),
//                       pdf != null ? buildUploadPdf(pdf!) : Container(),
//                       img != null ? buildUploadImg(img!) : Container(),
//                     ],
//                   ),
//                 )
//               ]
//           ),
//         )
//     );
//   }
//
//   Future selectFile() async {
//     final result = await FilePicker.platform.pickFiles(allowMultiple: false);
//
//     if (result == null) return;
//     final path = result.files.single.path!;
//     setState(() => file = File(path));
//   }
//
//   String? pdfDownload;
//   Future uploadPdf(String? name)async {
//     if (file == null) return;
//
//     String destination = 'Pdf/${widget.sinf}/$name';
//
//     setState(() {
//       pdf = FirebaseApi.uploadPdf(destination, file!);
//     });
//     if (pdf == null) return;
//
//     final snapshot = await pdf!.whenComplete(() {});
//     pdfDownload = await snapshot.ref.getDownloadURL();
//
//     print("PDF Download-Link: $pdfDownload");
//     FirebaseApi.uploadPdf(destination, file!);
//   }
//
//   String? imgDownload;
//   Future uploadImage(String name)async {
//     if (_image == null) return;
//
//     String destination = "Images/${widget.sinf}/$name";
//
//     setState(() {
//       img = FirebaseApi.uploadImage(destination, file!);
//     });
//
//     if (img == null) return;
//
//     final snapshot = await img!.whenComplete(() {});
//     imgDownload = await snapshot.ref.getDownloadURL();
//
//     print("IMG Download-Link: $imgDownload");
//     FirebaseApi.uploadImage(destination, _image!,);
//   }
//
//
//   Widget buildUploadPdf(UploadTask pdf) => StreamBuilder<TaskSnapshot>(
//       stream: pdf.snapshotEvents,
//       builder: (context, snapshot){
//         if (snapshot.hasData) {
//           final snap = snapshot.data!;
//           final progress = snap.bytesTransferred / snap.totalBytes;
//           final percentage = (progress * 100).toStringAsFixed(2);
//           return Text(
//             "Upload PDF $percentage %",
//             style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//           );
//         } else {
//           return Container();
//         }
//       }
//   );
//
//   Widget buildUploadImg(UploadTask img) => StreamBuilder<TaskSnapshot>(
//       stream: img.snapshotEvents,
//       builder: (context, snapshot){
//         if (snapshot.hasData) {
//           final snap = snapshot.data!;
//           final progress = snap.bytesTransferred / snap.totalBytes;
//           final percentage = (progress * 100).toStringAsFixed(2);
//           return Text(
//             "Upload IMG $percentage %",
//             style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//           );
//         } else {
//           return Container();
//         }
//       }
//   );
//
//   Widget itemOffile(ontab,icon){
//     return CupertinoButton(
//       onPressed: ontab,
//       child: Container(
//         height: 70,
//         width: 70,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.blueAccent,
//                 spreadRadius: 1,
//                 blurRadius: 8,
//                 offset: Offset(4,4),
//               ),
//               BoxShadow(
//                 color: Colors.transparent,
//                 spreadRadius: 2,
//                 blurRadius: 8,
//                 offset: Offset(-4,-4),
//               )
//             ]
//         ),
//         child: Center(
//           child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Icon(icon)
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget itemOfUpload(nomi){
//     return Container(
//       color: Colors.transparent,
//       child: Center(
//           child: GestureDetector(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 10,),
//                   Container(
//                       height: 150,
//                       width: 150,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.blueAccent,
//                               spreadRadius: 1,
//                               blurRadius: 8,
//                               offset: Offset(4,4),
//                             ),
//                             BoxShadow(
//                               color: Colors.transparent,
//                               spreadRadius: 2,
//                               blurRadius: 8,
//                               offset: Offset(-4,-4),
//                             )
//                           ]
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 120,
//                             width: 120,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: _image!= null?
//                               Image.file(
//                                 _image!,
//                               ):
//                               const SizedBox(),
//                             ),
//                           ),
//                           Text(nomi, style: const TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       )
//                   ),
//                   const SizedBox(height: 10,),
//                 ],
//               )
//           )
//       ),
//     );
//   } ///Firebasega narsa yuklagan payt ko'rsatadigan Container
//
//   void _imgFromGallery() async {
//     XFile? image = await _picker.pickImage(
//         source: ImageSource.gallery, imageQuality: 50
//     );
//     setState(() {
//       _image = File(image!.path);
//     });
//   }
//
// }