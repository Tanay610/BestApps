import 'package:e_nactr/components/loading_widget.dart';
import 'package:e_nactr/util/router.dart';
import 'package:e_nactr/views/details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uuid/uuid.dart';
import '../models/category.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookItem extends StatelessWidget {
  BookItem(
      {super.key, required this.entry, required this.img, required this.title});

  final Entry entry;
  final String img;
  final String title;

  static final uuid =  Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authorTag = uuid.v4();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Routed.pushPage(context, const Details());
      },

      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),

            child: Hero(tag: imgTag,
            child: CachedNetworkImage(imageUrl: '$img',
            placeholder: (context, url)=> const LoadingWidget(
              isImage: true,

            ),
            errorWidget: (context, url, error) => Image.asset("assets/icons/placed.jpeg",
            fit: BoxFit.cover,

            ),
            fit: BoxFit.cover,
            height: 150.0,
            
            ),
            ),
          ),
          const SizedBox(height: 5.0,),
          Hero(tag: titleTag, child: Material(
            type: MaterialType.transparency,
            child: Text("${title.replaceAll(r'\', '')}",
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            ),
          ))
        ],
      ),
    );
  }
}
