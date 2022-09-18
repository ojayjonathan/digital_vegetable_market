import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:market/data/models/order/order.dart';
import 'package:market/data/services/address.dart';
import 'package:market/data/services/service.dart';
import 'package:market/utils/utils.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:market/utils/utils.dart';

part 'timeline_widgets.dart';

class OrderItemTrackingPage extends StatefulWidget {
  const OrderItemTrackingPage(
      {Key? key, required this.order, required this.item})
      : super(key: key);
  final Order order;
  final OrderItem item;
  @override
  State<OrderItemTrackingPage> createState() => _OrderItemTrackingPageState();
}

class _OrderItemTrackingPageState extends State<OrderItemTrackingPage> {
  List<Marker> markers = [];
  List<Polyline> polylinePoints = [];
  final initialCameraPosition = const CameraPosition(
    target: LatLng(-0.36932651926935073, 35.9313568419356),
    zoom: 10.0,
  );
  late CameraUpdate _cameraUpdate;
  @override
  void initState() {
    final a1 = widget.item.product.address;
    final a2 = widget.order.address;
    markers = [
      Marker(
        markerId: MarkerId(
          randomString(10),
        ),
        infoWindow: const InfoWindow(
          title: "Pickup",
        ),
        position: LatLng(a1.latitude, a1.longitude),
      ),
      Marker(
        markerId: MarkerId(
          randomString(10),
        ),
        infoWindow: const InfoWindow(
          title: "DropOff",
        ),
        position: LatLng(a2.latitude, a2.longitude),
      ),
    ];
    _cameraUpdate = CameraUpdate.newLatLngBounds(
      latLngBounds(
        LatLng(a1.latitude, a1.longitude),
        LatLng(a2.latitude, a2.longitude),
      ),
      50.0,
    );
    initPolyLine();
    super.initState();
  }

  initPolyLine() async {
    final a1 = widget.item.product.address;
    final a2 = widget.order.address;
    final res = await service<AddressProvider>().polyline(
      LatLng(a1.latitude, a1.latitude),
      LatLng(a2.latitude, a2.latitude),
    );
    res.when(
      onError: (error) {},
      onSuccess: (data) {
        setState(() {
          polylinePoints = data;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SlidingUpPanel(
        body: GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          tiltGesturesEnabled: true,
          myLocationButtonEnabled: false,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer(),
            ),
          },
          onMapCreated: (GoogleMapController controller) {
            controller.animateCamera(_cameraUpdate);
          },
          initialCameraPosition: initialCameraPosition,
          markers: Set.from(markers),
          polylines: Set.from(polylinePoints),
        ),
        panel: _SlideUpPannel(
          widget.order.detail
              .where(
                (detail) =>
                    detail.orderItemId == null ||
                    detail.orderItemId == widget.item.id,
              )
              .toList(),
        ),
      ),
    );
  }
}

class _SlideUpPannel extends StatelessWidget {
  const _SlideUpPannel(this.details, {Key? key}) : super(key: key);
  final List<OrderDetail> details;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white),
      child: Wrap(
        // shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ),
          ...details.map(
            (detail) => TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              isFirst: true,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Color(0xFF27AA69),
                padding: EdgeInsets.all(6),
              ),
              endChild: _RightChild(
                asset: "assets/hint.png",
                title: detail.createdAt.format,
                message: detail.message,
              ),
              beforeLineStyle: const LineStyle(
                color: Color(0xFF27AA69),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
