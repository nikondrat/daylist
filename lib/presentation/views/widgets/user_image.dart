import 'package:daylist/presentation/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class UserImageWidget extends StatelessWidget {
  final Function()? onTap;
  final EdgeInsets? margin;
  final Size? size;
  final String? url;

  const UserImageWidget({
    Key? key,
    this.onTap,
    this.size,
    this.margin,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: margin,
            height: size?.height,
            width: size?.width,
            decoration: BoxDecoration(
                border: Border.all(
                    color: context.color.primaryColor,
                    width: context.value.width),
                borderRadius: BorderRadius.circular(context.value.radius),
                image: url != null
                    ? DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(url!))
                    : null),
            child: url == null ? const Icon(UniconsLine.user) : null));
  }
}
