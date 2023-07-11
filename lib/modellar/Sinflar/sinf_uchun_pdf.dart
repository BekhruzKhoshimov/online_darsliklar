import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/feed_page/1maktab_darsliklari/1maktab_darsliklari.dart';
import '../barchasi_uchun/itemofcontainer.dart';

Widget itemOfSinf(sinf,rasmi,fani,ontab){
  return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(sinf, style: const TextStyle(color: Colors.black),),
        leading: IconButton(
          onPressed: () {
            Get.to(ontab);
          },
          icon: IconButton(
            onPressed: (){
              Get.to(const MaktabDarsliklari(apbar: "", f: '',));
            },
            icon: const Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),
          )
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemOfContainer(rasmi,fani,ontab),
                  itemOfContainer(rasmi,fani,ontab),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemOfContainer(rasmi,fani,ontab),
                  itemOfContainer(rasmi,fani,ontab),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemOfContainer(rasmi,fani,ontab),
                  itemOfContainer(rasmi,fani,ontab),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemOfContainer(rasmi,fani,ontab),
                  itemOfContainer(rasmi,fani,ontab),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemOfContainer(rasmi,fani,ontab),
                  itemOfContainer(rasmi,fani,ontab),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemOfContainer(rasmi,fani,ontab),
                  itemOfContainer(rasmi,fani,ontab),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemOfContainer(rasmi,fani,ontab),
                  itemOfContainer(rasmi,fani,ontab),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemOfContainer(rasmi,fani,ontab),
                  itemOfContainer(rasmi,fani,ontab),
                ],
              ),
              itemOfContainer(rasmi,fani,ontab),
            ],
          ),
        ],
      ),
  );
}