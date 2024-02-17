import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F172A),
      appBar: AppBar(
        title: Text(
          'About Thrifthing',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xff0F172A),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tentang Infinite Thrifthing',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Infinite Thrifthing adalah aplikasi belanja mode terkini yang menghadirkan pengalaman belanja yang seru dan terjangkau. '
              'Dengan koleksi terbaru, pencarian cepat, dan promo menarik, kami membawa konsep thrifting modern ke ujung jari Anda.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Temukan fashion statement Anda sendiri dengan Infinite Thrifthing. Download aplikasi sekarang dan mulai petualangan belanja Anda yang seru dan terjangkau!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
