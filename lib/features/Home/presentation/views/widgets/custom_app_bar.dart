import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Row(
        children: [
          Image.asset(
            "assets/images/Logo.png",
            height: 20,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(
                  "/searchView",
                );
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 25,
              ))
        ],
      ),
    );
  }
}
