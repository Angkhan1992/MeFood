import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../provider/delivery/status_provider.dart';
import '../../../util/app_config.dart';
import '../../../widget/page/permission_error.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<StatusProvider>(
          builder: (context, model, child) {
            if (!model.isEnabledLocationService()) {
              return PermissionErrorPage(type: PermissionType.unsupported);
            }
            if (!model.isGrantedLocationPermission()) {
              return PermissionErrorPage(type: PermissionType.location);
            }
            return GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  model.getCurrentLcoation()!.latitude!,
                  model.getCurrentLcoation()!.longitude!,
                ),
                zoom: CAMERA_ZOOM,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set<Marker>.of(model.getMarkers().values),
            );
          },
        ),
      ],
    );
  }
}
