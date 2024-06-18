import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:itss2/screens/get_location_screen/get_location_screen.dart';
import 'package:itss2/screens/login_screen/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../screens/home_screen/tab_index/tab_index_notifier.dart';

class HomePageAppbar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  @override
  ConsumerState<HomePageAppbar> createState() => _HomePageAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class _HomePageAppbarState extends ConsumerState<HomePageAppbar> {
  late Position currentPosition;

  Future<void> _openMap(double latitude, double longitude) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    print("URL : $url");
    if (await canLaunchUrl(Uri.parse(url.toString()))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
              print("LOGOUT");
              ref.read(tabIndexNotifierProvider.notifier).setIndex(0);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ))
      ],
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(left: 0),
        child: GestureDetector(
            onTap: () async {
              await _getCurrentLocation();
              print(
                  "LOCATION : ${currentPosition.latitude},${currentPosition.longitude}");
              await _openMap(
                  currentPosition.latitude, currentPosition.longitude);
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      GetLocationScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: Container(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: Theme.of(context).iconTheme.size,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    const Text("Bách Khoa",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      size: Theme.of(context).iconTheme.size,
                      color: Colors.white,
                    )
                  ],
                ))),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          padding: const EdgeInsets.only(bottom: 10),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text('Welcome back !',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
