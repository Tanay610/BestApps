import 'package:e_nactr/components/body_builder.dart';
import 'package:e_nactr/components/book_list_item.dart';
import 'package:e_nactr/components/loading_widget.dart';
import 'package:e_nactr/models/category.dart';
import 'package:e_nactr/view_models/genre_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Genre extends StatefulWidget {
  const Genre({super.key, required this.id, required this.url});

  final String id;
  final String url;

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      return Provider.of<GenreProvider>(context, listen: false)
          .getFeeds(widget.url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, GenreProvider provider, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('${widget.id}'),
          ),
          body: _buiildBody(provider),
        );
      },
    );
  }

  _buiildBody(provider) {
    return BodyBuilder(
        apiRequestStatus: provider.apiRequestStatus,
        child: _buiildBodyList(provider),
        reload: () => provider.getFeed(widget.url));
  }

  _buiildBodyList(provider) {
    return ListView(
      controller: provider.controller,
      children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            shrinkWrap: true,
            itemCount: provider.items.length,
            itemBuilder: (context, index) {
              Entry entry = provider.items[index];
              return Padding(
                padding: EdgeInsets.all(5.0),
                child: BookListItem(entry: entry),
              );
            }),
        const SizedBox(
          height: 10.0,
        ),
        provider.loadingMore
            ? Container(height: 80.0, child: _buildProgressIndicator())
            : SizedBox()
      ],
    );
  }

  _buildProgressIndicator() {
    return LoadingWidget();
  }
}
