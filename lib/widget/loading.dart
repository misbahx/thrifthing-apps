import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0F172A),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
