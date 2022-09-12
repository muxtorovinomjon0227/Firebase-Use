
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';


class FirebaseUploedImage extends StatefulWidget {
  const FirebaseUploedImage({Key? key}) : super(key: key);

  @override
  State<FirebaseUploedImage> createState() => _FirebaseUploedImageState();
}

class _FirebaseUploedImageState extends State<FirebaseUploedImage> {

  File? imageUrl;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          imageUrl!=null
         ?  Image(
            image: FileImage(
                File(imageUrl!.path.toString()),
                scale: 4
            ),
          )
         :  Padding(
           padding: const EdgeInsets.all(8.0),
           child: Image.network("https://i.imgur.com/sUFH1Aq.png"),
         ),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: (){
            _imagePikce();
          }, child: const Text("Rasm yuklash"))
        ],
      )
    );
  }


  Future _imagePikce() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;
    final imageTemp = File(image.path);
    setState(() {
    imageUrl = imageTemp;
    });
    print(imageTemp);

  }




}
