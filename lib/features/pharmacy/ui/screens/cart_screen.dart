import 'package:curalink/features/pharmacy/ui/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Items", style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            CartItemCard(
              name: 'OBH Combi',
              variantLine: 'Herbal Cough Syrup • 75ml',
              price: 9.99,
              quantity: 1,
            ),
          ],
        ),
      ),
    );
  }
}
