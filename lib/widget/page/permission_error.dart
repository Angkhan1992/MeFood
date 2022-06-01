import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mefood/generated/l10n.dart';

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
      desc = S.current.err_location;
    }
    if (type == PermissionType.unsupported) {
      imagePath = 'assets/icons/ic_distance.svg';
      desc = S.current.err_location_desc;
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
