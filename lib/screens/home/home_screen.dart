import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:riders_app/enums/widget_configurations/app_input_variant.dart';
import 'package:riders_app/helpers/secure_storage_service_helper.dart';
import 'package:riders_app/screens/authentication/welcome_screen.dart';
import 'package:riders_app/values/assets/home_assets.dart';
import 'package:riders_app/values/colors.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/widgets/common/input/app_button.dart';
import 'package:riders_app/widgets/common/input/app_text_input.dart';
import 'package:riders_app/widgets/common/visual/address_bottom_sheet.dart';
import 'package:riders_app/widgets/common/visual/hexagonal_painter.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final Location locationController = Location();

  LatLng? currentPosition;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const googlePlex = LatLng(-1.9515333, 30.1146561);
  static const mountainView = LatLng(-1.9515333, 30.1146561);

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fetchLocationUpdates();
      getUserDetails();
    });
  }

  PageController _pageController = PageController();
  int activePageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    _pageController = PageController();
    super.dispose();
  }

  String? email;
  String? username;

  void getUserDetails() async {
    final SecureStorageServiceHelper secureStorageHelper =
        SecureStorageServiceHelper();

    email = await secureStorageHelper.email;
    username = await secureStorageHelper.name;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Welcome'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: googlePlex,
              zoom: 13,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('currentLocation'),
                icon: BitmapDescriptor.defaultMarker,
                position: currentPosition ?? googlePlex,
              ),
              const Marker(
                markerId: MarkerId('sourceLocation'),
                icon: BitmapDescriptor.defaultMarker,
                position: googlePlex,
              ),
              const Marker(
                markerId: MarkerId('destinationLocation'),
                icon: BitmapDescriptor.defaultMarker,
                position: mountainView,
              ),
            },
          ),
          Positioned(
            top: 350,
            left: 10,
            child: SizedBox(
              width: 172,
              height: 54,
              child: AppButton(
                title: 'Rental',
                onTap: () => {},
              ),
            ),
          ),
          Positioned(
            top: 420,
            left: 10,
            child: Container(
              width: 364,
              height: 141,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.marginDefault),
                color: ThemeColors.green4,
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(Dimens.marginDefault),
                    child: AppTextInput(
                      label: 'Where would you go?',
                      trailingWidgetOverride: Icon(
                        Icons.favorite,
                        color: ThemeColors.lightGrey,
                      ),
                      variant: AppInputVariant.search,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.marginDefault,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ThemeColors.green5,
                        borderRadius: BorderRadius.circular(Dimens.marginSmall),
                        border: Border.all(
                          color: ThemeColors.green,
                        ),
                      ),
                      child: Row(
                        children: [
                          _buildTabButton('Transport', 0, () {
                            showAddressBottomSheet(context);
                          }),
                          _buildTabButton('Delivery', 1, () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.60,
          color: ThemeColors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.marginMiddle),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                    ),
                    Text(
                      'Back',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ThemeColors.black,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: Dimens.marginDefault),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: ClipOval(
                    child: Image.asset(
                      HomeAssets.avatar,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: Dimens.marginDefault),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username ?? '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      email ?? '',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ThemeColors.black,
                          ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('History'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.report_problem),
                title: const Text('Complain'),
                selected: _selectedIndex == 1,
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text('Referral'),
                selected: _selectedIndex == 2,
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About Us'),
                selected: _selectedIndex == 3,
                onTap: () {
                  _onItemTapped(3);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                selected: _selectedIndex == 4,
                onTap: () {
                  _onItemTapped(4);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help and Support'),
                selected: _selectedIndex == 5,
                onTap: () {
                  _onItemTapped(5);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                selected: _selectedIndex == 6,
                onTap: () {
                  // _onItemTapped(6);

                  context.pushNamed(WelcomeScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Dimens.marginBig),
            topRight: Radius.circular(Dimens.marginBig),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ThemeColors.primaryColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_offer_outlined),
                label: 'Offer',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        onPressed: () {},
        child: SizedBox(
          child: CustomPaint(
            painter: HexagonPainter(),
            child: const Center(
              child: Icon(
                Icons.account_balance_wallet_outlined,
                // size: 32,
                color: ThemeColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();

    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
        });
      }
    });
  }

  Widget _buildTabButton(String text, int index, void Function()? onTap) {
    bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
          onTap?.call();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.marginTwelve,
          ),
          decoration: BoxDecoration(
            color: isSelected ? ThemeColors.primaryColor : Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                Dimens.marginSmall,
              ),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? ThemeColors.white : ThemeColors.black,
                fontStyle: Theme.of(context).textTheme.bodyMedium?.fontStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showAddressBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      context: context,
      // isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (context) => const AddressBottomSheet(),
    );
  }
}
