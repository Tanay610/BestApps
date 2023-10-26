import 'package:e_nactr/components/body_builder.dart';
import 'package:e_nactr/components/book_list_item.dart';
import 'package:e_nactr/models/category.dart';
import 'package:e_nactr/util/router.dart';
import 'package:e_nactr/view_models/home_provider.dart';
import 'package:e_nactr/views/genre/genre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).getFeeds();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<HomeProvider>(
        builder: (context, HomeProvider homeProvider, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          centerTitle: true,
          title: const Text(
            "Enactr",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        body: _buildBody(homeProvider),
      );
    });
  }

  Widget _buildBody(HomeProvider homeProvider) {
    return BodyBuilder(
        apiRequestStatus: homeProvider.apiRequestStatus,
        child: _builBodyList(homeProvider),
        reload: () => homeProvider.getFeeds());
  }

  Widget _builBodyList(HomeProvider homeProvider) {
    return RefreshIndicator(
      onRefresh: () => homeProvider.getFeeds(),
      child: ListView(
        children: [
          _buildFeaturedSection(homeProvider),
          const SizedBox(
            height: 20.0,
          ),
          _buildSectionTitle("Categories"),
          const SizedBox(height: 10.0,),
          _buildGenreSection(homeProvider),
          const SizedBox(height: 20.0,),
          _buildSectionTitle('Recently adddy'),
          const SizedBox(height: 20,),
          _buildNewSection(homeProvider)
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedSection(HomeProvider homeProvider) {
    return SizedBox(
      height: 200.0,
      child: Center(
        child: ListView.builder(
            primary: false,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            itemCount: homeProvider.top.feed?.entry?.length ?? 0,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Entry entry = homeProvider.top.feed!.entry![index];
            }),
      ),
    );
  }

  Widget _buildGenreSection(HomeProvider homeProvider) {
    return SizedBox(
      height: 50.0,
      child: Center(
        child: ListView.builder(
            primary: false,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            scrollDirection: Axis.horizontal,
            itemCount: homeProvider.top.feed?.link?.length ?? 0,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Link link = homeProvider.top.feed!.link![index];
              if (index < 10) {
                return const SizedBox();
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    onTap: () {
                      Routed.pushPage(context, Genre(id: '$link.title', url: link.href!,));
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          '${link.title}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  _buildNewSection(HomeProvider homeProvider) {
    return ListView.builder(
        primary: false,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: homeProvider.recent.feed?.entry?.length ?? 0,
        itemBuilder: (context, index) {
          Entry entry = homeProvider.recent.feed!.entry![index];

          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: BookListItem(entry: entry),
              );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
