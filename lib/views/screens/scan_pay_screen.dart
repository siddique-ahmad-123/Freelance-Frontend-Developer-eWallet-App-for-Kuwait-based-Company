import 'package:az_e_wallet/utils/responsive/responsive_utilis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package
import 'package:az_e_wallet/views/widgets/custom_button.dart';
import 'package:az_e_wallet/views/widgets/theme.dart';
// Import your responsive.dart file

class PayMeLinkScreen extends StatelessWidget {
  const PayMeLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w700,
          // fontFamily: 'assets/fonts/Manrope-Bold.tff'
        );
    final titleStyle1 = Theme.of(context).textTheme.bodyMedium?.copyWith(
          // fontWeight: FontWeight.w700,
          fontFamily: 'assets/fonts/Manrope-Light.tff',
        );

    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PayMe Link', style: titleStyle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Handle back button action
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(isMobile ? 16.0 : (isTablet ? 24.0 : 32.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/tick_icon.png',
              width: isMobile ? 40 : (isTablet ? 50 : 60),
              height: isMobile ? 40 : (isTablet ? 50 : 60),
            ),
            const SizedBox(height: 8),
            Text(
              'Your Pay Me Link is generated for',
              style: TextStyle(
                fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                color: const Color(0xFF6B7280),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '1.000 KWD',
              style: TextStyle(
                fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                fontWeight: FontWeight.w700,
                color: const Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 70),
            Image.asset(
              'assets/images/az-e-wallet.png',
              width: isMobile ? 230 : (isTablet ? 200 : 230),
              height: isMobile ? 230 : (isTablet ? 200 : 230),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'Share',
                  icon: Icons.share,
                  onPressed: () {},
                  backgroundColor: const Color(0xFF312785),
                  textColor: Theme.of(context).scaffoldBackgroundColor,
                  minimumSize: Size(
                    isMobile ? 150 : (isTablet ? 165 : 180),
                    isMobile ? 56 : (isTablet ? 86 : 86),
                  ),
                ),
                const SizedBox(width: 16),
                CustomButton(
                  text: 'Copy Link',
                  icon: Icons.copy_all,
                  onPressed: () {},
                  backgroundColor: const Color(0xFFDADADA),
                  textColor: const Color(0xFF222766),
                  minimumSize: Size(
                    isMobile ? 150 : (isTablet ? 165 : 180),
                    isMobile ? 56 : (isTablet ? 86 : 86),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
