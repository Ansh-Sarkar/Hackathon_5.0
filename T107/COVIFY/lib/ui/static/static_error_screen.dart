import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';


class StaticErrorScreen extends StatelessWidget {
  final VoidCallback onRetry;
  final ImageProvider image;
  final String title, actionText, desc;
  final double imageWidthFrac, imageHeightFrac;

  const StaticErrorScreen({
    Key key,
    this.onRetry,
    this.image,
    this.title,
    this.actionText,
    this.desc,
    this.imageWidthFrac,
    this.imageHeightFrac,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    // [ScreenTypeLayout] is used to build the widgets based on the user's device screen
    return ScreenTypeLayout.builder(
      // Mobile Screen Layout
      mobile: (BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Adds the Image to the Column if provided
            if (image != null)
              Container(
                height: DeviceUtils.getScaledHeight(
                    context, imageHeightFrac ?? 0.35),
                width:
                    DeviceUtils.getScaledWidth(context, imageWidthFrac ?? 0.8),
                decoration: BoxDecoration(
                  image: DecorationImage(image: image, fit: BoxFit.contain),
                ),
              ),

            // Vertical Spacing
            SizedBoxHeightWidget(screenHeight / 20),

            // Adds the title to the Column if provided
            if (title != null)
              Padding(
                padding: const EdgeInsets.all(Dimens.verticalPadding),
                child: Text(
                  '$title',
                  textAlign: TextAlign.center,
                  style: TextStyles.errorHeadingTextStlye.copyWith(
                    fontSize: screenWidth / 18,
                      fontFamily: 'pSans'
                  ),
                ),
              ),

            // Vertical Spacing
            SizedBoxHeightWidget(screenHeight / 250),

            // Adds the desctiption to the Column if provided
            if (desc != null)
              Padding(
                padding: const EdgeInsets.all(Dimens.verticalPadding),
                child: Text(
                  '$desc',
                  textAlign: TextAlign.center,
                  style: TextStyles.errorDescriptionTextStlye.copyWith(
                    fontSize: screenWidth / 25,
                      fontFamily: 'pSans'
                  ),
                ),
              ),

            // Vertical Spacing
            SizedBoxHeightWidget(screenHeight / 50),

            // Adds the Button to the Column if provided and attaches
            // retry action to onTap attribute of GestureDetector
            if (actionText != null && onRetry != null)
              GestureDetector(
                onTap: onRetry,
                child: Container(
                  width: screenWidth / 1.2,
                  height: screenHeight / 15,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(-2, 10),
                        blurRadius: 10,
                        color: AppColors.boxShadowColor,
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenWidth / 45),
                    ),
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      '$actionText'.toUpperCase(),
                      style: TextStyles.errorButtonTextStyle.copyWith(
                        fontSize: screenWidth / 25,
                          fontFamily: 'pSans'
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),

      // Desktop Screen Layout
      desktop: (BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Adds the Image to the Column if provided
            if (image != null)
              Container(
                height: DeviceUtils.getScaledHeight(
                    context, imageHeightFrac ?? 0.45),
                width:
                    DeviceUtils.getScaledWidth(context, imageWidthFrac ?? 0.8),
                decoration: BoxDecoration(
                  image: DecorationImage(image: image, fit: BoxFit.contain),
                ),
              ),

            // Vertical Spacing
            SizedBoxHeightWidget(screenHeight / 20),

            // Adds the title to the Column if provided
            if (title != null)
              Padding(
                padding: const EdgeInsets.all(Dimens.verticalPadding),
                child: Text(
                  '$title',
                  textAlign: TextAlign.center,
                  style: TextStyles.errorHeadingTextStlye.copyWith(
                    fontSize: screenHeight / 35,
                      fontFamily: 'pSans'
                  ),
                ),
              ),

            // Vertical Spacing
            // SizedBoxHeightWidget(screenHeight / 250),

            // Adds the desctiption to the Column if provided
            if (desc != null)
              Padding(
                padding: const EdgeInsets.all(Dimens.verticalPadding),
                child: Text(
                  '$desc',
                  textAlign: TextAlign.center,
                  style: TextStyles.errorDescriptionTextStlye.copyWith(
                    fontSize: screenWidth / 55,
                      fontFamily: 'pSans'
                  ),
                ),
              ),

            // Vertical Spacing
            SizedBoxHeightWidget(screenHeight / 50),

            // Adds the Button to the Column if provided and attaches
            // retry action to onTap attribute of GestureDetector
            if (actionText != null && onRetry != null)
              GestureDetector(
                onTap: onRetry,
                child: Container(
                  width: screenWidth / 3,
                  height: screenHeight / 15,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(-2, 10),
                        blurRadius: 10,
                        color: AppColors.boxShadowColor,
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenWidth / 45),
                    ),
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      '$actionText'.toUpperCase(),
                      style: TextStyles.errorButtonTextStyle.copyWith(
                        fontSize: screenHeight / 25,
                          fontFamily: 'pSans'
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
