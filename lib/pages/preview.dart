import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdf_gen/helper/pdf_helper.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 55, 143),
        title: Text('CHILDREN DEFAULTER', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.share,color: Colors.white,),
            onPressed: () async {
              final pdfBytes = await pdfBuilder();
              await Printing.sharePdf(bytes: pdfBytes, filename: 'defaulters_list.pdf');
            },
          ),
          Icon(Icons.more_vert,color: Colors.white,),
        ],
      ),
      body: InteractiveViewer(
        panEnabled: false,
        boundaryMargin: const EdgeInsets.all(0),
        minScale: 0.5,
        maxScale: 4,
        child: PdfPreview(
          allowPrinting: false,
          allowSharing: false,
          canChangePageFormat: false,
          canDebug: false,
          canChangeOrientation: false,
          loadingWidget: const CupertinoActivityIndicator(),
          build: (context) => pdfBuilder(),
        ),
      ),
    );
  }
}

















