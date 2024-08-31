import 'package:az_e_wallet/utils/responsive/responsive_utilis.dart';
import 'package:az_e_wallet/views/screens/contact_screen.dart';
import 'package:az_e_wallet/views/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:az_e_wallet/views/screens/Qr_scanner.dart';
import 'package:az_e_wallet/views/screens/e_sim_detail_screen.dart';
import 'package:az_e_wallet/views/screens/scan_pay_screen.dart';
// Import the Responsive class

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        setState(() {
          _selectedIndex = 0;
        });
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PayMeLinkScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QRScannerScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EsimDetailsScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Transfer',
            style: TextStyle(
              fontFamily: 'Poppins',
            )),
        leading: _selectedIndex == 0
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
        centerTitle:
            Responsive.isDesktop(context), // Center title only on desktop
      ),
      body: Responsive.isMobile(context)
          ? ContactsScreen() // For mobile
          : Row(
              children: [
                Expanded(
                    flex: 2, child: ContactsScreen()), // For tablet/desktop
                if (Responsive.isDesktop(context))
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.grey[200],
                      child: Center(child: Text('Sidebar Content')),
                    ),
                  ),
              ],
            ),
      bottomNavigationBar: _selectedIndex == 0
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/home.png',
                    height: 24.0,
                    color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/scan_pay.png',
                    height: 24.0,
                    color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                  ),
                  label: 'Scan & Pay',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/Qr_code.png',
                    height: 24.0,
                    color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
                  ),
                  label: 'QR Code',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/chart.png',
                    height: 24.0,
                    color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
                  ),
                  label: 'Transaction',
                ),
              ],
            )
          : null,
    );
  }
}
