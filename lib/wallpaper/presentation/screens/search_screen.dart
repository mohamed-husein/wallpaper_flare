import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../../../core/widgets/custom_text.dart';
import 'wallpaper_details_screen.dart';

import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/divider.dart';
import '../../business/bloc/bloc/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => sl<SearchBloc>(),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: CustomText.bodyLarge('Search', context: context),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.pW22),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DividerWidget(height: AppSizes.sizedBoxHeightMedium),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSizes.br10),
                            border:
                                Border.all(color: ThemeColorLight.greyBorder)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: AppSizes.pW12),
                                child: TextField(
                                  onSubmitted: (value) {
                                    context.read<SearchBloc>().add(
                                        GetSearchNewsEvent(controller.text));
                                  },
                                  controller: controller,
                                  style: Theme.of(context).textTheme.bodySmall,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context
                                    .read<SearchBloc>()
                                    .add(GetSearchNewsEvent(controller.text));
                              },
                              child: Container(
                                height: AppSizes.mediumButtonHeight,
                                width: AppSizes.pW60,
                                decoration: BoxDecoration(
                                    color: ThemeColorLight.primaryColor,
                                    borderRadius:
                                        BorderRadius.circular(AppSizes.br10)),
                                child: const Icon(
                                  Icons.search,
                                  color: ThemeColorLight.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DividerWidget(height: AppSizes.sizedBoxHeightSmall),
                      if (state is SearchLoading)
                        LinearProgressIndicator(
                            color: ThemeColorLight.primaryColor),
                      if (state is SearchLoaded)
                        if (state.wallpaper.isEmpty)
                          const Center(
                              child: Text(
                            "Empty",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                      if (state is SearchLoaded)
                        StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.wallpaper.length,
                          staggeredTileBuilder: (index) =>
                              const StaggeredTile.fit(2),
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return WallpaperDetailsScreen(
                                      wallpaperModel: state.wallpaper[index],
                                    );
                                  },
                                ), (route) => false);
                              },
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            state.wallpaper[index].image))),
                              ),
                            );
                          },
                        )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
