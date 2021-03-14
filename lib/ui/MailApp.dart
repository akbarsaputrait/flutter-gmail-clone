import 'package:flutter/material.dart';
import 'package:gmail_clone_app/ui/FloatAppBar.dart';
import 'package:gmail_clone_app/ui/ListItem.dart';
import 'package:gmail_clone_app/utils/Email.dart';

class MailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Email> emails = [
      Email(
        name: 'Google Analytics',
        title: 'Aktifkan ulang dan terhubung kembali dengan kredit iklan senilai Rp675000',
        description: 'Google dapat membantu menyiapkan iklan Anda. Mulai »',
        time: '24 Feb',
        color: Colors.purple,
        starred: true,
      ),
      Email(
        name: 'Shopee',
        title: '[Shopee] Selamat! Transaksi tagihan PLN Anda BERHASIL untuk Order ID [2614666508011xxxxxx]',
        description: 'Hi akbaranungyudhasaputra, Terima kasih telah berbelanja di Shopee. Transaksi Anda telah berhasil dengan nomor order - 2614666508011xxxxxx.',
        time: '4 Mar',
        color: Colors.orange,
        starred: false,
      ),
      Email(
        name: 'Quora Digest',
        title: 'How much RAM would you need to store the full name of every person on Earth?',
        description: 'Answer: The Earth population is 7.53 billion at the momment. You have to start with some assumptions:',
        time: '4 Mar',
        color: Colors.red,
        starred: false,
      ),
    ];

    return Stack(
      children: [
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 70),
          child: ListView(
            children: <Widget>[
              for (var email in emails)
                ListItem(email: email),
              // Container(height: 15),
            ],
          ),
        ),
        MailFloatAppBar(),
      ],
    );
  }
}
