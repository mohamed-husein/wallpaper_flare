import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'wallpaper_details_screen.dart';

import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/custom_text.dart';
import '../../business/cubit/wallpaper_cubit.dart';

class FoodImagesScreen extends StatelessWidget {
  const FoodImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => sl<WallpaperCubit>()..getFoodWallpaper(),
        child: Scaffold(
          body: SizedBox(
            height: AppSizes.heightFullScreen,
            width: AppSizes.heightFullScreen,
            child: Column(
              children: [
                SizedBox(
                  height: AppSizes.pH15,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: AppSizes.pW16),
                    child: SvgPicture.asset(AppAssets.search),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomText.titleMedium(AppConstants.food,
                      context: context),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomText.titleLarge(AppConstants.wallpaper,
                      context: context),
                ),
                Expanded(
                  child: BlocBuilder<WallpaperCubit, WallpaperState>(
                    builder: (context, state) {
                      WallpaperCubit cubit =
                          BlocProvider.of<WallpaperCubit>(context);
                      if (state is GetFoodWallpaperSuccessState) {
                        return ListView.builder(
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return WallpaperDetailsScreen(
                                  wallpaperModel: cubit.foodWallpaper[index],
                                );
                              }));
                            },
                            child: Container(
                              height: 300,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          cubit.foodWallpaper[index].image))),
                            ),
                          ),
                          itemCount: cubit.foodWallpaper.length,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ThemeColorLight.primaryColor,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
