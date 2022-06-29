import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:mefood/extension/extension.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/provider/base/order_provider.dart';
import 'package:mefood/provider/customer/customer.dart';
import 'package:mefood/service/service.dart';
import 'package:mefood/themes/theme.dart';
import 'package:mefood/util/util.dart';
import 'package:mefood/widget/base/base.dart';

class ConfirmOrder extends StatefulWidget {
  ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  var scorllController = ScrollController();

  List<RestaurantModel> restaurants = [];
  OrderProvider? provider;
  LocationService? locationService;
  LocationModel? locationModel;

  GoogleMapController? mapController;
  List<Polyline> polyline = [];
  List<Marker> markersList = [];
  LatLngBounds? bounds;
  AddressModel? address;
  List<MeMarker> restMarkers = [];
  List<AddressModel> addresses = [];

  @override
  void initState() {
    super.initState();
  }

  void onCreateGoogleMap(GoogleMapController controller) async {
    mapController = controller;
    fetchData();
  }

  void fetchData() async {
    locationService = LocationService.of(context);
    var err = await locationService!.initService();
    if (err != null) {
      Navigator.of(context).pop(err);
      return;
    }
    provider = context.read<OrderProvider>();

    restMarkers.clear();
    for (var product in provider!.products!) {
      var isContained = false;
      for (var restaurant in restaurants) {
        if (restaurant.id == product.product!.restaurant!.id) {
          isContained = true;
          break;
        }
      }
      if (!isContained) {
        restaurants.add(product.product!.restaurant!);

        var url = '$kDomain${product.product!.restaurant!.logo}';
        var markerKey = GlobalKey(debugLabel: url);
        var bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
            .buffer
            .asUint8List();

        var restMarker = MeMarker(key: markerKey, bytes: bytes);
        restMarkers.add(restMarker);
      }
    }
    setState(() {});

    addresses = await PrefService.of().getDeliveryAddresses();
    if (addresses.isEmpty) {
      var customer = context.read<CustomerProvider>().customer;
      address = customer!.address;
      addresses.add(address!.copyWith());
      await PrefService.of().setDeliveryAddresses(addresses);
    } else {
      address = addresses.first;
    }

    initRouter();
  }

  void initRouter() async {
    if (address != null) {
      locationModel = await ELocation.fromAddress(
        context,
        address: address!,
        restaurants: restaurants,
      );

      if (locationModel != null) {
        bounds = locationModel!.bounds;
        polyline = locationModel!.polyLine;

        markersList.clear();
        var marker = Marker(
          markerId: MarkerId('Customer'),
          infoWindow: InfoWindow(
            title: "Delivery",
          ),
          draggable: false,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: LatLng(
            double.parse(address!.lat!),
            double.parse(address!.lon!),
          ),
        );
        markersList.add(marker);

        for (var restaurant in restaurants) {
          var latlng = LatLng(
            double.parse(restaurant.address!.lat!),
            double.parse(restaurant.address!.lon!),
          );

          if (mounted) {
            var markerIcon = (await restMarkers[restaurants.indexOf(restaurant)]
                    .getMarkerIcon()) ??
                BitmapDescriptor.defaultMarker;
            var marker = Marker(
              markerId: MarkerId('${restaurant.id}'),
              anchor: const Offset(0.5, 0.5),
              infoWindow: InfoWindow(
                title: '${restaurant.name}',
              ),
              icon: markerIcon,
              draggable: false,
              position: latlng,
            );
            markersList.add(marker);
          }
        }
        mapController!
            .animateCamera(CameraUpdate.newLatLngBounds(bounds!, 16.0));
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context,
        title: 'Confirm Order',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: offsetBase,
          vertical: offsetXMd,
        ),
        child: Consumer<OrderProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Billing Address',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '${addresses.length} Addresses',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        var location =
                            await DialogService.of(context).locationPicker(
                          title: 'Add Address',
                          initPosition: [
                            locationService!.getCurrentLcoation()!.latitude!,
                            locationService!.getCurrentLcoation()!.longitude!,
                          ],
                        );

                        if (location != null) {
                          address!.lat = location.latitude.toString();
                          address!.lon = location.longitude.toString();

                          var addressInfos = await placemarkFromCoordinates(
                            location.latitude,
                            location.longitude,
                          );
                          logger.d(addressInfos.first);
                          address!.fromPlacemark(addressInfos.first);

                          addresses.add(address!.copyWith());
                          await PrefService.of()
                              .setDeliveryAddresses(addresses);
                          initRouter();
                        }
                      },
                      child: Text(
                        '+ Address',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: containerBorder(context),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (_, i) {
                      var address = addresses[i];
                      return Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                address = addresses[i];
                                initRouter();
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    address.fullAddress,
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  Text(
                                    '${address.lat} ${address.lat}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w200,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          InkWell(
                            onTap: () async {
                              addresses.removeAt(i);
                              await PrefService.of()
                                  .setDeliveryAddresses(addresses);
                              setState(() {});
                            },
                            child: Icon(
                              Icons.remove_circle,
                              size: 28.0,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (_, i) => Divider(),
                    itemCount: addresses.length,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Orders Detail',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '${provider.products!.length} Products',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      provider.getCurrency(),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                for (var restaurant in restaurants) ...{
                  restaurant.orderCell(
                    context,
                    provider: provider,
                  ),
                },
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Router Detail',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '${restaurants.length} Restaurants',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          locationModel == null
                              ? kEmptyPrice
                              : locationModel!.deliveryPrice.text!,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        Text(
                          locationModel == null
                              ? '$kEmptyDistance ($kEmptyDuration)'
                              : '${locationModel!.totalDistance.text} (${locationModel!.deliveryDuration.text})',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w200,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    padding: const EdgeInsets.all(1.0),
                    decoration: containerBorder(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11.0),
                      child: Stack(
                        children: [
                          for (var marker in restMarkers) ...{
                            marker,
                          },
                          GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(defaultLatitude, defaultLongitude),
                              zoom: CAMERA_ZOOM,
                            ),
                            onMapCreated: onCreateGoogleMap,
                            markers: Set.from(markersList),
                            polylines: Set.from(polyline),
                            rotateGesturesEnabled: false,
                            zoomControlsEnabled: false,
                            zoomGesturesEnabled: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: offsetXMd),
                CustomFillButton(title: 'Confirm'),
              ],
            );
          },
        ),
      ),
    );
  }
}
