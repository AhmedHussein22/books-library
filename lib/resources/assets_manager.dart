const String imagePath = 'assets/images';
const String imageSvgPath = 'assets/svgs';
const String iconSvgPath = 'assets/icons';
const String lottiFilesPath = 'assets/jsons/lottifiles';

//* This file contains the images assets paths used in the application.
class ImageAssets {
  ImageAssets._();
  // ********* svg *********
  static const String logo = '$imagePath/app.svg';
  static const String oldLogo = '$imagePath/old_logo.svg';

  // ********* png *********
  static const String logoPNG = '$imagePath/app_icon.png';
  static const String avatarImagePlaceholder = '$imagePath/app_icon.png';
  static const String defaultImagePlaceholder = '$imagePath/app_icon.png';
}

//* This file contains the icons assets paths used in the application.

class IconAssets {
  IconAssets._();
  static const String addIcon = '$iconSvgPath/plus.svg';
}

//* This file contains the lottie files assets paths used in the application.
class JsonAssets {
  JsonAssets._();
  static const String splashLottieFile = '$lottiFilesPath/splash_lottie.json';
}
