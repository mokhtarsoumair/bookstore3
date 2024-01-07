import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_downloader/flutter_downloader.dart';


class Book extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              // Add the photo here
              Image.asset(
                'assets/images/book1.jpg', // Replace with your actual image file path
                width: 300, // Adjust as needed
                height: 200, // Adjust as needed
                fit: BoxFit.cover, // Adjust as needed
              ),
              SizedBox(height: 20), // Add spacing between the photo and button
              ElevatedButton(
                onPressed: () async {
                  Uri parsedUrl = Uri.parse('https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/web-coding-book.pdf');
                  String fileName = parsedUrl.pathSegments.last;
                  await downloadFile(parsedUrl.toString(), fileName);
                },
                child: Text('Download and Open File'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> downloadFile(String url, String fileName) async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var dir;
      if (Platform.isIOS) {
        dir = await getLibraryDirectory();
      } else if (Platform.isAndroid) {
        dir = await getExternalStorageDirectory();
      } else {
        throw UnsupportedError("Unsupported platform");
      }
      var file = File('${dir!.path}/$fileName');
      await file.writeAsBytes(response.bodyBytes);
      await openFile(file.path);
    }
  }

  Future<void> openFile(String filePath) async {
    await OpenFile.open(filePath);
  }
}