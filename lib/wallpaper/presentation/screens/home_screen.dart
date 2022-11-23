import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import 'computer_images_screen.dart';
import 'food_images_screen.dart';
import 'music_images_screen.dart';
import 'sport_images_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    //BlocProvider.of<WallpaperCubit>(context).savedDownLoadedWallpaper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: AppSizes.heightFullScreen,
                      color: ThemeColorLight.primaryOpacityColor,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 50,
                          ),
                          Container(),
                          const Spacer(),
                          TabBar(
                            padding:
                                EdgeInsets.symmetric(vertical: AppSizes.pH25),
                            isScrollable: true,
                            controller: tabController,
                            tabs: const [
                              Tab(
                                text: AppConstants.computer,
                              ),
                              Tab(
                                text: AppConstants.sports,
                              ),
                              Tab(
                                text: AppConstants.music,
                              ),
                              Tab(
                                text: AppConstants.food,
                              ),
                            ],
                          ),
                          const Spacer(),
                          RotatedBox(
                            quarterTurns: 1,
                            child: SvgPicture.asset(
                              AppAssets.menu,
                              width: 20,
                              height: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: AppSizes.heightFullScreen,
                    width: double.infinity,
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        ComputerImagesScreen(),
                        SportImagesScreen(),
                        MusicImagesScreen(),
                        FoodImagesScreen(),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
