import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
import 'app_assets.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final pageFlipKey = GlobalKey<PageFlipBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: PageFlipBuilder(
        key: pageFlipKey,
        frontBuilder: (_) => LightHomePage(
          onFlip: () => pageFlipKey.currentState?.flip(),
        ),
        backBuilder: (_) => DarkHomePage(
          onFlip: () => pageFlipKey.currentState?.flip(),
        ),
        maxTilt: 0.003,
        maxScale: 0.2,
        onFlipComplete: (isFrontSide) => debugPrint('front: $isFrontSide'),
      ),
    );
  }
}

class LightHomePage extends StatelessWidget {
  const LightHomePage({super.key, this.onFlip});
  final VoidCallback? onFlip;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          brightness: Brightness.light,
          textTheme: TextTheme(
            displaySmall: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.black87, fontWeight: FontWeight.w600),
          )),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: kIsWeb
              ? BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5),
                )
              : null,
          child: Column(
            children: [
              const ProfileHeader(prompt: 'Hello,\nsunshine!'),
              const Spacer(),
              SvgPicture.asset(
                AppAssets.forestDay,
                semanticsLabel: 'Forest',
                width: 300,
                height: 300,
              ),
              const Spacer(),
              BottomFlipIconButton(onFlip: onFlip),
            ],
          ),
        ),
      ),
    );
  }
}

class DarkHomePage extends StatelessWidget {
  const DarkHomePage({super.key, this.onFlip});
  final VoidCallback? onFlip;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(
            displaySmall: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          )),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: kIsWeb
              ? BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5),
                )
              : null,
          child: Column(
            children: [
              const ProfileHeader(prompt: 'Good night,\nsleep tight!'),
              const Spacer(),
              SvgPicture.asset(
                AppAssets.forestNight,
                semanticsLabel: 'Forest',
                width: 300,
                height: 300,
              ),
              const Spacer(),
              BottomFlipIconButton(onFlip: onFlip),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionsDrawer extends StatelessWidget {
  const OptionsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer();
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.prompt});
  final String prompt;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        children: [
          Text(prompt, style: Theme.of(context).textTheme.displaySmall),
          const Spacer(),
          SvgPicture.asset(
            AppAssets.profileIcon,
            semanticsLabel: 'Profile',
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}

class BottomFlipIconButton extends StatelessWidget {
  const BottomFlipIconButton({super.key, this.onFlip});
  final VoidCallback? onFlip;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onFlip,
          icon: const Icon(Icons.flip),
        )
      ],
    );
  }
}