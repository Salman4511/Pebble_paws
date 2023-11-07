import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:url_launcher/url_launcher.dart';
class MyPdfViewer extends StatefulWidget {
  final String pdfPath;
  MyPdfViewer({required this.pdfPath});
  @override
  _MyPdfViewerState createState() => _MyPdfViewerState();
}
class _MyPdfViewerState extends State<MyPdfViewer> {
DateTime selectedDate = DateTime.now();
  final Uri _url = Uri.parse('https://drive.google.com/file/d/1fN2zouU1g7Z6uruR9Zq6s85HRAY3kOrx/view?usp=sharing');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back_ios,color: Colors.white , )),
        title: Text("Diet Plan ",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        child:SfPdfViewer.asset('assets/documents/Pet Diet Chart.pdf')
        
//         TextButton(onPressed: (){
// // _launchUrl();
// // _selectDate(context);
//         }, child: Text("Dog Diet"))
        
      //    PDFView(
      //     filePath: widget.pdfPath,
      //     autoSpacing: true,
      //     enableSwipe: true,
      //     pageSnap: true,
      //     swipeHorizontal: true,
      //     onError: (error) {
      //       print(error);
      //     },
      //     onPageError: (page, error) {
      //       print('$page: ${error.toString()}');
      //     },
      //     onViewCreated: (PDFViewController vc) {
      //       pdfViewController = vc;
      //     },
          
      //   ),
      // ),
    ));
  }
  Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

}