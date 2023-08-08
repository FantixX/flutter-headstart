import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_headstart/screens.dart/firebase_screen.dart';
import 'package:flutter_headstart/utility/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:window_manager/window_manager.dart';

import 'riverpod/providers.dart';
import 'screens.dart/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("settings");
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(800, 600),
    minimumSize: Size(400, 300),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    //titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  var page = 0;

  @override
  void initState() {
    ref.read(pageViewControllerProvider).addListener(() {
      setState(() {
        page = ref.read(pageViewControllerProvider).page!.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageViewController = ref.watch(pageViewControllerProvider);

    return ValueListenableBuilder(
      valueListenable: Hive.box("settings").listenable(),
      builder: (context, value, child) =>
          DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: lightColorScheme,
              useMaterial3: true,
              textTheme: GoogleFonts.robotoTextTheme()),
          darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              useMaterial3: true,
              textTheme:
                  GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
              brightness: Brightness.dark),
          title: 'Flutter Demo',
          themeMode: ref.watch(appSettingsProvider).getThemeMode,
          home: child,
        );
      }),
      child: Scaffold(
        appBar: AppBar(
          leading: (page > 0)
              ? IconButton(
                  onPressed: () => pageViewController.previousPage(
                    duration: pageTransitionDuration,
                    curve: pageTransitionCurve,
                  ),
                  icon: const Icon(Icons.arrow_back),
                )
              : null,
          title:
              (page > 0) ? Text(configurationSections[page - 1].title) : null,
          actions: (page > 0 && page < configurationSections.length)
              ? [
                  IconButton(
                    onPressed: () => pageViewController.nextPage(
                      duration: pageTransitionDuration,
                      curve: pageTransitionCurve,
                    ),
                    icon: const Icon(Icons.arrow_forward),
                  )
                ]
              : null,
        ),
        body: PageView(
          controller: pageViewController,
          children: [
            const StartScreen(),
            ...configurationSections.map((e) => e.screen).toList()
          ],
        ),
      ),
    );
  }
}
