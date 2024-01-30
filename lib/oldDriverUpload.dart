// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class DriverDetails extends StatefulWidget {
//   const DriverDetails({Key? key}) : super(key: key);
//
//   @override
//   State<DriverDetails> createState() => _DriverDetailsState();
// }
//
// class _DriverDetailsState extends State<DriverDetails> {
//   String? UserId;
//   XFile? profileImage;
//   XFile? licenceFront;
//   XFile? licenceBack;
//   XFile? aadharFront;
//   XFile? aadharBack;
//   final ImagePicker picker = ImagePicker();
//   var demeritPointctr = TextEditingController();
//   Future ChooseImage(ImageSource source) async {
//     File? ImgFile;
//     XFile? pickedImage = await ImagePicker().pickImage(source: source);
//     if (pickedImage != null) {
//       setState(() {
//         ImgFile = File(pickedImage.path);
//       });
//       var result = await FlutterImageCompress.compressWithList(
//         ImgFile!.absolute.readAsBytesSync(),
//         // '${ImgFile!.path}compressed.jpg',
//         quality: 5,
//       );
//       print("picked Image length : ${result!.length}");
//
//       return result;
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var _height = MediaQuery.of(context).size.height;
//     var _width = MediaQuery.of(context).size.width;
//     print(_width.toString());
//     print(_height.toString());
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             color: const Color(0xff6e95f8),
//             height: _height,
//             width: _width,
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.only(top: 40, left: 04),
//                       child: const Icon(
//                         Icons.arrow_back,
//                         size: 40,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                     margin: const EdgeInsets.only(top: 10, left: 40),
//                     child: const Text(
//                       'Add Driver Details',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 30,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               margin: const EdgeInsets.only(top: 150),
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(40),
//                       topRight: Radius.circular(40))),
//               width: _width,
//               child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Stack(
//                         children: [
//                           profileImage != null
//                               ? CircleAvatar(
//                             backgroundColor: Colors.black12,
//                             radius: 50,
//                             child: CircleAvatar(
//                               radius: 50 - 4,
//                               backgroundImage: Image.file(
//                                 File(profileImage!.path),
//                                 fit: BoxFit.cover,
//                               ).image,
//                             ),
//                           )
//                               : Container(
//                             width: 100,
//                             height: 100,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(60),
//                                 border:
//                                 Border.all(color: Colors.grey, width: 3)),
//                           ),
//                           Positioned(
//                             bottom: 0,
//                             right: 5,
//                             child: ClipOval(
//                               child: SizedBox(
//                                   height: 36,
//                                   width: 36,
//                                   // color: Color(0xff36517e),
//                                   child: IconButton(
//                                       onPressed: () {
//                                         showDialog(
//                                             context: context,
//                                             builder: (ctx) => AlertDialog(
//                                               actions: [
//                                                 Center(
//                                                   child: Column(
//                                                     children: [
//                                                       ElevatedButton(
//                                                         onPressed: () async {
//                                                           print("camera");
//                                                           profileImage =
//                                                           await ChooseImage(
//                                                               ImageSource
//                                                                   .camera);
//                                                           Navigator.pop(
//                                                               context);
//                                                           setState(() {});
//                                                           //_getFromCameraBack();
//                                                         },
//                                                         child: const Text(
//                                                             "PICK FROM CAMERA"),
//                                                       ),
//                                                       ElevatedButton(
//                                                         onPressed: () async {
//                                                           print("gallery");
//                                                           profileImage =
//                                                           await ChooseImage(
//                                                               ImageSource
//                                                                   .gallery);
//                                                           setState(() {});
//                                                           //_getFromGalleryBack();
//
//                                                           Navigator.pop(
//                                                               context);
//                                                         },
//                                                         child: const Text(
//                                                             "PICK FROM GALLERY"),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ));
//                                       },
//                                       icon: const Icon(
//                                         Icons.add_a_photo_rounded,
//                                         color: Colors.black,
//                                         size: 24,
//                                       ))),
//                             ),
//                           )
//                         ],
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(top: 30),
//                         child: RichText(
//                           text: TextSpan(children: [
//                             const TextSpan(
//                               text: "User id: ",
//                               style: TextStyle(color: Colors.blue, fontSize: 20),
//                             ),
//                             TextSpan(
//                               text: UserId.toString(),
//                               style: const TextStyle(
//                                   color: Colors.black, fontSize: 20),
//                             ),
//                           ]),
//                         ),
//                       ),
//                       Container(
//                         // margin: EdgeInsets.only(top: 30),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               width: 160,
//                               child: TextFormField(
//                                 readOnly: true,
//                                 style: const TextStyle(
//                                     color: Colors.blue, fontSize: 20),
//                                 initialValue: "Demerits Points :",
//                                 decoration: const InputDecoration(
//                                   border: InputBorder.none,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 150,
//                               child: TextFormField(
//                                 style: const TextStyle(
//                                     color: Colors.black, fontSize: 20),
//                                 controller: demeritPointctr,
//                                 keyboardType: TextInputType.number,
//                                 decoration: const InputDecoration(
//                                   hintText: "Enter Demerit point",
//                                   hintStyle:
//                                   TextStyle(color: Colors.black, fontSize: 14),
//                                   enabledBorder: UnderlineInputBorder(
//                                     borderSide:
//                                     BorderSide(color: Color(0xff31547e)),
//                                   ),
//                                   focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color(0xff000000), width: 1),
//                                   ),
//                                   border: InputBorder.none,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Divider(
//                         thickness: 2,
//                         color: Colors.grey,
//                       ),
//                       Container(
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.center,
//                               child: Container(
//                                 margin: const EdgeInsets.only(top: 30),
//                                 child: const Text(
//                                   "Upload Diving License",
//                                   textAlign: TextAlign.start,
//                                   style:
//                                   TextStyle(color: Colors.blue, fontSize: 20),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.only(top: 10, bottom: 10),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Container(
//                                           height: 120,
//                                           width: 90,
//                                           decoration: BoxDecoration(
//                                               border: Border.all(
//                                                   color: Colors.black, width: 3),
//                                               borderRadius:
//                                               BorderRadius.circular(10)),
//                                           child: licenceFront == null
//                                               ? IconButton(
//                                             onPressed: () {
//                                               showDialog(
//                                                   context: context,
//                                                   builder:
//                                                       (ctx) => AlertDialog(
//                                                     actions: [
//                                                       Center(
//                                                         child: Column(
//                                                           children: [
//                                                             ElevatedButton(
//                                                               onPressed:
//                                                                   () async {
//                                                                 licenceFront =
//                                                                 await ChooseImage(ImageSource.camera);
//                                                                 //_getFromCameraFront();
//                                                                 setState(
//                                                                         () {});
//                                                                 Navigator.pop(
//                                                                     context);
//                                                               },
//                                                               child: const Text(
//                                                                   "PICK FROM CAMERA"),
//                                                             ),
//                                                             ElevatedButton(
//                                                               onPressed:
//                                                                   () async {
//                                                                 licenceFront =
//                                                                 await ChooseImage(ImageSource.gallery);
//                                                                 // _getFromGalleryFront();
//                                                                 setState(
//                                                                         () {});
//                                                                 Navigator.pop(
//                                                                     context);
//                                                               },
//                                                               child: const Text(
//                                                                   "PICK FROM GALLERY"),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ));
//                                             },
//                                             icon: const Icon(
//                                               Icons.camera_alt_outlined,
//                                               size: 50.0,
//                                               color: Colors.black54,
//                                             ),
//                                           )
//                                               : Container(
//                                             child: Image.file(
//                                               File(licenceFront!.path),
//                                               fit: BoxFit.cover,
//                                             ),
//                                           )),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text(
//                                           "Front",
//                                           style: TextStyle(color: Colors.grey[900]),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     width: 100,
//                                   ),
//                                   Column(
//                                     children: [
//                                       Container(
//                                           width: 90,
//                                           height: 120,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius.circular(7),
//                                               border: Border.all(
//                                                   color: Colors.black, width: 3)),
//                                           child: Container(
//                                               child: licenceBack == null
//                                                   ? Container(
//                                                 child: IconButton(
//                                                   onPressed: () {
//                                                     showDialog(
//                                                         context: context,
//                                                         builder:
//                                                             (ctx) =>
//                                                             AlertDialog(
//                                                               actions: [
//                                                                 Center(
//                                                                   child:
//                                                                   Column(
//                                                                     children: [
//                                                                       ElevatedButton(
//                                                                         onPressed: () async {
//                                                                           licenceBack = await ChooseImage(ImageSource.camera);
//                                                                           //_getFromCameraFront();
//                                                                           setState(() {});
//                                                                           Navigator.pop(context);
//                                                                         },
//                                                                         child: const Text("PICK FROM CAMERA"),
//                                                                       ),
//                                                                       ElevatedButton(
//                                                                         onPressed: () async {
//                                                                           licenceBack = await ChooseImage(ImageSource.gallery);
//                                                                           setState(() {});
//                                                                           Navigator.pop(context);
//                                                                         },
//                                                                         child: const Text("PICK FROM GALLERY"),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ));
//                                                   },
//                                                   icon: const Icon(
//                                                     Icons.camera_alt_outlined,
//                                                     size: 50.0,
//                                                     color: Colors.black54,
//                                                   ),
//                                                 ),
//                                               )
//                                                   : Container(
//                                                 child: Image.file(
//                                                   File(licenceBack!.path),
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ))),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text(
//                                           "Back",
//                                           style: TextStyle(color: Colors.grey[900]),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Divider(
//                         thickness: 2,
//                         color: Colors.grey,
//                       ),
//                       Container(
//                         decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(40),
//                                 topRight: Radius.circular(40))),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.center,
//                               child: Container(
//                                 margin: const EdgeInsets.only(
//                                   top: 30,
//                                 ),
//                                 child: const Text(
//                                   "Upload Aadhar Card",
//                                   textAlign: TextAlign.start,
//                                   style:
//                                   TextStyle(color: Colors.blue, fontSize: 20),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.only(top: 10),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Container(
//                                           width: 90,
//                                           height: 120,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius.circular(7),
//                                               border: Border.all(
//                                                   color: Colors.black, width: 3)),
//                                           child: Container(
//                                               child: aadharFront == null
//                                                   ? Container(
//                                                 child: IconButton(
//                                                   onPressed: () {
//                                                     showDialog(
//                                                         context: context,
//                                                         builder:
//                                                             (ctx) =>
//                                                             AlertDialog(
//                                                               actions: [
//                                                                 Center(
//                                                                   child:
//                                                                   Column(
//                                                                     children: [
//                                                                       ElevatedButton(
//                                                                         onPressed: () async {
//                                                                           aadharFront = await ChooseImage(ImageSource.camera);
//
//                                                                           setState(() {});
//                                                                           Navigator.pop(context);
//                                                                         },
//                                                                         child: const Text("PICK FROM CAMERA"),
//                                                                       ),
//                                                                       ElevatedButton(
//                                                                         onPressed: () async {
//                                                                           aadharFront = await ChooseImage(ImageSource.gallery);
//                                                                           // _getFromGalleryFront();
//                                                                           setState(() {});
//                                                                           Navigator.pop(context);
//                                                                         },
//                                                                         child: const Text("PICK FROM GALLERY"),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ));
//                                                   },
//                                                   icon: const Icon(
//                                                     Icons.camera_alt_outlined,
//                                                     size: 50.0,
//                                                     color: Colors.black54,
//                                                   ),
//                                                 ),
//                                               )
//                                                   : Image.file(
//                                                 File(aadharFront!.path),
//                                                 fit: BoxFit.cover,
//                                               ))),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text(
//                                           "Front",
//                                           style: TextStyle(color: Colors.grey[900]),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     width: 100,
//                                   ),
//                                   Column(
//                                     children: [
//                                       Container(
//                                           width: 90,
//                                           height: 120,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius.circular(7),
//                                               border: Border.all(
//                                                   color: Colors.black, width: 3)),
//                                           child: Container(
//                                               child: aadharBack == null
//                                                   ? Container(
//                                                 child: IconButton(
//                                                   onPressed: () {
//                                                     showDialog(
//                                                         context: context,
//                                                         builder:
//                                                             (ctx) =>
//                                                             AlertDialog(
//                                                               actions: [
//                                                                 Center(
//                                                                   child:
//                                                                   Column(
//                                                                     children: [
//                                                                       ElevatedButton(
//                                                                         onPressed: () async {
//                                                                           aadharBack = await ChooseImage(ImageSource.camera);
//                                                                           setState(() {});
//                                                                           Navigator.pop(context);
//                                                                         },
//                                                                         child: const Text("PICK FROM CAMERA"),
//                                                                       ),
//                                                                       ElevatedButton(
//                                                                         onPressed: () async {
//                                                                           aadharBack = await ChooseImage(ImageSource.gallery);
//                                                                           setState(() {});
//                                                                           Navigator.pop(context);
//                                                                         },
//                                                                         child: const Text("PICK FROM GALLERY"),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ));
//                                                   },
//                                                   icon: const Icon(
//                                                     Icons.camera_alt_outlined,
//                                                     size: 50.0,
//                                                     color: Colors.black54,
//                                                   ),
//                                                 ),
//                                               )
//                                                   : Container(
//                                                 child: Image.file(
//                                                   File(aadharBack!.path),
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ))),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text(
//                                           "Back",
//                                           style: TextStyle(color: Colors.grey[900]),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         constraints:
//                         const BoxConstraints(minWidth: 200, maxWidth: 400),
//                         margin: EdgeInsets.only(
//                             top: _height * .07, bottom: _height * .030),
//                         height: 45,
//                         child: ElevatedButton(
//                             onPressed: () async {
//                               if (aadharFront == null ||
//                                   profileImage == null ||
//                                   aadharBack == null ||
//                                   licenceFront == null ||
//                                   licenceBack == null ||
//                                   demeritPointctr.text.isEmpty) {
//                                 print(UserId);
//                                } else {
//                                 await uploadDriverDetails();
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               shape: const StadiumBorder(),
//                               backgroundColor: const Color(0xff537de8),
//                             ),
//                             child: const Text(
//                               "Upload",
//                               style: TextStyle(fontSize: 20),
//                             )),
//                       )
//                     ],
//                   )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   uploadDriverDetails() async {
//     String demeritvalue = demeritPointctr.text;
//     if (demeritvalue[0] == "0") {
//       demeritvalue = demeritvalue.replaceFirst('0', '');
//       demeritvalue = demeritvalue.trim();
//       print("demerit-value : $demeritvalue");
//     }
//     var url = Uri.parse("http://139.84.133.106:8080/trucklah/api/driver");
//     var request = http.MultipartRequest('POST', url);
//
//     request.files.add(await http.MultipartFile.fromPath(
//         'driverPhoto', profileImage!.path,
//         contentType: MediaType("image", "jpg")));
//     request.files.add(await http.MultipartFile.fromPath(
//         'aadharFront', aadharFront!.path,
//         contentType: MediaType("image", "jpg")));
//     request.files.add(await http.MultipartFile.fromPath(
//         'aadharBack', aadharBack!.path,
//         contentType: MediaType("image", "jpg")));
//     request.files.add(await http.MultipartFile.fromPath(
//         'drivingLicFront', licenceFront!.path,
//         contentType: MediaType("image", "jpg")));
//     request.files.add(await http.MultipartFile.fromPath(
//         'drivingLicBack', licenceBack!.path,
//         contentType: MediaType("image", "jpg")));
//     request.files.add(await http.MultipartFile.fromString('userId', UserId!,
//         contentType: MediaType("application", "json")));
//     request.files.add(await http.MultipartFile.fromString(
//         'demeritPoint', demeritvalue,
//         contentType: MediaType("application", "json")));
//     print(demeritPointctr.text);
//     var response = await request.send();
//     print(response.statusCode);
//     var responseVal = await http.Response.fromStream(response);
//     print("Body : ${responseVal.body}");
//
//     print(responseVal.statusCode);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//
//       var result = jsonDecode(responseVal.body);
//       print("Result : $result");
//        var driverId = result["entityResponse"]["driverId"];
//        print("driverId : $driverId");
//       print(driverId);
//
//       setState(() {});
//      }
//   }
// }
