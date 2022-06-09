import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mefood/generated/l10n.dart';

class NetworkErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/ic_wifi.svg',
                width: 60.0,
                height: 60.0,
                color: Colors.red,
              ),
              const SizedBox(
                height: 48.0,
              ),
              Text(
                S.current.err_network_desc,
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
