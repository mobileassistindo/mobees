import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/blocs/now_playing/now_playing_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/popular/popular_tv_series_bloc.dart';
import 'package:tv_series/presentation/blocs/top_rated/top_rated_tv_series_bloc.dart';

class TvSeriesListPage extends StatelessWidget {
  const TvSeriesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TV Series',
                style: kHeading5.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, searchTvSeriesRoute);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // color: const Color(0xFF211F30),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16).copyWith(right: 20),
                        child: const Icon(Icons.search),
                      ),
                      Text(
                        'Enter TV series title here',
                        style: kBodyText.copyWith(
                          fontSize: 14,
                          color: const Color(0xFFBBBBBB),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // _buildSubHeading(
                      //   title: 'Now Playing',
                      //   onTap: () {
                      //     // Navigator.pushNamed(context, nowPlayingTvSeriesRoute);
                      //   },
                      // ),
                      Text(
                        'Now Playing',
                        style: kHeading6,
                      ),
                      BlocBuilder<NowPlayingTvSeriesBloc,
                          NowPlayingTvSeriesState>(
                        builder: (_, state) {
                          if (state is NowPlayingTvSeriesLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is NowPlayingTvSeriesHasData) {
                            return TvSeriesList(
                              state.result,
                              key: const PageStorageKey<String>(
                                'listTvSeriesNowPlaying',
                              ),
                            );
                          } else if (state is NowPlayingTvSeriesError) {
                            return Center(
                              child: Text(state.message),
                            );
                          } else {
                            return const Center(
                              child: Text('Failed'),
                            );
                          }
                        },
                      ),
                      _buildSubHeading(
                        title: 'Popular',
                        onTap: () {
                          Navigator.pushNamed(context, popularTvSeriesRoute);
                        },
                      ),
                      BlocBuilder<PopularTvSeriesBloc, PopularTvSeriesState>(
                        builder: (_, state) {
                          if (state is PopularTvSeriesLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is PopularTvSeriesHasData) {
                            return TvSeriesList(
                              state.result,
                              key: const PageStorageKey<String>(
                                'listTvSeriesPopular',
                              ),
                            );
                          } else if (state is PopularTvSeriesError) {
                            return Center(
                              child: Text(state.message),
                            );
                          } else {
                            return const Center(
                              child: Text('Failed'),
                            );
                          }
                        },
                      ),
                      _buildSubHeading(
                        title: 'Top Rated',
                        onTap: () {
                          Navigator.pushNamed(context, topRatedTvSeriesRoute);
                        },
                      ),
                      BlocBuilder<TopRatedTvSeriesBloc, TopRatedTvSeriesState>(
                        builder: (_, state) {
                          if (state is TopRatedTvSeriesLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is TopRatedTvSeriesHasData) {
                            return TvSeriesList(
                              state.result,
                              key: const PageStorageKey<String>(
                                'listTvSeriesTopRated',
                              ),
                            );
                          } else if (state is TopRatedTvSeriesError) {
                            return Center(
                              child: Text(state.message),
                            );
                          } else {
                            return const Center(
                              child: Text('Failed'),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('See More'),
                Icon(Icons.arrow_forward_ios, color: Colors.black,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TvSeriesList extends StatelessWidget {
  final List<TvSeries> tvSeries;

  const TvSeriesList(this.tvSeries, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = tvSeries[index];

          return Container(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              key: const Key('tvSeriesItem'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  tvSeriesDetailRoute,
                  arguments: item.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${item.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
