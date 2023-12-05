import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            // placeholder: (context, url) => const CustomLoadingIndicator(),
            errorWidget: (context, url, error) => AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: Container(
                    color: Colors.white,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          size: 20,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 8, top: 5),
                          child: Text(
                            "Failed",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "loaded",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "image!",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
