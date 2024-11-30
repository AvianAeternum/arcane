import 'package:arcane/arcane.dart';

bool v = false;
String? vv;
void main() {
  runApp(const ExampleArcaneApp());
}

class ExampleArcaneApp extends StatelessWidget {
  const ExampleArcaneApp({super.key});

  @override
  Widget build(BuildContext context) => ArcaneApp(
        home: ExampleNavigationScreen(),
        theme: ArcaneTheme(
            themeMode: ThemeMode.system,
            scheme: ContrastedColorScheme.fromScheme(ColorSchemes.violet)),
      );
}

class ExampleNavigationScreen extends StatelessWidget {
  const ExampleNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) => FillScreen(
          child: LoginContent(buttons: [
        GoogleSignInButton(onPressed: () {
          print("Google Signed In");
        }),
        AppleSignInButton(onPressed: () {
          print("Apple Signed In");
        }),
        EmailPasswordSignIn(onPressed: () {
          print("Email Signed In");
        })
      ]));
}
