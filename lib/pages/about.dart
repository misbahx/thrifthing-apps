import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/Blocs/Authentication/bloc/login_bloc.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Thrifthing'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'images/logo-v2.png',
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tentang Thrifthing',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Thrifthing adalah aplikasi belanja mode terkini yang menghadirkan pengalaman belanja yang seru dan terjangkau. '
              'Dengan koleksi terbaru, pencarian cepat, dan promo menarik, kami membawa konsep thrifting modern ke ujung jari Anda.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Temukan fashion statement Anda sendiri dengan Thrifthing. Download aplikasi sekarang dan mulai petualangan belanja Anda yang seru dan terjangkau!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
