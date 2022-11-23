import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/global/theme_color/theme_color_light.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/custom_text.dart';
import '../../business/cubit/wallpaper_cubit.dart';
import '../../data/model/wallpaper_model.dart';
import 'home_screen.dart';

class WallpaperDetailsScreen extends StatelessWidget {
  const WallpaperDetailsScreen({
    super.key,
    required this.wallpaperModel,
  });

  final WallpaperModel wallpaperModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColorLight.white,
      child: SafeArea(
        child: BlocProvider(
          create: (context) => sl<WallpaperCubit>(),
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(AppSizes.pH10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSizes.br15),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(wallpaperModel.image))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppSizes.pH15, right: AppSizes.pW16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return const HomeScreen();
                              },
                            ), (route) => false);
                          },
                          child: CircleAvatar(
                            radius: AppSizes.br20,
                            backgroundColor: Colors.black.withOpacity(.5),
                            child: const Icon(
                              Icons.close,
                              color: ThemeColorLight.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppSizes.sizedBoxHeightTiny,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.pW22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.bodyLarge(
                          wallpaperModel.tags,
                          context: context,
                          textAlign: TextAlign.left,
                        ),
                        CustomText.labelSmall(wallpaperModel.user,
                            context: context),
                        SizedBox(
                          height: AppSizes.sizedBoxHeightSmall,
                        ),
                        CustomText.labelLarge('Size', context: context),
                        CustomText.labelMedium(
                            '${wallpaperModel.imageHeight} x ${wallpaperModel.imageWidth}',
                            context: context),
                        SizedBox(
                          height: AppSizes.sizedBoxHeightSmall,
                        ),
                        CustomText.labelLarge('DownLoads', context: context),
                        CustomText.labelMedium(
                            wallpaperModel.downloads.toString(),
                            context: context),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.pW22),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: AppSizes.mediumButtonHeight,
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<WallpaperCubit>(context)
                                    .manageDownLoads(
                                        wallpaperModel.image, context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ThemeColorLight.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppSizes.br15))),
                              child: CustomText(
                                AppConstants.downLoad,
                                textStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                context: context,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: AppSizes.pW16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.sizedBoxHeightTiny,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
