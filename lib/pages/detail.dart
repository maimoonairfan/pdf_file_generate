import 'package:flutter/material.dart';
import 'package:flutter_pdf_gen/pages/preview.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fab(context),
    );
  }
  
  // Floating Action Button
  Widget _fab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PdfPreviewPage()),
        );
      },
      child: const Icon(Icons.picture_as_pdf),
    );
  }
}
