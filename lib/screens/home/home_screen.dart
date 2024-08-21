import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_input_variant.dart';
import 'package:flutter_starter_template/theme/styles.dart';
import 'package:flutter_starter_template/values/assets/home_assets.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:flutter_starter_template/widgets/common/input/app_text_input.dart';
import 'package:flutter_starter_template/widgets/common/visual/tab_item.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _bottomNavigationBarIndex = 0;

  final Location locationController = Location();

  LatLng? currentPosition;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
    Text('Index 3: About Us', style: optionStyle), // Added
    Text('Index 4: Settings', style: optionStyle), // Added
    Text('Index 5: Help and Support', style: optionStyle), // Added
    Text('Index 6: Logout', style: optionStyle), // Added
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTappedOnBottomNavigationBar(int index) {
    setState(() {
      _bottomNavigationBarIndex = index;
    });
  }

  static const googlePlex = LatLng(37.785831, -122.0848);
  static const mountainView = LatLng(37.785840, -122.0839);

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fetchLocationUpdates();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('DA'),
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
                        color: ThemeColors.green5, // Background color
                        borderRadius: BorderRadius.circular(Dimens.marginSmall),
                      ),
                      child: Row(
                        children: [
                          _buildTabButton('Transport', 0),
                          _buildTabButton('Delivery', 1),
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
          width: MediaQuery.of(context).size.width * 0.60, // Adjusts the width
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
              Container(
                width: 100, // Equal width and height for a perfect circle
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Circular shape for the container
                  border: Border.all(
                    color: ThemeColors.green, // Green border color
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    HomeAssets.avatar,
                    fit: BoxFit
                        .cover, // Ensures the image fills the circular area
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
                      'Nate Samson',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'note@email.com',
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
                  _onItemTapped(6);
                  Navigator.pop(context);
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
                icon: Icon(
                    Icons.favorite_border), // Empty space for the custom icon
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
        print('Current Location: $currentPosition');
      }
    });
    // Fetch location updates
  }

  Widget _buildTabButton(String text, int index) {
    bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.marginTwelve,
          ),
          decoration: BoxDecoration(
            color: isSelected ? ThemeColors.primaryColor : Colors.transparent,
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(
                Dimens.marginSmall,
              ),
              right: Radius.circular(
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
}

class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = ThemeColors.green;
    final Path path = Path();

    final double w = size.width;
    final double h = size.height;
    final double side = w / 2;

    path.moveTo(w / 2, 0);
    path.lineTo(w, h * 0.25);
    path.lineTo(w, h * 0.75);
    path.lineTo(w / 2, h);
    path.lineTo(0, h * 0.75);
    path.lineTo(0, h * 0.25);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
