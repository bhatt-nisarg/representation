import 'package:flutter/material.dart';
import 'infrastructure/static_profile_repository.dart';
import 'infrastructure/link_opener.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MCP-like light theme: neutral grays + blue accent
    const Color white = Colors.white;
    const Color gray900 = Color(0xFF111827);
    const Color gray700 = Color(0xFF374151);
    const Color gray200 = Color(0xFFE5E7EB);
    const Color blue600 = Color(0xFF2563EB);

    return MaterialApp(
      title: 'Nisarg • Portfolio',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: blue600,
          onPrimary: white,
          secondary: blue600,
          onSecondary: white,
          error: Color(0xFFB91C1C),
          onError: white,
          background: white,
          onBackground: gray900,
          surface: white,
          onSurface: gray900,
        ),
        scaffoldBackgroundColor: white,
        appBarTheme: const AppBarTheme(
          backgroundColor: white,
          foregroundColor: gray900,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: gray900,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: gray900, fontWeight: FontWeight.w800),
          displayMedium: TextStyle(color: gray900, fontWeight: FontWeight.w800),
          displaySmall: TextStyle(color: gray900, fontWeight: FontWeight.w800),
          headlineLarge: TextStyle(color: gray900, fontWeight: FontWeight.w700),
          headlineMedium:
              TextStyle(color: gray900, fontWeight: FontWeight.w700),
          headlineSmall: TextStyle(color: gray900, fontWeight: FontWeight.w700),
          titleLarge: TextStyle(color: gray900, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(color: gray900, fontWeight: FontWeight.w600),
          titleSmall: TextStyle(color: gray900, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(color: gray900, height: 1.6),
          bodyMedium: TextStyle(color: gray900, height: 1.6),
          bodySmall: TextStyle(color: gray700, height: 1.5),
          labelLarge: TextStyle(color: gray900, fontWeight: FontWeight.w600),
          labelMedium: TextStyle(color: gray900),
        ),
        dividerTheme:
            const DividerThemeData(color: gray200, space: 1, thickness: 1),
        iconTheme: const IconThemeData(color: gray700),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: blue600,
            foregroundColor: white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: blue600,
            side: const BorderSide(color: gray200, width: 1),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: blue600,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: false,
          labelStyle: const TextStyle(color: gray700),
          hintStyle: const TextStyle(color: gray700),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: gray200),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: blue600, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: FutureBuilder(
        future: const StaticProfileRepository().fetchProfile(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          final profile = snapshot.data!;
          return HomePage(
            profile: profile,
            linkOpener: UrlLauncherLinkOpener(),
          );
        },
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF2563EB),
          onPrimary: Colors.white,
          secondary: Color(0xFF2563EB),
          onSecondary: Colors.white,
          error: Color(0xFFEF4444),
          onError: Colors.white,
          background: Color(0xFF0B0F19),
          onBackground: Colors.white,
          surface: Color(0xFF111827),
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFF0B0F19),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0B0F19),
          foregroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        textTheme: const TextTheme(
          displayLarge:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          displayMedium:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          displaySmall:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          headlineLarge:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          headlineMedium:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          headlineSmall:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          titleLarge:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          titleMedium:
              TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
          titleSmall:
              TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(color: Colors.white, height: 1.6),
          bodyMedium: TextStyle(color: Colors.white70, height: 1.6),
          bodySmall: TextStyle(color: Colors.white60, height: 1.5),
          labelLarge: TextStyle(color: Colors.white),
          labelMedium: TextStyle(color: Colors.white70),
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xFF1F2937),
          thickness: 1,
          space: 1,
        ),
        iconTheme: const IconThemeData(color: Colors.white70),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2563EB),
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF93C5FD),
            side: const BorderSide(color: Color(0xFF1F2937), width: 1),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF93C5FD),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: false,
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF1F2937)),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
