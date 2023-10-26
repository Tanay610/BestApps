import 'package:e_nactr/components/loading_widget.dart';
import 'package:e_nactr/models/category.dart';
import 'package:e_nactr/util/router.dart';
import 'package:e_nactr/views/details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uuid/uuid.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookListItem extends StatelessWidget {
  BookListItem({super.key, required this.entry});

  final Entry entry;

  static final uuid = Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authorTag = uuid.v4();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Routed.pushPage(context, Details());
      },
      child: Container(
        height: 150.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              elevation: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Hero(
                  tag: imgTag,
                  child: CachedNetworkImage(
                    imageUrl: '${entry.link![1].href!}',
                    placeholder: (context, url) => Container(
                      height: 150.0,
                      width: 100.0,
                      child: LoadingWidget(
                        isImage: true,
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/icons/placed.jpeg",
                      fit: BoxFit.cover,
                      height: 150.0,
                      width: 100.0,
                    ),
                    fit: BoxFit.cover,
                    height: 150.0,
                    width: 100.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: titleTag,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      '${entry.title!.t!.replaceAll(r'\', '')}',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge!.color,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Hero(
                  tag: authorTag,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      '${entry.author!.name!.t!}',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${entry.summary!.t!.length < 100 ? entry.summary!.t! : entry.summary!.t!.substring(0, 100)}...'
                      .replaceAll(r'\n', '\n')
                      .replaceAll(r'\r', '')
                      .replaceAll(r'\"', '"'),
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
