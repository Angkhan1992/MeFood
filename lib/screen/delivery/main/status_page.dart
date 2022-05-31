import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mefood/provider/delivery/delivery_provider.dart';
import 'package:mefood/util/app_config.dart';
import 'package:mefood/widget/page/permission_error.dart';

class StatusPage extends StatefulWidget {
  final DeliveryProvider provider;

  const StatusPage({
    Key? key,
    required this.provider,
  }) : super(key: key);

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
    if (!widget.provider.isEnabledLocationService()) {
      return PermissionErrorPage(type: PermissionType.unsupported);
    }
    if (!widget.provider.isGrantedLocationPermission()) {
      return PermissionErrorPage(type: PermissionType.location);
    }
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.provider.getCurrentLcoation()!.latitude!,
              widget.provider.getCurrentLcoation()!.longitude!,
            ),
            zoom: CAMERA_ZOOM,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(widget.provider.getMarkers().values),
        ),
      ],
    );
  }
}
