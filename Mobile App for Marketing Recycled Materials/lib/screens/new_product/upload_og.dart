// import 'dart:io';
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:ditso_news_app/view/page/category_page/social_page.dart';
// // import 'package:ditso_news_app/view/page/home_page/home_page.dart';
// // import 'package:ditso_news_app/view/page/home_page/notifications.dart';
// // import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:trial/widgets/widgets.dart';
//
// import '../splash/splash_screen.dart';
//
// class UploadPostPage extends StatefulWidget {
//   static const String routeName = '/upload';
//   static Route route() {
//     return MaterialPageRoute(
//         settings: RouteSettings(name: routeName),
//         builder: (_) => UploadPostPage(
//           Campus: '',
//         ));
//   }
//
//   String Campus;
//   UploadPostPage({Key? key, required this.Campus}) : super(key: key);
//
//   @override
//   _UploadPostPageState createState() => _UploadPostPageState();
// }
//
// class _UploadPostPageState extends State<UploadPostPage> {
//   // List<File> _images = []; //if more than one picture
//   File _file = File('');
//   File _file2 = File('');
//   File _file3 = File('');
//   File _file4 = File('');
//   List imageURLs = [];
//   int position = 0;
//   var title;
//   var description;
//   var category;
//
//   var selectedCategoryId;
//   late String imageUrl;
//   late String imageUrl2;
//   late String imageUrl3;
//   late String imageUrl4;
//   var currentUser = '';
//   bool isPrivileged = false;
//
//   var isUploading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     initDownloadsDirectoryState();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initDownloadsDirectoryState() async {
//     setState(() {
//       currentUser = FirebaseAuth.instance.currentUser!.uid;
//
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUser.toString())
//           .get()
//           .then((querySnapshot) {
//         String privilege = querySnapshot.get('privilege').toString();
//         if (privilege == 'master') {
//           isPrivileged = true;
//           print(privilege + "..hii ndio.." + isPrivileged.toString());
//         }
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: NeumorphicTheme.of(context)!.isUsingDark
//       //     ? Colors.black12
//       //     : Colors.white,
//       appBar: CustomAppBar(title: 'New Product'),
//       // appBar: NeumorphicAppBar(
//       //   title: Text(
//       //     "New Image Post",
//       //     style: TextStyle(
//       //         color: titleColor(context), fontWeight: FontWeight.bold),
//       //   ),
//       //   centerTitle: true,
//       //   // actions: [
//       //   //   NeumorphicButton(
//       //   //     child: Row(
//       //   //       mainAxisAlignment: MainAxisAlignment.center,
//       //   //       children: [
//       //   //         Text('Other',style: TextStyle(color: textColor(context),fontWeight: FontWeight.bold )),
//       //   //         // Icon(Icons.navigate_next,color: textColor(context),),
//       //   //       ],
//       //   //     ),
//       //   //     onPressed: (){
//       //   //       Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
//       //   //         return OtherMedia(userCategory:widget.Campus);
//       //   //       }));
//       //   //
//       //   //     },
//       //   //   ),
//       //   // ],
//       // ),
//       body: ListView(
//         padding: EdgeInsets.all(16),
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           NeumorphicButton(
//             onPressed: () {
//               pickImage();
//             },
//             style: NeumorphicStyle(
//               shape: NeumorphicShape.flat,
//               boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//               depth: 0,
//               lightSource: LightSource.topLeft,
//             ),
//             child: Container(
//               width: 100,
//               height: 200,
//               child: _file.path == ''
//                   ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.image),
//                   Text("Choose\nOne Or Multiple\nPhoto",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: textColor(context))),
//                 ],
//               )
//                   : Image.file(
//                 _file,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           _file2.path != ''
//               ? NeumorphicButton(
//             onPressed: () {},
//             style: NeumorphicStyle(
//               shape: NeumorphicShape.flat,
//               boxShape:
//               NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//               depth: 0,
//               lightSource: LightSource.topLeft,
//             ),
//             child: Container(
//               width: 100,
//               height: 200,
//               child: _file2.path == ''
//                   ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.image),
//                   Text("Optional\nPhoto",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: textColor(context))),
//                 ],
//               )
//                   : Image.file(
//                 _file2,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           )
//               : SizedBox(
//             height: 8,
//           ),
//           _file3.path != ''
//               ? NeumorphicButton(
//             onPressed: () {},
//             style: NeumorphicStyle(
//               shape: NeumorphicShape.flat,
//               boxShape:
//               NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//               depth: 0,
//               lightSource: LightSource.topLeft,
//             ),
//             child: Container(
//               width: 100,
//               height: 200,
//               child: _file3.path == ''
//                   ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.image),
//                   Text("Optional\nPhoto",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: textColor(context))),
//                 ],
//               )
//                   : Image.file(
//                 _file3,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           )
//               : SizedBox(
//             height: 8,
//           ),
//           _file4.path != ''
//               ? NeumorphicButton(
//             onPressed: () {},
//             style: NeumorphicStyle(
//               shape: NeumorphicShape.flat,
//               boxShape:
//               NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//               depth: 0,
//               lightSource: LightSource.topLeft,
//             ),
//             child: Container(
//               width: 100,
//               height: 200,
//               child: _file4.path == ''
//                   ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.image),
//                   Text("Optional\nPhoto",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: textColor(context))),
//                 ],
//               )
//                   : Image.file(
//                 _file4,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           )
//               : SizedBox(
//             height: 8,
//           ),
//
//           SizedBox(
//             height: 8,
//           ),
//
//           Neumorphic(
//             style: NeumorphicStyle(
//               shape: NeumorphicShape.concave,
//               boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//               depth: -4,
//               lightSource: LightSource.topLeft,
//               color: textFieldColor(context),
// //                    color: Colors.grey
//             ),
//             child: TextField(
//               // controller: titleTec,
//               decoration: InputDecoration(
//                   hintText: "Enter title",
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.only(left: 10)),
//               onChanged: (value) {
//                 title = value;
//               },
//             ),
//           ),
//
//           SizedBox(
//             height: 8,
//           ),
//
//           Neumorphic(
//             style: NeumorphicStyle(
//                 shape: NeumorphicShape.concave,
//                 boxShape:
//                 NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//                 depth: -4,
//                 lightSource: LightSource.topLeft,
//                 color: textFieldColor(context)
// //                    color: Colors.grey
//             ),
//             child: TextField(
//               // controller: descTec,
//               decoration: InputDecoration(
//                   hintText: "Enter Description",
//                   border: InputBorder.none,
//                   contentPadding:
//                   EdgeInsets.only(left: 10, top: 10, bottom: 10)),
//               minLines: 4,
//               maxLines: 4,
//               onChanged: (value) {
//                 description = value;
//               },
//             ),
//           ),
//
//           SizedBox(
//             height: 8,
//           ),
//
//           Neumorphic(
//             style: NeumorphicStyle(
//               shape: NeumorphicShape.concave,
//               boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//               depth: -4,
//               lightSource: LightSource.topLeft,
//               color: textFieldColor(context),
// //                    color: Colors.grey
//             ),
//             child: DropdownButtonFormField<String>(
//               onChanged: (i) {
//                 selectedCategoryId = i;
//                 category = selectedCategoryId.toString();
//               },
//               // items: list.map((ob){
//               //   return DropdownMenuItem(child: Text(ob.name),value: ob.id,);
//               // }).toList(),
//               items: [
//                 DropdownMenuItem(
//                   child: Text("Unused Container",
//                       style: TextStyle(color: dropTextColor(context))),
//                   value: 'Unused Container',
//                 ),
//                 DropdownMenuItem(
//                   child: Text('Dumped Plastic Tanks',
//                       style: TextStyle(color: dropTextColor(context))),
//                   value: 'Dumped Plastic Tanks',
//                 ),
//                 DropdownMenuItem(
//                   child: Text('Dumped Cars',
//                       style: TextStyle(color: dropTextColor(context))),
//                   value: 'Dumped Cars',
//                 ),
//                 // DropdownMenuItem(
//                 //   child: Text('Sports',
//                 //       style: TextStyle(color: dropTextColor(context))),
//                 //   value: 'sports',
//                 // ),
//                 // DropdownMenuItem(
//                 //   child: Text('Projects',
//                 //       style: TextStyle(color: dropTextColor(context))),
//                 //   value: 'projects',
//                 // ),
//                 // DropdownMenuItem(
//                 //   child: Text('Ipt',
//                 //       style: TextStyle(color: dropTextColor(context))),
//                 //   value: 'ipt',
//                 // ),
//                 // DropdownMenuItem(
//                 //   child: Text("More & Advertisement",
//                 //       style: TextStyle(color: dropTextColor(context))),
//                 //   value: 'more',
//                 // ),
//                 // DropdownMenuItem(
//                 //   child: Text("Register's Office",
//                 //       style: TextStyle(color: dropTextColor(context))),
//                 //   value: 'registers',
//                 // ),
//                 // DropdownMenuItem(
//                 //   child: Text("All Campuses",
//                 //       style: TextStyle(color: dropTextColor(context))),
//                 //   value: 'campuses',
//                 // ),
//               ],
//
//               decoration: InputDecoration(
//                   hintText: "Select Category",
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.only(left: 10)),
//             ),
//           ),
//
//           SizedBox(
//             height: 8,
//           ),
//           // AppUtils.loadingWidget(
//           // stream:_bloc.uploadStream(),
//           // widget:
//           NeumorphicButton(
//             onPressed: () async {
//               setState(() {
//                 isUploading = true;
//               });
//               var dbTimeKey = new DateTime.now();
//               var formatDate = new DateFormat('MMM d,yyyy');
//               var formatTime = new DateFormat('EEEE,hh:mm aaa');
//               String date = formatDate.format(dbTimeKey);
//               String time = formatTime.format(dbTimeKey);
//               int initialLike = 0;
//
//               String imageURL;
//               String imageURL2 = '';
//               String imageURL3 = '';
//               String imageURL4 = '';
//               imageURL = await uploadFile(_file, dbTimeKey);
//               if (_file2.path != '') {
//                 imageURL2 = await uploadFile2(_file2, dbTimeKey);
//               }
//               if (_file3.path != '') {
//                 imageURL3 = await uploadFile3(_file3, dbTimeKey);
//               }
//               if (_file4.path != '') {
//                 imageURL4 = await uploadFile4(_file4, dbTimeKey);
//               }
//               CollectionReference post =
//               FirebaseFirestore.instance.collection('products');
//               // .doc(category)
//               // .collection('posts');
//               for (int i = 0; i < imageURLs.length; i++) {
//                 print('urls ' + imageURLs[i]);
//               }
//
//               if (imageURLs.length == 1) {
//                 post
//                     .add({
//                   // 'description': description,
//                   // 'date': date,
//                   // 'time': time,
//                   // 'type': 'image',
//                   // 'author': currentUser,
//                   //new entries
//                   'name': title,
//                   'category': category,
//                   'imageUrl': imageURL,
//                   'like': initialLike,
//                   'price': 1000,
//                   'quantity': 5,
//                   'isPopular': true,
//                   'isRecommended': true,
//                   'id': 1,
//                 })
//                     .then((value) => print('Post added'))
//                     .then((value) => Navigator.of(context).push(
//                     MaterialPageRoute(builder: (BuildContext context) {
//                       return SplashScreen(
//                         userCategory: widget.Campus,
//                         isPrivileged: isPrivileged,
//                       );
//                     })))
//                     .catchError((error) => print('Failed to send post $error'));
//               }
//               if (imageURLs.length == 2) {
//                 post
//                     .add({
//                   'title': title,
//                   'description': description,
//                   'category': category,
//                   'date': date,
//                   'time': time,
//                   'image1': imageURL,
//                   'image2': imageURL2,
//                   'type': 'image',
//                   'like': initialLike,
//                   'author': currentUser
//                 })
//                     .then((value) => print('Post added'))
//                     .then((value) => Navigator.of(context).push(
//                     MaterialPageRoute(builder: (BuildContext context) {
//                       return SplashScreen(
//                         userCategory: widget.Campus,
//                         isPrivileged: isPrivileged,
//                       );
//                     })))
//                     .catchError((error) => print('Failed to send post $error'));
//               }
//               if (imageURLs.length == 3) {
//                 post
//                     .add({
//                   'title': title,
//                   'description': description,
//                   'category': category,
//                   'date': date,
//                   'time': time,
//                   'image1': imageURL,
//                   'image2': imageURL2,
//                   'image3': imageURL3,
//                   'type': 'image',
//                   'like': initialLike,
//                   'author': currentUser
//                 })
//                     .then((value) => print('Post added'))
//                     .then((value) => Navigator.of(context).push(
//                     MaterialPageRoute(builder: (BuildContext context) {
//                       return SplashScreen(
//                         userCategory: widget.Campus,
//                         isPrivileged: isPrivileged,
//                       );
//                     })))
//                     .catchError((error) => print('Failed to send post $error'));
//               }
//               if (imageURLs.length == 4) {
//                 post
//                     .add({
//                   'title': title,
//                   'description': description,
//                   'category': category,
//                   'date': date,
//                   'time': time,
//                   'image1': imageURL,
//                   'image2': imageURL2,
//                   'image3': imageURL3,
//                   'image4': imageURL4,
//                   'type': 'image',
//                   'like': initialLike,
//                   'author': currentUser
//                 })
//                     .then((value) => print('Post added'))
//                     .then((value) => Navigator.of(context).push(
//                     MaterialPageRoute(builder: (BuildContext context) {
//                       return SplashScreen(
//                         userCategory: widget.Campus,
//                         isPrivileged: isPrivileged,
//                       );
//                     })))
//                     .catchError((error) => print('Failed to send post $error'));
//               }
//             },
//             // onPressed: uploadData,
//             child: Padding(
//               padding: EdgeInsets.all(8),
//               child: Center(
//                 child: isUploading
//                     ? CircularProgressIndicator(
//                   color: Colors.white,
//                 )
//                     : Text(
//                   "Upload",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//               ),
//             ),
//             style: NeumorphicStyle(
//               shape: NeumorphicShape.flat,
//               boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//               color: Colors.indigo.shade900,
//               depth: 0,
// //                lightSource: LightSource.topLeft,
//             ),
//           ),
//           Padding(padding: EdgeInsets.all(8)),
//           // TextButton(
//           //     onPressed: (){
//           //       createPlantFoodNotification();
//           //     },
//           //     child: Text('NOTIFY')
//           // )
//           // )
//         ],
//       ),
//     );
//   }
//
//   final picker = ImagePicker();
//   pickImage() async {
//     // final pickedFile = await picker.getImage(source: ImageSource.gallery,imageQuality: 50);
//     final List<XFile>? pickedFile = await picker.pickMultiImage();
//     setState(() {
//       if (pickedFile != null) {
//         if (pickedFile.length == 1) {
//           _file = File(pickedFile.elementAt(0).path);
//         } else if (pickedFile.length == 2) {
//           _file = File(pickedFile.elementAt(0).path);
//           _file2 = File(pickedFile.elementAt(1).path);
//         } else if (pickedFile.length == 3) {
//           _file = File(pickedFile.elementAt(0).path);
//           _file2 = File(pickedFile.elementAt(1).path);
//           _file3 = File(pickedFile.elementAt(2).path);
//         } else if (pickedFile.length == 4) {
//           _file = File(pickedFile.elementAt(0).path);
//           _file2 = File(pickedFile.elementAt(1).path);
//           _file3 = File(pickedFile.elementAt(2).path);
//           _file4 = File(pickedFile.elementAt(3).path);
//         }
//         print("path1 " + _file.path);
//         print("path2 " + _file2.path);
//         print("path3 " + _file3.path);
//         print("path4 " + _file4.path);
//       } else {
//         print('No image selected');
//       }
//     });
//   }
//
//   Future<String> uploadFile(File _image, var dbTimeKey) async {
//     Reference reference = FirebaseStorage.instance
//         .ref()
//         .child("post_images")
//         .child(dbTimeKey.toString() + '1.jpg');
//     UploadTask uploadTasks = reference.putFile(_image);
//     await uploadTasks.whenComplete(() async {
//       try {
//         imageUrl = await reference.getDownloadURL();
//         print("picha url");
//       } catch (onError) {
//         print("Error");
//       }
//     });
//     await reference.getDownloadURL().then((fileURL) {
//       imageUrl = fileURL;
//       imageURLs.add(imageUrl);
//       print("huku imepita");
//     });
//     print("ime-return");
//     return imageUrl;
//   }
//
//   Future<String> uploadFile2(File _image, var dbTimeKey) async {
//     Reference reference = FirebaseStorage.instance
//         .ref()
//         .child("post_images")
//         .child(dbTimeKey.toString() + '2.jpg');
//     UploadTask uploadTasks = reference.putFile(_image);
//     await uploadTasks.whenComplete(() async {
//       try {
//         imageUrl2 = await reference.getDownloadURL();
//       } catch (onError) {
//         print("Error");
//       }
//     });
//     await reference.getDownloadURL().then((fileURL) {
//       imageUrl2 = fileURL;
//       imageURLs.add(imageUrl2);
//     });
//     return imageUrl2;
//   }
//
//   Future<String> uploadFile3(File _image, var dbTimeKey) async {
//     Reference reference = FirebaseStorage.instance
//         .ref()
//         .child("post_images")
//         .child(dbTimeKey.toString() + '3.jpg');
//     UploadTask uploadTasks = reference.putFile(_image);
//     await uploadTasks.whenComplete(() async {
//       try {
//         imageUrl3 = await reference.getDownloadURL();
//       } catch (onError) {
//         print("Error");
//       }
//     });
//     await reference.getDownloadURL().then((fileURL) {
//       imageUrl3 = fileURL;
//       imageURLs.add(imageUrl3);
//     });
//     return imageUrl3;
//   }
//
//   Future<String> uploadFile4(File _image, var dbTimeKey) async {
//     Reference reference = FirebaseStorage.instance
//         .ref()
//         .child("post_images")
//         .child(dbTimeKey.toString() + '4.jpg');
//     UploadTask uploadTasks = reference.putFile(_image);
//     await uploadTasks.whenComplete(() async {
//       try {
//         imageUrl4 = await reference.getDownloadURL();
//       } catch (onError) {
//         print("Error");
//       }
//     });
//     await reference.getDownloadURL().then((fileURL) {
//       imageUrl4 = fileURL;
//       imageURLs.add(imageUrl4);
//     });
//     return imageUrl4;
//   }
//
//   Color textColor(BuildContext context) {
//     if (NeumorphicTheme.isUsingDark(context)) {
//       return Colors.white;
//     } else {
//       return Colors.black;
//     }
//   }
//
//   Color dropTextColor(BuildContext context) {
//     if (NeumorphicTheme.isUsingDark(context)) {
//       return Colors.black;
//     } else {
//       return Colors.black;
//     }
//   }
//
//   Color textFieldColor(BuildContext context) {
//     if (NeumorphicTheme.isUsingDark(context)) {
//       return Colors.white;
//     } else {
//       return Colors.white;
//     }
//   }
//
//   Color titleColor(BuildContext context) {
//     if (NeumorphicTheme.isUsingDark(context)) {
//       return Colors.white;
//     } else {
//       return Colors.blue.shade300;
//     }
//   }
// }
