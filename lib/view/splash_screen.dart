import 'package:flutter/material.dart';
import 'package:scienceblog/componetnt/my_Component.dart';
import 'package:scienceblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:scienceblog/view/main_screen.dart';
import 'package:scienceblog/componetnt/my_colors.dart';

class SplshScreen extends StatefulWidget {
  const SplshScreen({Key? key}) : super(key: key);

  @override
  State<SplshScreen> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplshScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(Assets.images.logo.path),
                  height: 180,
                ),
                const SizedBox(height: 30),
                const loading()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
