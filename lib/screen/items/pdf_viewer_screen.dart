import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PdfViewerFromAsset extends StatefulWidget {
  final String pdfUrl;
  final String title;

  const PdfViewerFromAsset({
    super.key,
    required this.pdfUrl,
    required this.title,
  });

  @override
  _PdfViewerFromAssetState createState() => _PdfViewerFromAssetState();
}

class _PdfViewerFromAssetState extends State<PdfViewerFromAsset> {
  String localPath = "";

  @override
  void initState() {
    super.initState();
    loadPdfFromAsset();
  }

  Future<void> loadPdfFromAsset() async {
    final assetPath = widget.pdfUrl;
    try {
      final byteData = await DefaultAssetBundle.of(context).load(assetPath);
      final file = File('${(await getTemporaryDirectory()).path}/temp.pdf');
      await file.writeAsBytes(byteData.buffer.asUint8List());
      setState(() {
        localPath = file.path;
      });
    } catch (e) {
      debugPrint("Error loading PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (localPath.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: PDFView(
        filePath: localPath,
        enableSwipe: true,
        swipeHorizontal: true,
      ),
    );
  }
}
