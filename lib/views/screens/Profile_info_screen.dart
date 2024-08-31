import 'package:az_e_wallet/utils/responsive/responsive_utilis.dart';
import 'package:az_e_wallet/views/widgets/custom_button.dart';
import 'package:az_e_wallet/views/widgets/theme.dart';
import 'package:flutter/material.dart';
// Import the Responsive class

class ProfileInformationScreen extends StatelessWidget {
  const ProfileInformationScreen({super.key});

  Widget _buildDetailRow(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: Responsive.isMobile(context)
                      ? 14
                      : 16, // Adjust font size based on screen size
                ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: Responsive.isMobile(context)
                      ? 14
                      : 16, // Adjust font size based on screen size
                ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = Responsive.isMobile(context)
        ? double.infinity
        : Responsive.isTablet(context)
            ? 400
            : 600; // Adjust the container width based on the screen size

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Information'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        // Center the body for larger screens
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: containerWidth,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildDetailRow(context, 'Name', 'Jane Smith'),
                    const Divider(),
                    _buildDetailRow(context, 'Date of Birth', '1986-14-24'),
                    const Divider(),
                    _buildDetailRow(context, 'Gender', 'M'),
                    const Divider(),
                    _buildDetailRow(context, 'Mobile Number', '+96500000000'),
                    const Divider(),
                    _buildDetailRow(context, 'Status', '.'),
                    const Divider(),
                    _buildDetailRow(context, 'Civil Id', '1234567898776'),
                    const Divider(),
                    _buildDetailRow(context, 'Civil Id Expiry', '07/04/2025'),
                    const Divider(),
                    _buildDetailRow(context, 'Civil Id Image', '.'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Update Email Address',
                          onPressed: () {},
                          textSize: Responsive.isMobile(context)
                              ? 12
                              : 14, // Adjust text size
                          backgroundColor: AppTheme.primaryColor,
                          textColor: AppTheme.buttonTextColor,
                          minimumSize: Size(
                              Responsive.isMobile(context) ? 155 : 200,
                              45), // Adjust button size
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(
                          text: 'Update Mobile Number',
                          textSize: Responsive.isMobile(context)
                              ? 11
                              : 14, // Adjust text size
                          onPressed: () {},
                          backgroundColor: AppTheme.primaryColor,
                          textColor: AppTheme.buttonTextColor,
                          minimumSize: Size(
                              Responsive.isMobile(context) ? 155 : 200,
                              45), // Adjust button size
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // Add 8px vertical space
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Update Passcode',
                          textSize: Responsive.isMobile(context)
                              ? 12
                              : 14, // Adjust text size
                          onPressed: () {},
                          backgroundColor: AppTheme.primaryColor,
                          textColor: AppTheme.buttonTextColor,
                          minimumSize: Size(
                              Responsive.isMobile(context) ? 155 : 200,
                              45), // Adjust button size
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(
                          text: 'Update Pin',
                          textSize: Responsive.isMobile(context)
                              ? 12
                              : 14, // Adjust text size
                          onPressed: () {},
                          backgroundColor: AppTheme.primaryColor,
                          textColor: AppTheme.buttonTextColor,
                          minimumSize: Size(
                              Responsive.isMobile(context) ? 155 : 200,
                              45), // Adjust button size
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
