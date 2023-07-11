
import 'package:flutter/material.dart';
import 'package:get/get.dart';



Widget itemOfContainer(rasmi,nomi,ontab){
  return Container(
    color: Colors.transparent,
    child: Center(
        child: GestureDetector(
            onTap: (){
              Get.to(ontab,);
            },
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blueAccent,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(4,4),
                          ),
                          BoxShadow(
                            color: Colors.transparent,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-4,-4),
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(image: AssetImage(rasmi,),)
                          ),
                        ),
                        Text(nomi, style: const TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                ),
                const SizedBox(height: 10,),
              ],
            )
        )
    ),
  );
}

Widget itemOfContainer1(rasmi,ontab){
  return Container(
    color: Colors.transparent,
    child: Center(
        child: GestureDetector(
            onTap: (){
              Get.to(ontab);
            },
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blueAccent,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(4,4),
                          ),
                          BoxShadow(
                            color: Colors.transparent,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-4,-4),
                          )
                        ]
                    ),
                    child: Center(
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(image: AssetImage(rasmi,),)
                          ),
                        ),
                    )
                ),
                const SizedBox(height: 10,),
              ],
            )
        )
    ),
  );
}

Widget itemOfContainer2(rasmi,nomi,ontab,delete){
  return Container(
    color: Colors.transparent,
    child: Center(
        child: GestureDetector(
            onTap: (){
              Get.to(ontab,);
            },
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Stack(
                  children: [
                    Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueAccent,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: Offset(4,4),
                              ),
                              BoxShadow(
                                color: Colors.transparent,
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(-4,-4),
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network("$rasmi")
                              ),
                            ),
                            Text(nomi, style: const TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                    ),
                    IconButton(
                      onPressed: () =>delete,
                      icon: const Icon(Icons.delete),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            )
        )
    ),
  );
}

Widget itemOfContainer3(rasmi,ontab,appbar, ontabb){
  return Container(
    color: Colors.transparent,
    child: Center(
        child: GestureDetector(
            onTap: (){
              if(appbar == "Audio Kitoblar"){
                Get.to(ontabb);
              }else {
                Get.to(ontab);
              }
            },
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blueAccent,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(4,4),
                          ),
                          BoxShadow(
                            color: Colors.transparent,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-4,-4),
                          )
                        ]
                    ),
                    child: Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(image: AssetImage(rasmi,),)
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
              ],
            )
        )
    ),
  );
}