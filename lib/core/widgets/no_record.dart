import 'package:flutter/material.dart';

class NoRecordWidget extends StatelessWidget {
  final String message;
  final String image;
  const NoRecordWidget({
    super.key,
    this.image = 'assets/nocontent.png',
    this.message = 'Kayıt Bulunamadı.',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 110,
          ),
          const SizedBox(height: 20),
          Text(
            message,
          ),
        ],
      ),
    );
  }
}
