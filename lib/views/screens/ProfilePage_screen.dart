import 'package:az_e_wallet/utils/responsive/responsive_utilis.dart';
import 'package:az_e_wallet/views/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = -1; // -1 means no option is selected

  @override
  Widget build(BuildContext context) {
    double width = Responsive.width(context);
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Container(
        color: AppTheme.backgroundColor, // Use the themed background color
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16.0 : (isTablet ? 24.0 : 32.0)),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _buildProfileOption(
                      index: 0,
                      iconPath: 'assets/icons/Customer.png',
                      label: "Profile Information",
                    ),
                    _buildProfileOption(
                      index: 1,
                      iconPath: 'assets/icons/Phone android.png',
                      label: "Registered Devices",
                    ),
                    _buildProfileOption(
                      index: 2,
                      iconPath: 'assets/icons/Text snippet.png',
                      label: "Language",
                    ),
                    _buildProfileOption(
                      index: 3,
                      iconPath: 'assets/icons/terms_and_cond.png',
                      label: "Terms and Conditions",
                    ),
                    _buildProfileOption(
                      index: 4,
                      iconPath: 'assets/icons/Security Shield.png',
                      label: "Privacy Policy",
                    ),
                    _buildProfileOption(
                      index: 5,
                      iconPath: 'assets/icons/Logout.png',
                      label: "Log Out",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required int index,
    required String iconPath,
    required String label,
  }) {
    bool isSelected = _selectedIndex == index;
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 10 : (isTablet ? 12 : 15),
              horizontal: isMobile ? 10 : (isTablet ? 14 : 15),
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(
                      0x80EBEBEB) // Background color for selected item
                  : const Color(
                      0x80EBEBEB), // Background color for unselected item
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Image.asset(
                iconPath,
                width: isMobile ? 20 : (isTablet ? 22 : 24),
                height: isMobile ? 20 : (isTablet ? 22 : 24),
                color: isSelected
                    ? const Color(0xFFBB271A) // Color when selected
                    : const Color(0xFF222766), // Default color
              ),
              title: Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFFBB271A) // Text color when selected
                      : const Color(0xFF222766), // Default text color
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile ? 16 : (isTablet ? 18 : 20),
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: isMobile ? 14 : (isTablet ? 16 : 18),
                color: isSelected
                    ? const Color(0xFFBB271A) // Arrow color when selected
                    : const Color(0xFF83899B), // Default arrow color
              ),
            ),
          ),
        ),
        const SizedBox(height: 10), // Space between options
      ],
    );
  }
}
