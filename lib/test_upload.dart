// import 'dart:html' as html;
// import 'dart:typed_data';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:async'; // Import 'dart:async' for Completer
// import 'dart:js' as js;
// import 'package:flutter/material.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:http/http.dart' as http;
// import 'package:graphql/client.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:mime/mime.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Upload Demo',
//       home: ImageUploadScreen(),
//     );
//   }
// }
//
// class ImageUploadScreen extends StatefulWidget {
//   @override
//   _ImageUploadScreenState createState() => _ImageUploadScreenState();
// }
//
// class _ImageUploadScreenState extends State<ImageUploadScreen> {
//   html.File? _selectedImage;
//   html.FileReader fileReader = html.FileReader();
//
//   Future<void> _pickImage() async {
//     print("image picked");
//     final html.FileUploadInputElement input = html.FileUploadInputElement()..accept = 'image/*';
//     input.click();
//
//     await input.onChange.first;
//
//     if (input.files!.isNotEmpty) {
//       final html.File file = input.files!.first;
//
//       fileReader.readAsDataUrl(file);
//       await fileReader.onLoad.first;
//
//       setState(() {
//         _selectedImage = file;
//       });
//
//       // You can choose to compress the image immediately after picking
//       // compressImage(_selectedImage);
//     }
//   }
//
//   Future<void> compressImage(html.File? imgFile) async {
//     if (imgFile == null) {
//       print("Image file is null");
//       return;
//     }
//
//     // Read the bytes from the HTML file
//     Uint8List fileBytes = await _readAsArrayBuffer(imgFile);
//
//     // Compress the image using FlutterImageCompress
//     List<int> compressedBytes = await FlutterImageCompress.compressWithList(
//       fileBytes,
//       quality: 5,
//     );
//
//     // Create a new File in dart:io
//     File compressedFile = File('${imgFile.name}_compressed.jpg');
//     await compressedFile.writeAsBytes(compressedBytes);
//
//     print("Original Image length: ${fileBytes.lengthInBytes} bytes");
//     print("Compressed Image length: ${compressedFile.lengthSync()} bytes");
//   }
//
//   Future<Uint8List> _readAsArrayBuffer(html.File blob) async {
//     final completer = Completer<Uint8List>();
//
//     fileReader.onLoad.first.then((_) {
//       List<int> result = fileReader.result as List<int>;
//       completer.complete(Uint8List.fromList(result));
//     });
//
//     fileReader.onError.first.then((event) {
//       completer.completeError("Error reading ArrayBuffer from Blob: $event");
//     });
//
//     fileReader.readAsArrayBuffer(blob);
//
//     await fileReader.onLoad.first;
//
//     return completer.future;
//   }
//
//   Future<void> _uploadImage() async {
//     if (_selectedImage == null) {
//       print('No image selected');
//       return;
//     }
//
//     final http.Client client = http.Client();
//     final Link httpLink = HttpLink('http://localhost:4000/graphql', httpClient: client);
//
//     final GraphQLClient graphqlClient = GraphQLClient(
//       link: httpLink,
//       cache: GraphQLCache(),
//     );
//
//     final String fileName = _selectedImage!.name!;
//     final String mimeType = lookupMimeType(fileName) ?? 'application/octet-stream';
//
//     final http.MultipartRequest request = http.MultipartRequest(
//       'POST',
//       Uri.parse('http://localhost:4000/graphql'),
//     );
//
//     request.headers['Content-Type'] = 'multipart/form-data';
//
//     request.fields['operations'] = jsonEncode({
//       'query': 'mutation EditUserProfilePic(\$userId: String!, \$profilePicture: Upload!) { '
//           'editUserProfilePic(userId: \$userId, profilePicture: \$profilePicture) { id, profilePicture }'
//           '}',
//       'variables': {
//         'userId': 'AA0003', // Replace with your user ID
//         'profilePicture': null,
//       },
//     });
//     final Uint8List imageBytes = await _readAsArrayBuffer(_selectedImage!);
//
// // Attach the image file
//     request.files.add(http.MultipartFile.fromBytes(
//       'map',
//       imageBytes,
//       filename: fileName,
//         contentType: MediaType.parse(mimeType),
//     ));
//
//
//     try {
//       final http.Response response = await http.Response.fromStream(await request.send());
//       print('Response: ${response.statusCode}\n${response.body}');
//     } catch (error) {
//       print('Error: $error');
//     } finally {
//       client.close();
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Upload Demo'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // if (_selectedImage != null)
//           //   FutureBuilder<Uint8List>(
//           //     future: _readAsArrayBuffer(_selectedImage!),
//           //     builder: (context, snapshot) {
//           //       if (snapshot.connectionState == ConnectionState.done) {
//           //         return Image.memory(snapshot.data!);
//           //       } else {
//           //         return Text('Loading...');
//           //       }
//           //     },
//           //   )
//           // else
//             Text('No image selected'),
//           ElevatedButton(
//             onPressed: _pickImage,
//             child: Text('Pick Image'),
//           ),
//           ElevatedButton(
//             onPressed: _uploadImage,
//             child: Text('Upload Image'),
//           ),
//         ],
//       ),
//     );
//   }
//
//  }
