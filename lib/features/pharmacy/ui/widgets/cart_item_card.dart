import 'package:curalink/application/app_colors.dart';
import 'package:curalink/application/assets_path.dart';
import 'package:curalink/features/pharmacy/ui/widgets/product_quantity_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.name,
    required this.variantLine,
    required this.price,
    required this.quantity,
    this.badgeText = 'OTC',
    this.stockText = 'In Stock (Ready to dispatch)',
    this.onRemove,
  });

  final String name;
  final String variantLine;
  final double price;
  final int quantity;
  final String? badgeText;
  final String? stockText;
  final VoidCallback? onRemove;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.greyText),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            crossAxisAlignment: .start,
            children: [
              Image.asset(AssetsPath.bodrex, height: 120.h),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (badgeText != null) ...[
                          const SizedBox(width: 8),
                          _Badge(label: badgeText!),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      variantLine,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filledTonal(onPressed: (){}, icon: Icon(Icons.delete)),
            ],
          ),
          _StockIndicator(text: stockText!),
          const SizedBox(height: 12),
          ProductQuantityStepperWidget(onChange: (int value) {}),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
      ),
    );
  }
}

class _StockIndicator extends StatelessWidget {
  const _StockIndicator({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check_circle,
          size: 16,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
