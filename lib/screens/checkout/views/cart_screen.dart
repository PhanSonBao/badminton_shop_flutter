import 'package:flutter/material.dart';
import 'package:shop/constants.dart';
import 'package:shop/api.dart';

import 'components/wallet_history_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isLoading = true;
  dynamic data;
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }

  Future<void> _fetchCartItems() async {
    setState(() {
      _isLoading = true;
    });

    String email = await Utils.getValueByKey("email") ?? "";
    Map<String, dynamic> res = await apiService.getRequest('/cart/$email');

    if (res["success"]) {
      setState(() {
        data = res["data"];
      });
    } else {
      Utils.showMsg(context, res["msg"]);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giỏ hàng"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.only(top: defaultPadding),
                          child: WalletHistoryCard(
                              amount: data["cart"]["total"],
                              products: data["cartDetails"]),
                        ),
                        childCount: 1,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
