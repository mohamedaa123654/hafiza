// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// class PDFViewer extends StatefulWidget {
//   final String path;
//   final int startPage;
//   final int endPage;

//   PDFViewer(
//       {required this.path, required this.startPage, required this.endPage});

//   @override
//   _PDFViewerState createState() => _PDFViewerState();
// }

// class _PDFViewerState extends State<PDFViewer> {
//   PDFViewController? _pdfController;
//   bool _isLoading = true;
//   String _errorMessage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: Stack(
//         children: [
//           PDFView(
//             filePath: 'assets/db/quran.pdf',
//             autoSpacing: true,
//             enableSwipe: true,
//             pageSnap: true,
//             swipeHorizontal: true,
//             onError: (error) {
//               setState(() {
//                 _errorMessage = error.toString();
//                 _isLoading = false;
//               });
//             },
//             onViewCreated: (PDFViewController pdfController) {
//               setState(() {
//                 _pdfController = pdfController;
//               });
//               _showPages();
//             },
//           ),
//           if (_isLoading)
//             Center(
//               child: CircularProgressIndicator(),
//             ),
//           if (_errorMessage.isNotEmpty)
//             Center(
//               child: Text(_errorMessage),
//             ),
//         ],
//       ),
//     );
//   }

//   void _showPages() async {
//     if (_pdfController == null) {
//       print('PDF controller is null');
//       return;
//     }

//     int? pageCount = await _pdfController!.getPageCount();
//     if (pageCount == null) {
//       print('Page count is null');
//       return;
//     }

//     if (widget.startPage >= 1 &&
//         widget.startPage <= pageCount &&
//         widget.endPage >= widget.startPage &&
//         widget.endPage <= pageCount) {
//       for (int i = widget.startPage - 1; i < widget.endPage; i++) {
//         _pdfController!.setPage(i);
//       }
//     } else {
//       print('Invalid page range');
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }
// }
