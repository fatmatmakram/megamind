// // ignore_for_file: use_build_context_synchronously, deprecated_member_use, unnecessary_null_comparison
//
// part of 'UtilsImports.dart';
//
// class Utils {
//   static Future<bool> deleteAccount() async {
//     Go.back();
//     Go.navigatorKey.currentContext?.read<AuthCubit>().onUpdateAuth(false);
//     Utils.clearSavedData();
//     GlobalState.instance.set("token", "");
//     Go.offAllNamed(NamedRoutes.login);
//     return true;
//   }
//
//   static Future<bool> unAuthFunc(BuildContext context) async {
//     clearSavedData();
//     context.read<AuthCubit>().onUpdateAuth(false);
//     Go.offAllNamed(NamedRoutes.login);
//     return true;
//   }
//
//   static Future<bool> needActiveFunc(BuildContext context) async {
//     context.read<AuthCubit>().onUpdateAuth(false);
//     // Go.offAllNamed(NamedRoutes.activeAccount);
//     return true;
//   }
//
//   static void setCurrentUserData(UserModel model) async {
//     Go.navigatorKey.currentContext?.read<UserCubit>().onUpdateUserData(model);
//     Go.offAllNamed(NamedRoutes.home, arguments: const Home(index: 0));
//     Go.navigatorKey.currentContext!.read<AuthCubit>().onUpdateAuth(true);
//   }
//
//   static void loginAsVisitor() {
//     Go.navigatorKey.currentContext!.read<AuthCubit>().onUpdateAuth(false);
//     Go.offAllNamed(NamedRoutes.home, arguments: const Home(index: 0));
//   }
//
//   static Future<void> saveUserData(UserModel model) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString("user", json.encode(model.toJson()));
//   }
//
//   static void changeLanguage(String lang, BuildContext context) {
//     context.read<LangCubit>().onUpdateLanguage(lang);
//   }
//
//   static UserModel getSavedUser({required BuildContext context}) {
//     return context.read<UserCubit>().state.model;
//   }
//
//   static Future<String?> getDeviceId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("deviceId");
//   }
//
//   static Future<void> setDeviceId(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString("deviceId", token);
//   }
//
//   static void clearSavedData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.clear();
//     if (await FlutterBackgroundService().isRunning()) {
//       FlutterBackgroundService().invoke('stopService');
//       prefs.get("isLoc") == false;
//     } else {}
//
//   }
//
//   static void launchURL({required String url}) async {
//     if (!url.toString().startsWith("https")) {
//       url = "https://$url";
//     }
//     await launch(url);
//
//     // if (await canLaunch(url)) {
//     // } else {
//     //   showSnackBar("من فضلك تآكد من الرابط");
//     // }
//   }
//
//   static Future<Position?> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // CustomToast.showSimpleToast(
//       //   msg: AppString.location_services_dis,
//       // );
//       return null;
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         showSnackBar(' AppString.location_services_dis');
//
//         return null;
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       showSnackBar(
//           'Location permissions are permanently denied, we cannot request permissions');
//       return null;
//     }
//
//     return await Geolocator.getCurrentPosition();
//   }
//
//   static void launchWhatsApp(phone) async {
//     String message = 'مرحبا بك';
//     if (phone.startsWith("00966")) {
//       phone = phone.substring(5);
//     }
//     var whatsAppUrl = "whatsapp://send?phone=+966$phone&text=$message";
//     debugPrint(whatsAppUrl);
//     if (await canLaunch(whatsAppUrl)) {
//       await launch(whatsAppUrl);
//     } else {
//       throw 'حدث خطأ ما';
//     }
//   }
//
//   static void launchYoutube({required String url}) async {
//     if (Platform.isIOS) {
//       if (await canLaunch(url)) {
//         await launch(url, forceSafariVC: false);
//       } else {
//         if (await canLaunch(url)) {
//           await launch(url);
//         } else {
//           throw 'Could not launch $url';
//         }
//       }
//     } else {
//       if (await canLaunch(url)) {
//         await launch(url);
//       } else {
//         throw 'Could not launch $url';
//       }
//     }
//   }
//
//   static void callPhone({phone}) async {
//     await launch("tel:$phone");
//   }
//
//   static void sendMail(mail) async {
//     await launch("mailto:$mail");
//   }
//
//   static void shareApp(url) {
//     CustomLoading.showLoadingView();
//     Share.share(url).whenComplete(() {
//       EasyLoading.dismiss();
//     });
//   }
//
//   static Future<File?> getImage() async {
//     final ImagePicker picker = ImagePicker();
//     XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       File imageFile = File(image.path);
//       return imageFile;
//     }
//     return null;
//   }
//
//   static Future<List<File>> getImages() async {
//     final ImagePicker picker = ImagePicker();
//     final List<XFile> result = await picker.pickMultiImage();
//     if (result != null) {
//       List<File> files = result.map((e) => File(e.path)).toList();
//       return files;
//     } else {
//       return [];
//     }
//   }
//
//   static Future<File?> getVideo() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? video = await picker.pickVideo(source: ImageSource.gallery);
//     if (video != null) {
//       File imageFile = File(video.path);
//       return imageFile;
//     }
//     return null;
//   }
//
//   static void copToClipboard({
//     required String text,
//     required GlobalKey<ScaffoldState> scaffold,
//     required BuildContext context,
//   }) {
//     if (text.trim().isEmpty) {
//       showSnackBar("لا يوجد بيانات للنسخ");
//       return;
//     } else {
//       Clipboard.setData(ClipboardData(text: text)).then((value) {
//         showSnackBar("تم النسخ بنجاح");
//       });
//     }
//   }
//
//   static String convertDigitsToLatin(String s) {
//     var sb = StringBuffer();
//     for (int i = 0; i < s.length; i++) {
//       switch (s[i]) {
//         //Arabic digits
//         case '\u0660':
//           sb.write('0');
//           break;
//         case '\u0661':
//           sb.write('1');
//           break;
//         case '\u0662':
//           sb.write('2');
//           break;
//         case '\u0663':
//           sb.write('3');
//           break;
//         case '\u0664':
//           sb.write('4');
//           break;
//         case '\u0665':
//           sb.write('5');
//           break;
//         case '\u0666':
//           sb.write('6');
//           break;
//         case '\u0667':
//           sb.write('7');
//           break;
//         case '\u0668':
//           sb.write('8');
//           break;
//         case '\u0669':
//           sb.write('9');
//           break;
//         default:
//           sb.write(s[i]);
//           break;
//       }
//     }
//     return sb.toString();
//   }
// }
