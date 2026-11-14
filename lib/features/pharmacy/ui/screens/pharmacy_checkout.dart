import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:curalink/application/routes/app_route_const.dart';
import 'package:curalink/features/common/ui/widgets/payment_details.dart';
import 'package:curalink/features/common/ui/widgets/price_action_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PharmacyCheckoutScreen extends StatefulWidget {
  const PharmacyCheckoutScreen({super.key});

  @override
  State<PharmacyCheckoutScreen> createState() => _PharmacyCheckoutScreenState();
}

class _PharmacyCheckoutScreenState extends State<PharmacyCheckoutScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  final RegExp _phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
  final RegExp _emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

  String _paymentMethod = 'Cash on Delivery';

  late final TapGestureRecognizer _privacyRecognizer = TapGestureRecognizer()
    ..onTap = () => _openPolicy('Privacy Policy');

  late final TapGestureRecognizer _termsRecognizer = TapGestureRecognizer()
    ..onTap = () => _openPolicy('Terms & Conditions');

  late final TapGestureRecognizer _returnRecognizer = TapGestureRecognizer()
    ..onTap = () => _openPolicy('Return Policy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout Payment',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 16.h,
          children: [
            Text(
              'Shipping Information',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
            _buildShippingForm(),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'Order Items (2)',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.maybePop(context),
                  child: const Text('Edit Cart'),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.primaryColor.withAlpha(22)),
              ),
              child: Row(
                spacing: 12.w,
                children: [
                  Image.asset(AssetsPath.bodrex, width: 48.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        const Text(
                          'OBH Combi',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '75ml • Qty: 2',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.greyText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '\$19.98',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
            _buildPaymentMethods(),
            PaymentDetailsWidget(
              fee1Amount: 19.98,
              fee1: 'Total Price',
              fee2: 'Delivery Charge',
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: PriceActionBar(price: 28.48, onClick: _placeOrder),
        ),
      ),
    );
  }

  Widget _buildShippingForm() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 14.h,
        crossAxisAlignment: .start,
        children: [
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Mobile number *',
              prefixIcon: Icon(Icons.phone_outlined),
            ),
            validator: (value) {
              final String phone = value?.trim() ?? '';

              if (phone.isEmpty) {
                return 'Enter your mobile number';
              }

              if (!_phoneRegex.hasMatch(phone)) {
                return 'Enter a valid mobile number';
              }

              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Email address (optional)',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value) {
              final String email = value?.trim() ?? '';

              if (email.isNotEmpty && !_emailRegex.hasMatch(email)) {
                return 'Enter a valid email address';
              }

              return null;
            },
          ),
          TextFormField(
            controller: _addressController,
            keyboardType: TextInputType.streetAddress,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Shipping address *',
              prefixIcon: Icon(Icons.location_on_outlined),
              alignLabelWithHint: true,
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Enter your shipping address';
              }

              return null;
            },
          ),
          TextFormField(
            controller: _noteController,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Order note (optional)',
              prefixIcon: Icon(Icons.notes_outlined),
            ),
          ),
          FormField<bool>(
            initialValue: false,
            validator: (value) {
              if (value != true) {
                return 'Please accept our policies to continue';
              }

              return null;
            },
            builder: (field) {
              return Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    crossAxisAlignment: .center,
                    children: [
                      Checkbox(
                        value: field.value,
                        activeColor: AppColors.primaryColor,
                        onChanged: field.didChange,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodySmall,
                            children: [
                              const TextSpan(text: 'I agree to the '),
                              _policyLink('Privacy Policy', _privacyRecognizer),
                              const TextSpan(text: ', '),
                              _policyLink(
                                'Terms & Conditions',
                                _termsRecognizer,
                              ),
                              const TextSpan(text: ' and '),
                              _policyLink('Return Policy', _returnRecognizer),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (field.hasError)
                    Text(
                      field.errorText!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 12.sp,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return RadioGroup<String>(
      groupValue: _paymentMethod,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _paymentMethod = value;
          });
        }
      },
      child: Column(
        children: const [
          RadioListTile<String>(
            value: 'Cash on Delivery',
            title: Text('Cash on Delivery'),
          ),
          RadioListTile<String>(
            value: 'Credit / Debit Card',
            title: Text('Credit / Debit Card'),
          ),
          RadioListTile<String>(
            value: 'Digital Wallet',
            title: Text('Digital Wallet'),
          ),
        ],
      ),
    );
  }

  TextSpan _policyLink(String text, TapGestureRecognizer recognizer) {
    return TextSpan(
      text: text,
      recognizer: recognizer,
      style: const TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      ),
    );
  }

  void _openPolicy(String title) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$title is not available yet')));
  }

  void _placeOrder() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }
    GoRouter.of(context).pushNamed(AppRouteConst.bookingConfirmationRoute);
  }



  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _noteController.dispose();

    _privacyRecognizer.dispose();
    _termsRecognizer.dispose();
    _returnRecognizer.dispose();

    super.dispose();
  }
}
