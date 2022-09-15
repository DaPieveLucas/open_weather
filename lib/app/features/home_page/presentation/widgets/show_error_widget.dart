import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowErrorWidget extends StatelessWidget {
  const ShowErrorWidget({required this.errorMessage, super.key});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/error_image.svg',
            height: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            errorMessage,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
