import 'package:e_nactr/components/loading_widget.dart';
import 'package:e_nactr/models/category.dart';
import 'package:e_nactr/util/router.dart';
import 'package:e_nactr/views/details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uuid/uuid.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookCard extends StatelessWidget {
  BookCard({super.key, required this.img, required this.entry});

  final String img;
  final Entry entry;

  static const uuid = Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authortag = uuid.v4();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        elevation: 4.0,
        child: InkWell(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            onTap: () {
              Routed.pushPage(context, const Details());
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Hero(
                tag: imgTag,
                child: CachedNetworkImage(
                  imageUrl: '$img',
                  placeholder: (context, url) => const LoadingWidget(
                    isImage: true,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/icons/placed.jpeg",
                    fit: BoxFit.cover,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )),
      ),
    );
  }
}
