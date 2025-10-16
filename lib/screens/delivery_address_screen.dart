import 'package:flutter/material.dart';
import 'package:stylish_shopping_app/core/theme/app_text_style.dart';
import '../widgets/primary_button.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Color(0xffFEFEFE),
        appBar: AppBar(
          backgroundColor: Color(0xffFEFEFE),
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_left),
          ),
          centerTitle: true,
          title: Text(
            'Address',
            style: AppTextStyle.s17.copyWith(
              color: Color(0xff1D1E20),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(child: _Body()),

            // Button
            SizedBox(
              child: PrimaryButton(
                text: 'Save Address',
                color: Color(0xff9775FA),
                onClick: () {
                  // Handle sign up action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),

          TextField(
            keyboardType: TextInputType.text,
            style: AppTextStyle.s15.copyWith(
              fontWeight: FontWeight.w400,
              color: Color(0xff8F959E),
            ),
            decoration: InputDecoration(
              label: Text('Name'),
              labelStyle: AppTextStyle.s17.copyWith(color: Color(0xff1D1E20)),
            ),
          ),

          const SizedBox(height: 15),

          
        ],
      ),
    );
  }
}
