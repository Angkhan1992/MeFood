import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PermissionErrorPage extends StatelessWidget {
  final PermissionType type;

  const PermissionErrorPage({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imagePath = '';
    var desc = '';
    if (type == PermissionType.location) {
      imagePath = 'assets/icons/ic_distance.svg';
      desc =
          'The location permission was not granted. Please set that on mobile setting and try again.';
    }
    if (type == PermissionType.unsupported) {
      imagePath = 'assets/icons/ic_distance.svg';
      desc =
          'You can\'t user MeFood on your devicce, The location service was not supported on your device. Sorry, Please try that again on other devices(Google Map Supported).';
    }
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                imagePath,
                width: 60.0,
                height: 60.0,
                color: Colors.red,
              ),
              const SizedBox(
                height: 48.0,
              ),
              Text(
                desc,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum PermissionType {
  unsupported,
  location,
  storage,
}
