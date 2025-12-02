import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/widgets/custom_app_bar.dart';
import '../provider/cart_provider.dart';
import '../widgets/cart_item_slidable_card.dart';
import '../widgets/checkout_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().items;

    return Scaffold(
      appBar: CustomAppBar(title: ("My Cart")),
      bottomNavigationBar: const CheckoutBar(),
      body: cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 24.h),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  ...List.generate(cartItems.length, (index) {
                    final item = cartItems[index];
                    return CartItemSlidableCard(
                      item: item,
                      showHeader: index == 0,
                      itemCount: cartItems.length,
                      onDelete: () =>
                          context.read<CartProvider>().removeItem(item),
                      onIncrement: () =>
                          context.read<CartProvider>().incrementQuantity(item),
                      onDecrement: () =>
                          context.read<CartProvider>().decrementQuantity(item),
                    );
                  }),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
    );
  }
}
