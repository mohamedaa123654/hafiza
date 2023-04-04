import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/app/network_info.dart';
import 'package:hafiza/presentation/controller/prayer_time/prayer_time_controller.dart';
import 'package:hafiza/presentation/resources/routes_manager.dart';
import 'package:hafiza/presentation/screens/main/widgets/prayer_count.dart';
import 'package:hafiza/presentation/screens/main/widgets/qiblah_widget.dart';
import 'package:hafiza/presentation/screens/qiblah_screen/qiblah_screen.dart';
import 'package:hafiza/presentation/resources/assets_manager.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:hafiza/presentation/resources/styles_manager.dart';
import 'package:hafiza/presentation/widgets/custom_background.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sizer/sizer.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class MainView extends StatelessWidget {
  MainView({super.key});
  PrayerTimeController controller = Get.put(PrayerTimeController(
      Get.put<NetworkInfo>(
          NetworkInfoImpl(Get.put(InternetConnectionChecker())))));

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      controller: controller,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const PrayerCount(),
              Padding(
                  padding: EdgeInsets.only(top: 5.w),
                  child: Container(
                    padding: EdgeInsets.all(1.5.w),
                    height: 32.w,
                    width: 100.w,
                    decoration: containerStyle(ColorManager.white),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.prayerTimeRoute);
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 1.w),
                                child: Container(
                                  width: 18.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          width: 2,
                                          color: ColorManager.lightGrey)),
                                  child: Image.asset(ImageAssets.logo),
                                ),
                              ),
                              Text(
                                'مواقيت الصلاة',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.grey,
                                    fontSize: 9.sp),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )),
              // LoadingAnimatedButton(
              //   child: Text(
              //     "Loading",
              //     style: TextStyle(
              //         color: Colors.indigo,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 16),
              //   ),
              //   color: Colors.indigo,
              //   onTap: () => print("hi"),
              // ),
              SizedBox(
                width: 100.w,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => QiblahScreen(
                        // controller: controller,
                        ));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.w),
                    child: Container(
                      width: 100,
                      decoration: containerStyle(ColorManager.white),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Text(
                                'القبلة',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.darkPrimary,
                                    fontSize: 16.sp),
                              ),
                            ),
                            // Text(
                            //   "${qiblahDirection.direction.toInt()}°",
                            //   style: const TextStyle(color: Colors.white, fontSize: 24),
                            // ),

                            SizedBox(
                              width: 60.w,
                              child: Center(
                                child: QiblahWidget(
                                  height: 30.w,
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingAnimatedButton extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final Function() onTap;
  final double width;
  final double height;

  final Color color;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  const LoadingAnimatedButton(
      {Key? key,
      required this.child,
      required this.onTap,
      this.width = 200,
      this.height = 50,
      this.color = Colors.indigo,
      this.borderColor = Colors.white,
      this.borderRadius = 15.0,
      this.borderWidth = 3.0,
      this.duration = const Duration(milliseconds: 1500)})
      : super(key: key);

  @override
  State<LoadingAnimatedButton> createState() => _LoadingAnimatedButtonState();
}

class _LoadingAnimatedButtonState extends State<LoadingAnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(
        widget.borderRadius,
      ),
      splashColor: widget.color,
      child: CustomPaint(
        painter: LoadingPainter(
            animation: _animationController,
            borderColor: widget.borderColor,
            borderRadius: widget.borderRadius,
            borderWidth: widget.borderWidth,
            color: widget.color),
        child: Container(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(5.5),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class LoadingPainter extends CustomPainter {
  final Animation animation;
  final Color color;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  LoadingPainter(
      {required this.animation,
      this.color = Colors.orange,
      this.borderColor = Colors.white,
      this.borderRadius = 15.0,
      this.borderWidth = 3.0})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..shader = SweepGradient(
              colors: [
                color.withOpacity(.25),
                color,
              ],
              startAngle: 0.0,
              endAngle: vector.radians(180),
              stops: const [.75, 1.0],
              transform:
                  GradientRotation(vector.radians(360.0 * animation.value)))
          .createShader(rect);

    final path = Path.combine(
        PathOperation.xor,
        Path()
          ..addRRect(
              RRect.fromRectAndRadius(rect, Radius.circular(borderRadius))),
        Path()
          ..addRRect(RRect.fromRectAndRadius(
              rect.deflate(3.5), Radius.circular(borderRadius))));
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            rect.deflate(1.5), Radius.circular(borderRadius)),
        Paint()
          ..color = borderColor
          ..strokeWidth = borderWidth
          ..style = PaintingStyle.stroke);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
