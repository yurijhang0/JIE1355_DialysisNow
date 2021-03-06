import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fryo/src/screens/MainInfoScreen.dart';
import 'package:fryo/src/services/ApplicationBloc.dart';
import 'package:fryo/src/services/DialysisInfo.dart';
import 'package:fryo/src/services/MarkerService.dart';
import 'package:fryo/src/shared/colors.dart';
import 'package:fryo/src/shared/fryo_icons.dart';
import 'package:fryo/src/shared/styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _selectedIndex = 0; // edit later when connecting the screens

  // controller for Google Maps
  Completer<GoogleMapController> _mapController = Completer();
  StreamSubscription centerSubscription;

  @override
  void initState() {
    final applicationBloc = Provider.of<ApplicationBloc>(context,
        listen: false);
    centerSubscription =
        applicationBloc.selectedDialysisCenterStream.stream.listen((location) {
      if (location != null) {
        //applicationBloc.setSelectedCenterMarker(buildContext);
        setMapLocation(location);
      }
    });
    MarkerService.getMarker();
    super.initState();
  }

  @override
  void dispose() {  // widget closed -> dispose of streams
    final applicationBloc = Provider.of<ApplicationBloc>(context,
        listen: false);
    applicationBloc.dispose();
    centerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // get context from main.dart and notifier
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    applicationBloc.setSelectedCenterMarker(context);
    return mapTab();
  }

  void _onItemTapped(int index) {
    setState(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
            return MainInfoScreen();
          }));
      _selectedIndex = index;
    });
  }

  Widget mapTab() {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    applicationBloc.setSelectedCenterMarker(context);

    return (applicationBloc.currLocation == null)
        ? Center(
      child: CircularProgressIndicator(), // change to promote user to share their locaiton in settings!!!!!! DO THIS
    )
        : Stack(
        children: [
          Column(
              children: [
                TextField(
                  onChanged: (value) => applicationBloc.searchPlaces(value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter address or name',
                  ),
                ),
                if (
                applicationBloc.dialysisSearchList != null &&
                    applicationBloc.dialysisSearchList.length != 0)
                  Container(
                      height: 300.0,
                      child: ListView.builder(
                          itemCount: applicationBloc.dialysisSearchList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(
                                    applicationBloc.dialysisSearchList[index].name,
                                    style: TextStyle(color: Colors.blue)
                                ),
                                onTap: () { // select a result
                                  applicationBloc.setSelectedDialysisCenter(
                                      applicationBloc.dialysisSearchList[index].placeId
                                  );
                                }
                            );
                          }
                      )
                  ),
                Flexible(
                  // height: MediaQuery.of(context).size.height - 196.0, // hardcoded this but is there a way to get navbar height?????
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: Set.from(applicationBloc.markers),
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(applicationBloc.currLocation.latitude,
                            applicationBloc.currLocation.longitude),
                        zoom: 14,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _mapController.complete(controller);
                      },
                    )
                ),
              ]
          )]
    );
  }

  Future<void> setMapLocation(DialysisInfo location) async {  // wait for controller object
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(location.lat, location.lng), // set to center's location
          zoom: 14.0
        )
      )
    );
  }
}
