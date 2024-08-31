import 'package:az_e_wallet/utils/responsive/responsive_utilis.dart';
import 'package:az_e_wallet/views/widgets/custom_button.dart';
import 'package:az_e_wallet/views/widgets/theme.dart';
import 'package:flutter/material.dart';

class PinInputScreen extends StatefulWidget {
  const PinInputScreen({super.key});

  @override
  _PinInputScreenState createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onSubmit() {
    final enteredPin = _controllers.map((controller) => controller.text).join();
    print('Entered PIN: $enteredPin');
    if (enteredPin.length == 4) {
      // Handle your logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = Responsive.width(context);
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text('PayMe Link'),
          centerTitle: true,
          leading: BackButtonIcon()),
      body: Padding(
        padding: EdgeInsets.all(isMobile ? 16.0 : (isTablet ? 32.0 : 56.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter 4-DIGIT PIN',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: isMobile ? 20 : (isTablet ? 24 : 28),
                  ),
            ),
            const Divider(
              color: Color(0xFFE8EAED),
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  height: isMobile ? 50 : (isTablet ? 60 : 70),
                  width: isMobile ? 40 : (isTablet ? 50 : 60),
                  child: TextFormField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: isMobile ? 20 : (isTablet ? 24 : 28),
                        ),
                    maxLength: 1,
                    cursorColor: Colors.grey,
                    cursorHeight: 25,
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: const Color(0xFFEDF1FD),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < 3) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index + 1]);
                        } else {
                          _focusNodes[index].unfocus();
                          _onSubmit();
                        }
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context)
                            .requestFocus(_focusNodes[index - 1]);
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: 'Close',
                  onPressed: () {},
                  backgroundColor: AppTheme.buttonColor,
                  textColor: AppTheme.buttonTextColor,
                  minimumSize: Size(
                    isMobile ? 100 : (isTablet ? 120 : 131.13),
                    isMobile ? 40 : (isTablet ? 45 : 49),
                  ),
                ),
                CustomButton(
                  text: 'Submit',
                  onPressed: _onSubmit,
                  backgroundColor: AppTheme.buttonColor,
                  textColor: AppTheme.buttonTextColor,
                  minimumSize: Size(
                    isMobile ? 100 : (isTablet ? 120 : 131.13),
                    isMobile ? 40 : (isTablet ? 45 : 49),
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
