import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;

Future<Uint8List> pdfBuilder() async {
  final pdf = pw.Document();
  final imageLogo = pw.MemoryImage(
    (await rootBundle.load('assets/logo.png')).buffer.asUint8List(),
  );

  final List<List<String>> data = [
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
        ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123120", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    ["20223123121", "Arabia Karwan", "", "03/03/2024", "", "PENTA", "24/05/2024", "24/05/2024", "DEFAULTED", "", "Charsadda Khas", "Charsadda Khas"],
    // Add your data here
  ];

  final double rowsPerPage = 12;
  final int totalPages = (data.length / rowsPerPage).ceil();

  for (int pageIndex = 0; pageIndex < totalPages; pageIndex++) {
    final int startIdx = pageIndex * rowsPerPage.toInt();
    final int endIdx = (startIdx + rowsPerPage.toInt()) < data.length ? (startIdx + rowsPerPage.toInt()) : data.length;
    final List<List<String>> chunk = data.sublist(startIdx, endIdx);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: pw.EdgeInsets.all(14),
        build: (context) {
          return [
            pw.Column(
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Row(
                      children: [
                        pw.SizedBox(width: 30, height: 30, child: pw.Image(imageLogo)),
                        pw.SizedBox(width: 10),
                        pw.Text('DEFAULTERS LIST', style: pw.TextStyle(fontSize: 12)),
                      ],
                    ),
                    pw.SizedBox(height: 40, width: 40, child: pw.Image(imageLogo)),
                  ],
                ),
                pw.SizedBox(height: 20),
                _buildTable(chunk),
              ],
            ),
          ];
        },
        footer: (context) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.Text('Page ${context.pageNumber} of $totalPages', style: pw.TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }

  return pdf.save();
}

pw.Widget _buildTable(List<List<String>> data) {
  const tableHeaders = [
    'EPI No Identifier',
    'Name',
    'Father\'s Name',
    'DOB',
    'Phone/Number/Address',
    'Defaulted Vaccine',
    'Defaulted Due Date',
    'Defaulted Date',
    'Status',
    'Vaccinated On',
    'Enrollment Center/Enrolled Vaccinator',
    'Last Visited Center',
  ];

  return pw.Table.fromTextArray(
    headers: tableHeaders,
    data: data,
    border: pw.TableBorder.all(color: PdfColors.black),
    headerStyle: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
    cellStyle: pw.TextStyle(fontSize: 10),
    headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
    cellHeight: 20,
    columnWidths: {
      0: pw.FlexColumnWidth(2.0),
      1: pw.FlexColumnWidth(1.0),
      2: pw.FlexColumnWidth(1.0),
      3: pw.FlexColumnWidth(1.0),
      4: pw.FlexColumnWidth(1.0),
      5: pw.FlexColumnWidth(1.0),
      6: pw.FlexColumnWidth(1.0),
      7: pw.FlexColumnWidth(1.0),
      8: pw.FlexColumnWidth(1.0),
      9: pw.FlexColumnWidth(1.0),
      10: pw.FlexColumnWidth(1.0),
      11: pw.FlexColumnWidth(1.0),
    },
  );
}