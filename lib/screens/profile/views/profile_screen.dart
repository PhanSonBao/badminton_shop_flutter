import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:shop/constants.dart';
import 'package:shop/route/screen_export.dart';

import 'components/profile_card.dart';
import 'package:shop/api.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProfileCard(
            name: "Sepide",
            email: "theflutterway@gmail.com",
            imageSrc: "https://i.imgur.com/IXnwbLk.png",
            // proLableText: "Sliver",
            // isPro: true, if the user is pro
            press: () {
              Navigator.pushNamed(context, userInfoScreenRoute);
            },
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          //   child: Text(
          //     "Account",
          //     style: Theme.of(context).textTheme.titleSmall,
          //   ),
          // ),
          // const SizedBox(height: defaultPadding / 2),
          // ProfileMenuListTile(
          //   text: "Orders",
          //   svgSrc: "assets/icons/Order.svg",
          //   press: () {
          //     Navigator.pushNamed(context, ordersScreenRoute);
          //   },
          // ),

          // ProfileMenuListTile(
          //   text: "Addresses",
          //   svgSrc: "assets/icons/Address.svg",
          //   press: () {
          //     Navigator.pushNamed(context, addressesScreenRoute);
          //   },
          // ),

          // Log Out
          ListTile(
            onTap: () async {
              await Utils.clearValueByKey("token");
              Navigator.pushReplacementNamed(context, logInScreenRoute);
            },
            minLeadingWidth: 24,
            leading: SvgPicture.asset(
              "assets/icons/Logout.svg",
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                errorColor,
                BlendMode.srcIn,
              ),
            ),
            title: const Text(
              "Đăng xuất",
              style: TextStyle(color: errorColor, fontSize: 14, height: 1),
            ),
          )
        ],
      ),
    );
  }
}
