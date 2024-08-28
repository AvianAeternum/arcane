import 'package:arcane/arcane.dart';

bool v = false;
String? vv;
void main() {
  runApp(const ExampleArcaneApp());
}

class ExampleArcaneApp extends StatelessWidget {
  const ExampleArcaneApp({super.key});

  @override
  Widget build(BuildContext context) => const ArcaneApp(
        home: Home(),
        themeMode: ThemeMode.system,
      );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => Screen(
        header: const Bar(
          titleText: "Arcane",
        ),
        children: [
          Tile(
            leading: const Icon(BootstrapIcons.bodyText),
            title: Text("Text"),
            subtitle: Text("Text sizes & styles"),
            onPressed: () => Arcane.push(context, const ExampleText()),
          ),
          Tile(
            leading: const Icon(BootstrapIcons.gift),
            title: const Text("Buttons"),
            subtitle: const Text("Button styles w/o icons"),
            onPressed: () => Arcane.push(context, const ExampleButtons()),
          ),
          Tile(
            leading: const Icon(BootstrapIcons.cardList),
            title: const Text("Tiles"),
            subtitle: const Text("List Tiles"),
            onPressed: () => Arcane.push(context, const ExampleTiles()),
          ),
        ],
      );
}

class ExampleTiles extends StatelessWidget {
  const ExampleTiles({super.key});

  @override
  Widget build(BuildContext context) => const Screen(
        header: Bar(
          titleText: "Tiles",
        ),
        slivers: [
          Tile(
            title: Text("Sliver Tile"),
            subtitle: Text(
                "If you scroll down you will see that this sliver tile title / icon / trailing will act as a floating header while overtop of this description text. Basically \n\n\n This is still the description box."),
            leading: Text("L"),
            trailing: Text("T"),
            sliver: true,
          )
        ],
        children: [
          Tile(
            title: Text("Title"),
            subtitle: Text("Subtitle"),
            leading: Text("L"),
            trailing: Text("T"),
          ),
          Divider(
            height: 16,
          ),
          Tile(
            title: Text("Title"),
            leading: Text("L"),
            trailing: Text("T"),
          ),
          Divider(
            height: 16,
          ),
          Divider(
            height: 100,
          ),
          Divider(
            height: 100,
          ),
          Divider(
            height: 100,
          ),
          Divider(
            height: 16,
          ),
          Divider(
            height: 100,
          ),
          Divider(
            height: 100,
          ),
          Divider(
            height: 100,
          ),
          Divider(
            height: 16,
          ),
          Divider(
            height: 100,
          ),
          Divider(
            height: 100,
          ),
          Divider(
            height: 100,
          ),
        ],
      );
}

class ExampleText extends StatelessWidget {
  const ExampleText({super.key});

  @override
  Widget build(BuildContext context) => Screen(
        header: const Bar(
          titleText: "Text",
        ),
        children: [
          Divider(
            height: 16,
            child: Text("Basic"),
          ),
          Text("x9 Large", style: Theme.of(context).typography.x9Large),
          Text("x8 Large", style: Theme.of(context).typography.x8Large),
          Text("x7 Large", style: Theme.of(context).typography.x7Large),
          Text("x6 Large", style: Theme.of(context).typography.x6Large),
          Text("x5 Large", style: Theme.of(context).typography.x5Large),
          Text("x4 Large", style: Theme.of(context).typography.x4Large),
          Text("x3 Large", style: Theme.of(context).typography.x3Large),
          Text("x2 Large", style: Theme.of(context).typography.x2Large),
          Text("Large", style: Theme.of(context).typography.large),
          Text("Medium", style: Theme.of(context).typography.medium),
          Text("Small", style: Theme.of(context).typography.small),
          Text("xSmall", style: Theme.of(context).typography.xSmall),
          Divider(
            height: 16,
            child: Text("Headlines"),
          ),
          Text("Heading 1", style: Theme.of(context).typography.h1),
          Text("Heading 2", style: Theme.of(context).typography.h2),
          Text("Heading 3", style: Theme.of(context).typography.h3),
          Text("Heading 4", style: Theme.of(context).typography.h4),
          Divider(
            height: 16,
            child: Text("Modifiers"),
          ),
          Text("Lead", style: Theme.of(context).typography.lead),
          Text("Bold", style: Theme.of(context).typography.bold),
          Text("Black", style: Theme.of(context).typography.black),
          Text("Muted", style: Theme.of(context).typography.textMuted),
        ],
      );
}

class ExampleButtons extends StatelessWidget {
  const ExampleButtons({super.key});

  @override
  Widget build(BuildContext context) => Screen(
        header: const Bar(
          titleText: "Buttons",
        ),
        children: [
          ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(16),
                GhostButton(
                  onPressed: () {},
                  density: ButtonDensity.icon,
                  child: const Icon(BootstrapIcons.activity),
                ),
                const Gap(16),
                GhostButton(
                  child: Text("Ghost Button"),
                  onPressed: () {},
                ),
                Gap(16),
                GhostButton(
                  child: Text("Ghost w Icon"),
                  onPressed: () {},
                  leading: Icon(BootstrapIcons.activity),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(16),
                TextButton(
                  child: Icon(BootstrapIcons.activity),
                  onPressed: () {},
                  density: ButtonDensity.icon,
                ),
                const Gap(16),
                TextButton(
                  child: Text("Text Button"),
                  onPressed: () {},
                ),
                Gap(16),
                TextButton(
                  child: Text("Text w Icon"),
                  onPressed: () {},
                  leading: Icon(BootstrapIcons.activity),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(16),
                OutlineButton(
                  child: Icon(BootstrapIcons.activity),
                  onPressed: () {},
                  density: ButtonDensity.icon,
                ),
                const Gap(16),
                OutlineButton(
                  child: Text("Outline Button"),
                  onPressed: () {},
                ),
                Gap(16),
                OutlineButton(
                  child: Text("Outline w Icon"),
                  onPressed: () {},
                  leading: Icon(BootstrapIcons.activity),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(16),
                SecondaryButton(
                  child: Icon(BootstrapIcons.activity),
                  onPressed: () {},
                  density: ButtonDensity.icon,
                ),
                const Gap(16),
                SecondaryButton(
                  child: Text("Secondary Button"),
                  onPressed: () {},
                ),
                Gap(16),
                SecondaryButton(
                  child: Text("Secondary w Icon"),
                  onPressed: () {},
                  leading: Icon(BootstrapIcons.activity),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(16),
                PrimaryButton(
                  child: Icon(BootstrapIcons.activity),
                  onPressed: () {},
                  density: ButtonDensity.icon,
                ),
                const Gap(16),
                PrimaryButton(
                  child: Text("Primary Button"),
                  onPressed: () {},
                ),
                Gap(16),
                PrimaryButton(
                  child: Text("Primary w Icon"),
                  onPressed: () {},
                  leading: Icon(BootstrapIcons.activity),
                )
              ],
            )
          ].map((e) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: e,
              ))
        ],
      );
}
