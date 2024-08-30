import 'package:invoice/header_files.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  Future<Uint8List> getpdf() async {
    pw.Document pdf = pw.Document();

    for (var e in item) {
      PersonalGlobal.total += int.parse(e.itemQty) * int.parse(e.itemPrice);
    }

    var network = await networkImage(
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a3,
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Row(
              children: [
                pw.Container(
                  height: 200,
                  width: 200,
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey,
                    shape: pw.BoxShape.circle,
                    image: pw.DecorationImage(
                      image: (PersonalGlobal.image != null)
                          ? pw.MemoryImage(
                              PersonalGlobal.image!.readAsBytesSync(),
                            )
                          : network,
                    ),
                  ),
                ),
                pw.SizedBox(
                  width: 30,
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      PersonalGlobal.companyname,
                      style: const pw.TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    pw.Text(
                      PersonalGlobal.companyphone,
                      style: const pw.TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    pw.Text(
                      PersonalGlobal.companyemail,
                      style: const pw.TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Divider(),
            pw.SizedBox(
              height: 20,
            ),
            pw.Row(
              children: [
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "BILL TO",
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Align(
                      alignment: const pw.Alignment(-0.9, 0),
                      child: pw.Text(
                        PersonalGlobal.name,
                        style: const pw.TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    pw.Align(
                      alignment: const pw.Alignment(-0.9, 0),
                      child: pw.Text(
                        PersonalGlobal.phone,
                        style: const pw.TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    pw.Align(
                      alignment: const pw.Alignment(-0.9, 0),
                      child: pw.Text(
                        PersonalGlobal.emailAddress,
                        style: const pw.TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(
                  width: 120,
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "INVOICE #",
                      style: pw.TextStyle(
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      "CREATION DATE",
                      style: pw.TextStyle(
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      "DUE DATE",
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(
                  width: 30,
                ),
                pw.Column(
                  children: [
                    pw.Text(
                      "INV00001",
                      style: const pw.TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    pw.Text(
                      "14/05/2024",
                      style: const pw.TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    pw.Text(
                      "18/05/2024",
                      style: const pw.TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Container(
              height: 50,
              width: double.infinity,
              decoration: pw.BoxDecoration(
                // color: PdfColors.black,
                border: pw.Border.all(),
                borderRadius: pw.BorderRadius.circular(8),
              ),
              child: pw.Row(
                children: [
                  pw.SizedBox(
                    width: 10,
                  ),
                  pw.Text(
                    "No.",
                    style: const pw.TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  pw.SizedBox(
                    width: 50,
                  ),
                  pw.Text(
                    "ITEMS NAME",
                    style: const pw.TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  pw.SizedBox(
                    width: 50,
                  ),
                  pw.Text(
                    "QTY ",
                    style: const pw.TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  pw.SizedBox(
                    width: 35,
                  ),
                  pw.Text(
                    "DISC",
                    style: const pw.TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  pw.SizedBox(
                    width: 35,
                  ),
                  pw.Text(
                    "TAX",
                    style: const pw.TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  pw.SizedBox(
                    width: 40,
                  ),
                  pw.Text(
                    "PRICE",
                    style: const pw.TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  pw.SizedBox(
                    width: 40,
                  ),
                  pw.Text(
                    "Total",
                    style: const pw.TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              children: [
                // No.
                pw.Container(
                  height: 350,
                  width: 60,
                  padding: const pw.EdgeInsets.only(top: 8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        item.length,
                        (index) => pw.Text(
                          "${index + 1}.\n\n",
                          style: const pw.TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  width: 20,
                ),
                // ITEMS NAME
                pw.Container(
                  height: 350,
                  width: 180,
                  padding: const pw.EdgeInsets.only(top: 8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        item.length,
                        (index) => pw.Text(
                          "${item[index].itemname}\n\n",
                          style: const pw.TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  width: 20,
                ),
                // QTY
                pw.Container(
                  height: 350,
                  width: 65,
                  padding: const pw.EdgeInsets.all(8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        item.length,
                        (index) => pw.Text(
                          "${item[index].itemQty}\n\n",
                          style: const pw.TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  width: 20,
                ),
                // PRICE
                pw.Container(
                  height: 350,
                  width: 66,
                  padding: const pw.EdgeInsets.only(top: 8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        item.length,
                        (index) => pw.Text(
                          "${item[index].discount}%\n\n",
                          style: const pw.TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                pw.SizedBox(
                  width: 20,
                ),
                pw.Container(
                  height: 350,
                  width: 70,
                  padding: const pw.EdgeInsets.only(top: 8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        item.length,
                        (index) => pw.Text(
                          "${item[index].taxrate}%\n\n",
                          style: const pw.TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  width: 20,
                ),
                pw.Container(
                  height: 350,
                  width: 70,
                  padding: const pw.EdgeInsets.only(top: 8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        item.length,
                        (index) => pw.Text(
                          "${item[index].itemPrice}\n\n",
                          style: const pw.TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  width: 20,
                ),
                // AMOUNT
                pw.Container(
                  height: 350,
                  width: 85,
                  padding: const pw.EdgeInsets.only(top: 8),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(8),
                    border: pw.Border.all(),
                  ),
                  child: pw.Column(
                    children: [
                      ...List.generate(
                        item.length,
                        (index) => pw.Text(
                          "${int.parse(item[index].itemQty) * int.parse(item[index].itemPrice)}\n\n",
                          style: const pw.TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(
              height: 20,
            ),
            // TOTAL
            pw.Container(
              height: 30,
              width: 250,
              alignment: pw.Alignment.center,
              decoration: pw.BoxDecoration(
                borderRadius: pw.BorderRadius.circular(8),
                border: pw.Border.all(),
              ),
              child: pw.Text(
                "Total : ${PersonalGlobal.total.toStringAsFixed(2)}",
                style: const pw.TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            (bytes != null)
                ? pw.Image(
                    pw.MemoryImage(bytes!),
                    width: 200,
                    height: 200,
                  )
                : pw.Container(),
          ],
        ),
      ),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pdf Page"),
        actions: [
          ElevatedButton(
            onPressed: () async {
              pdfsave = await getpdf();
            },
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: PdfPreview(
        build: (format) => getpdf(),
      ),
    );
  }
}
/*                  // bytes != null
                    //     ? pw.Container(
                    //         width: 200,
                    //         height: 200,
                    //         decoration: pw.BoxDecoration(
                    //           image: pw.DecorationImage(
                    //             image: pw.MemoryImage(bytes!),
                    //           ),
                    //         ),
                    //       )
                    //     : pw.Container(),

 */
