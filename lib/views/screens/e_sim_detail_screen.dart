import 'package:az_e_wallet/utils/responsive/responsive_utilis.dart';
import 'package:az_e_wallet/views/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:az_e_wallet/views/widgets/custom_button.dart';
import 'package:az_e_wallet/views/widgets/theme.dart';

class EsimDetailsScreen extends StatelessWidget {
  const EsimDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Esim Details',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
               // Set the width to 326px
                padding:
                    EdgeInsets.all(Responsive.isMobile(context) ? 8.0 : 16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildDetailRow(context, 'Transaction ID', '123456789765'),
                      const Divider(),
                      buildDetailRow(context, 'Amount', '1 KWD'),
                      const Divider(),
                      buildDetailRow(context, 'Status', 'Success'),
                      const Divider(),
                      buildDetailRow(context, 'Category', 'MOBILE_RECHARGE'),
                      const Divider(),
                      buildDetailRow(context, 'Date', '2024-14-24'),
                      const Divider(),
                      buildDetailRow(context, 'Time', '09:10:14'),
                      const Divider(),
                      buildDetailRow(context, 'Remark', 'Success'),
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: Responsive.isMobile(context) ? 160 : 200,
                          height: Responsive.isMobile(context) ? 160 : 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF6D6D6D),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/az-e-wallet.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: CustomButton(
                              text: 'Download',
                              icon: Icons.download,
                              onPressed: () {},
                              backgroundColor: AppTheme.primaryColor,
                              textColor: AppTheme.buttonTextColor,
                            ),
                          ),
                          Flexible(
                            child: CustomButton(
                              text: 'Share eSim',
                              icon: Icons.share,
                              onPressed: () {},
                              backgroundColor: Color(0xFFDADADA),
                              textColor: Color(0xFF222766),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
