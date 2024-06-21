import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/values/app.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/values/colors.dart';
import 'package:userinterface_nft_bachelar_finalproject/modules/create/controller.dart';

class CreateScreen extends StatefulWidget{
  static const name = '/create';

  @override
  State<CreateScreen> createState() {
    // TODO: implement createState
    return _CreateScreen();
  }
}

class _CreateScreen extends State<CreateScreen>{
  File? _selectedImage;
  final CreateController controller = CreateController();

  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnedImage == null)
      return ;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:const Text('Create Your Own NFT', style: TextStyle(color: Colors.white
          ,fontWeight: FontWeight.bold),),
        elevation: 10,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: appSize.getWidth(widthSize: 10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: appSize.getHeight(heightSize: 30),),
                Container(
                  alignment: Alignment.center,
                  width: _selectedImage == null ? appSize.getWidth(widthSize: 200)
                      : double.infinity ,
                  height: _selectedImage != null ? appSize.getHeight(heightSize: 300)
                      : appSize.getHeight(heightSize: 200),
                  decoration: BoxDecoration(
                      border: Border.all(color:
                      _selectedImage == null ? Colors.black : Colors.transparent , width: 2)
                  ),
                  child: _selectedImage != null ? Image.file(_selectedImage! ,
                    fit: BoxFit.fill,) :
                  const Text('Please insert your ART!!'),
                ),
                SizedBox(height: appSize.getHeight(heightSize: 10),),
                InkWell(
                  onTap: _pickImageFromGallery,
                  child: Container(
                    width: appSize.getWidth(widthSize: 200),
                    height: appSize.getHeight(heightSize: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: AppColors.primaryColor
                    ),
                    alignment: Alignment.center,
                    child: const Text('Chose Photo from Gallery!' ,
                      style: TextStyle(color: Colors.white), ),
                  ),
                ),
                SizedBox(height: appSize.getHeight(heightSize: 30),),
                TextFieldCreate(controller: controller.nameController, label: 'Name'),
                SizedBox(height: appSize.getHeight(heightSize: 10),),
                TextFieldCreate(controller: controller.priceController, label: 'Price', isNumber: true,),
                SizedBox(height: appSize.getHeight(heightSize: 10),),
                TextFieldCreate(controller: controller.descriptionController, label: 'Description'),
                SizedBox(height: appSize.getHeight(heightSize: 10),),
                SizedBox(height: appSize.getHeight(heightSize: 10),),
                InkWell(
                  onTap: _pickImageFromGallery,
                  child: Container(
                    // width: appSize.getWidth(widthSize: 200),
                    height: appSize.getHeight(heightSize: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: AppColors.primaryColor
                    ),
                    alignment: Alignment.center,
                    child: const Text('Create' ,
                      style: TextStyle(color: Colors.white), ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class TextFieldCreate extends StatelessWidget{
  final TextEditingController controller;
  final String label;
  final bool isNumber;

  TextFieldCreate({
    Key? key,
    this.isNumber = false,
   required this.controller,
   required this.label
}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.textColor),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          padding: EdgeInsets.symmetric(horizontal: appSize.getWidth(widthSize: 5)),
          child: TextField(
            controller: controller,
            keyboardType:isNumber ? TextInputType.number : TextInputType.text,
            maxLines: null,
            autocorrect: false,
            style: TextStyle(
                color: AppColors.gray
            ),
            onChanged: (input){
              controller.text = input;
            },
            textAlign: TextAlign.start,
            decoration: InputDecoration(
                labelText: label,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none
            ),
          ),
        ),
        Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: appSize.getHeight(heightSize: 30),
              width: appSize.getWidth(widthSize: 50),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft:  Radius.circular(10)
                  ),
                  color: AppColors.primaryColor
              ),
              child: Text('new' , style: TextStyle(color: Colors.white),),
            )
        )
      ],
    );
  }
}