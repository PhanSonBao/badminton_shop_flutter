import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/api.dart';
import 'package:shop/components/product/secondary_product_card.dart';

import '../../../../../constants.dart';

class WalletHistoryCard extends StatelessWidget {
  const WalletHistoryCard({
    super.key,
    required this.amount,
    required this.products,
  });

  final dynamic amount;
  final dynamic products;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultBorderRadious)),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        children: [
          ListTile(
            minLeadingWidth: 24,
            leading: SvgPicture.asset(
              "assets/icons/Product.svg",
              color: Theme.of(context).iconTheme.color,
              height: 24,
              width: 24,
            ),
            title: const Text('Tổng tiền'),
            trailing: Text(
              Utils.formatCurrency(amount),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: successColor),
            ),
          ),
          const Divider(height: 1),
          const SizedBox(height: defaultPadding),
          ...products.map((product) {
            return Padding(
              padding: const EdgeInsets.only(
                  bottom: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding),
              child: Row(
                children: [
                  Expanded(
                    child: SecondaryProductCard(
                      image: product["product"]["image"][0],
                      brandName: product["product"]["size"],
                      title: product["product"]["name"],
                      price: product["product"]["price"],
                      priceAfetDiscount: product["product"]["price"],
                      style: ElevatedButton.styleFrom(
                        maximumSize: const Size(double.infinity, 90),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Handle delete action
                    },
                  ),
                ],
              ),
            );
          }).toList(),
          const SizedBox(height: defaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, paymentScreenRoute);
              },
              child: const Text('Thanh toán'),
            ),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
