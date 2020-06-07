/*
 * Copyright (C) 2020, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:barcode_widget/barcode_widget.dart';
import 'package:example/settings.dart';
import 'package:flutter/material.dart';

class BarcodeInfo extends StatelessWidget {
  BarcodeInfo({
    Key key,
    @required this.conf,
  }) : super(key: key);

  final BarcodeConf conf;

  @override
  Widget build(BuildContext context) {
    final bc = Barcode.fromType(conf.type);

    final charset = StringBuffer();
    for (var c in bc.charSet) {
      if (c > 0x20) {
        charset.write(String.fromCharCode(c) + ' ');
      } else {
        charset.write('0x' + c.toRadixString(16) + ' ');
      }
    }

    var desc = '';
    switch (conf.type) {
      case BarcodeType.CodeITF14:
        desc =
            'ITF-14 is the GS1 implementation of an Interleaved 2 of 5 (ITF) bar code to encode a Global Trade Item Number. ITF-14 symbols are generally used on packaging levels of a product, such as a case box of 24 cans of soup. The ITF-14 will always encode 14 digits.';
        break;
      case BarcodeType.CodeEAN13:
        desc =
            'The International Article Number is a standard describing a barcode symbology and numbering system used in global trade to identify a specific retail product type, in a specific packaging configuration, from a specific manufacturer.';
        break;
      case BarcodeType.CodeEAN8:
        desc =
            'An EAN-8 is an EAN/UPC symbology barcode and is derived from the longer International Article Number code. It was introduced for use on small packages where an EAN-13 barcode would be too large; for example on cigarettes, pencils, and chewing gum packets. It is encoded identically to the 12 digits of the UPC-A barcode, except that it has 4 digits in each of the left and right halves.';
        break;
      case BarcodeType.CodeEAN5:
        desc =
            'The EAN-5 is a 5-digit European Article Number code, and is a supplement to the EAN-13 barcode used on books. It is used to give a suggestion for the price of the book.';
        break;
      case BarcodeType.CodeEAN2:
        desc =
            'The EAN-2 is a supplement to the EAN-13 and UPC-A barcodes. It is often used on magazines and periodicals to indicate an issue number.';
        break;
      case BarcodeType.CodeISBN:
        desc =
            'The International Standard Book Number is a numeric commercial book identifier which is intended to be unique. Publishers purchase ISBNs from an affiliate of the International ISBN Agency.';
        break;
      case BarcodeType.Code39:
        desc =
            'The Code 39 specification defines 43 characters, consisting of uppercase letters (A through Z), numeric digits (0 through 9) and a number of special characters (-, ., \$, /, +, %, and space). An additional character (denoted \'*\') is used for both start and stop delimiters.';
        break;
      case BarcodeType.Code93:
        desc =
            'Code 93 is a barcode symbology designed in 1982 by Intermec to provide a higher density and data security enhancement to Code 39. It is an alphanumeric, variable length symbology. Code 93 is used primarily by Canada Post to encode supplementary delivery information.';
        break;
      case BarcodeType.CodeUPCA:
        desc =
            'The Universal Product Code is a barcode symbology that is widely used in the United States, Canada, Europe, Australia, New Zealand, and other countries for tracking trade items in stores. UPC consists of 12 numeric digits that are uniquely assigned to each trade item.';
        break;
      case BarcodeType.CodeUPCE:
        desc =
            'The Universal Product Code is a barcode symbology that is widely used in the United States, Canada, Europe, Australia, New Zealand, and other countries for tracking trade items in stores. To allow the use of UPC barcodes on smaller packages, where a full 12-digit barcode may not fit, a zero-suppressed version of UPC was developed, called UPC-E, in which the number system digit, all trailing zeros in the manufacturer code, and all leading zeros in the product code, are suppressed';
        break;
      case BarcodeType.Code128:
        desc =
            'Code 128 is a high-density linear barcode symbology defined in ISO/IEC 15417:2007. It is used for alphanumeric or numeric-only barcodes. It can encode all 128 characters of ASCII and, by use of an extension symbol, the Latin-1 characters defined in ISO/IEC 8859-1.';
        break;
      case BarcodeType.GS128:
        desc =
            'The GS1-128 is an application standard of the GS1. It uses a series of Application Identifiers to include additional data such as best before dates, batch numbers, quantities, weights and many other attributes needed by the user.';
        break;
      case BarcodeType.Telepen:
        desc =
            'Telepen is a barcode designed in 1972 in the UK to express all 128 ASCII characters without using shift characters for code switching, and using only two different widths for bars and spaces.';
        break;
      case BarcodeType.Codabar:
        desc =
            'Codabar was designed to be accurately read even when printed on dot-matrix printers for multi-part forms such as FedEx airbills and blood bank forms, where variants are still in use as of 2007.';
        break;
      case BarcodeType.Rm4scc:
        desc =
            'The RM4SCC is used for the Royal Mail Cleanmail service. It enables UK postcodes as well as Delivery Point Suffixes (DPSs) to be easily read by a machine at high speed.';
        break;
      case BarcodeType.QrCode:
        desc =
            'QR code (abbreviated from Quick Response code) is the trademark for a type of matrix barcode (or two-dimensional barcode) first designed in 1994 for the automotive industry in Japan.';
        break;
      case BarcodeType.PDF417:
        desc =
            'PDF417 is a stacked linear barcode format used in a variety of applications such as transport, identification cards, and inventory management.';
        break;
      case BarcodeType.DataMatrix:
        desc =
            'A Data Matrix is a two-dimensional barcode consisting of black and white "cells" or modules arranged in either a square or rectangular pattern, also known as a matrix.';
        break;
      case BarcodeType.Aztec:
        desc =
            'Named after the resemblance of the central finder pattern to an Aztec pyramid.';
        break;
    }

    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${bc.name}\n',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const TextSpan(
                  text: '\nDescription:\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextSpan(
                  text: '$desc\n',
                ),
                const TextSpan(
                  text: '\nAccepted data:\n',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextSpan(
                  text: '$charset\n\n',
                ),
                TextSpan(
                  text: 'Minimum length: ${bc.minLength}\n',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                // if (bc.maxLength < Barcode.infiniteMaxLength)
                TextSpan(
                  text: 'Maximum length: ${bc.maxLength}\n',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}