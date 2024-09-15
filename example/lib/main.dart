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
            leading: const Icon(Icons.text_aa),
            title: Text("Text"),
            subtitle: Text("Text sizes & styles"),
            onPressed: () => Arcane.push(context, const ExampleText()),
          ),
          Tile(
            leading: const Icon(Icons.gift),
            title: const Text("Buttons"),
            subtitle: const Text("Button styles w/o icons"),
            onPressed: () => Arcane.push(context, const ExampleButtons()),
          ),
          Tile(
            leading: const Icon(Icons.cards),
            title: const Text("Tiles"),
            subtitle: const Text("List Tiles"),
            onPressed: () => Arcane.push(context, const ExampleTiles()),
          ),
          Tile(
            leading: const Icon(Icons.menu_ionic),
            title: const Text("Bottom Bar"),
            subtitle: const Text("Example bottom bar navigation"),
            onPressed: () => Arcane.push(context, const ExampleBottomBar()),
          ),
          Tile(
            leading: const Icon(Icons.diamond),
            title: const Text("Dialogs"),
            subtitle: const Text("Dialog confirms and whatnot"),
            onPressed: () => Arcane.push(context, const ExampleDialogs()),
          ),
          Tile(
            leading: const Icon(Icons.file),
            title: const Text("Sheets"),
            subtitle: const Text("Modal sheets"),
            onPressed: () => Arcane.push(context, const ExampleSheets()),
          ),
          Tile(
            leading: const Icon(Icons.bell),
            title: const Text("Toast"),
            subtitle: const Text("Toast notifications"),
            onPressed: () => Arcane.push(context, const ExampleToasts()),
          ),
          Tile(
            leading: const Icon(Icons.menu_ionic),
            title: const Text("Menus"),
            subtitle: const Text("Context & Dropdown Menus"),
            onPressed: () => Arcane.push(context, const ExampleMenus()),
          ),
          Tile(
            leading: const Icon(Icons.bell),
            title: const Text("Icons"),
            subtitle:
                const Text("Quick Icons forwarded from Bootstrap & Phosphor"),
            onPressed: () => Arcane.push(context, const ExampleIcons()),
          )
        ],
      );
}

Map<String, IconData> _icons = {};

class ExampleIcons extends StatelessWidget {
  const ExampleIcons({super.key});

  @override
  Widget build(BuildContext context) => Screen(
        header: const Bar(
          titleText: "Icons",
        ),
        slivers: [
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                MapEntry<String, IconData> entry =
                    _icons.entries.elementAt(index);
                return Tooltip(
                    child: Icon(entry.value), tooltip: Text(entry.key));
              }),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 50)),
        ],
      );
}

class ExampleMenus extends StatelessWidget {
  const ExampleMenus({super.key});

  @override
  Widget build(BuildContext context) => const Screen(
        header: Bar(
          titleText: "Menus",
          trailing: [
            PopupMenu(icon: Icons.dots_three, items: [
              MenuButton(child: Text("Item 1")),
              MenuButton(child: Text("Item 2")),
              MenuButton(
                subMenu: [
                  MenuButton(child: Text("Item 5")),
                  MenuButton(child: Text("Item 6")),
                  MenuButton(child: Text("Item 7")),
                  MenuButton(
                    subMenu: [
                      MenuButton(child: Text("Item 8")),
                      MenuButton(child: Text("Item 9")),
                      MenuButton(child: Text("Item 10"))
                    ],
                    child: Text("Group 2"),
                  )
                ],
                child: Text("Group 1"),
              ),
              MenuButton(child: Text("Item 4"))
            ])
          ],
        ),
        children: [
          ContextMenu(
              child: Tile(
                leading: Icon(Icons.activity_light),
                title: Text("Right Click Me!"),
                subtitle: Text("Or long press on mobile"),
              ),
              items: [
                MenuButton(child: Text("Im a menu item")),
                MenuButton(
                  child: Text("Im a menu item too!"),
                  subMenu: [
                    MenuButton(child: Text("Im a sub menu item")),
                    MenuButton(child: Text("Im a sub menu item 2")),
                    MenuButton(child: Text("Im a sub menu item 3")),
                  ],
                ),
              ]),
          ContextMenu(
              child: Tile(
                leading: Icon(Icons.activity_light),
                title: Text("Right Click Me!"),
                subtitle: Text("Or long press on mobile"),
              ),
              items: [
                MenuButton(child: Text("Im a menu item")),
                MenuButton(
                  child: Text("Im a menu item too!"),
                  subMenu: [
                    MenuButton(child: Text("Im a sub menu item")),
                    MenuButton(child: Text("Im a sub menu item 2")),
                    MenuButton(child: Text("Im a sub menu item 3")),
                  ],
                ),
              ])
        ],
      );
}

class ExampleToasts extends StatelessWidget {
  const ExampleToasts({super.key});

  @override
  Widget build(BuildContext context) => Screen(
        header: const Bar(
          titleText: "Dialogs",
        ),
        children: [
          Center(
            child: Column(
              children: [
                PrimaryButton(
                    child: const Text("Bottom Left Widget"),
                    onPressed: () => Toast(
                          location: ToastLocation.bottomLeft,
                          builder: (context) => const Text("Bottom Left"),
                        ).open(context)),
              ],
            ),
          )
        ],
      );
}

class ExampleDialogs extends StatelessWidget {
  const ExampleDialogs({super.key});

  @override
  Widget build(BuildContext context) => Screen(
        header: const Bar(
          titleText: "Dialogs",
        ),
        children: [
          Center(
            child: Column(
              children: [
                PrimaryButton(
                    child: const Text("Alert Dialog"),
                    onPressed: () => DialogConfirm(
                          title: "Alert Dialog",
                          description: "This is a text description",
                          confirmText: "Yes",
                          cancelText: "Nope",
                          onConfirm: () => print("Confirmed"),
                        ).open(context)),
                const Gap(16),
                PrimaryButton(
                    child: const Text("Text Input Dialog"),
                    onPressed: () => DialogText(
                          title: "Input Dialog",
                          description: "This is a text description",
                          confirmText: "Yes",
                          cancelText: "Nope",
                          onConfirm: (x) => print("Input $x"),
                        ).open(context)),
              ],
            ),
          )
        ],
      );
}

class ExampleSheets extends StatelessWidget {
  const ExampleSheets({super.key});

  @override
  Widget build(BuildContext context) => Screen(
        header: const Bar(
          titleText: "Sheets",
        ),
        children: [
          Center(
            child: Column(
              children: [
                PrimaryButton(
                  child: const Text("Open Sheet"),
                  onPressed: () =>
                      Sheet(builder: (context) => const ExampleSheet())
                          .open(context),
                ),
                const Gap(16),
                PrimaryButton(
                  child: const Text("Open Non Swipe Dismissible Sheet"),
                  onPressed: () => Sheet(
                    builder: (context) => const ExampleSheet(),
                    dismissible: false,
                  ).open(context),
                ),
              ],
            ),
          )
        ],
      );
}

class ExampleSheet extends StatelessWidget {
  const ExampleSheet({super.key});

  @override
  Widget build(BuildContext context) => Screen(
        header: const Bar(
          titleText: "This is a sheet",
        ),
        slivers: [
          BarSection(
              headerText: "Header 1",
              sliver: SliverList(
                  delegate: SliverChildListDelegate(List.generate(
                      25,
                      (i) => Tile(
                            title: Text("Tile $i"),
                            subtitle: Text("Subtitle $i"),
                            leading: Text("L"),
                          ))))),
          BarSection(
              headerText: "Header 2",
              sliver: SliverList(
                  delegate: SliverChildListDelegate(List.generate(
                      25,
                      (i) => Tile(
                            title: Text("Tile $i"),
                            subtitle: Text("Subtitle $i"),
                            leading: Text("L"),
                          ))))),
          BarSection(
              headerText: "Header 3",
              sliver: SliverList(
                  delegate: SliverChildListDelegate(List.generate(
                      25,
                      (i) => Tile(
                            title: Text("Tile $i"),
                            subtitle: Text("Subtitle $i"),
                            leading: Text("L"),
                          )))))
        ],
      );
}

class ExampleBottomBar extends StatefulWidget {
  const ExampleBottomBar({super.key});

  @override
  State<ExampleBottomBar> createState() => _ExampleBottomBarState();
}

class _ExampleBottomBarState extends State<ExampleBottomBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Screen(
        footerPaddingBottom: false,
        header: const Bar(
          titleText: "Bottom Bar",
        ),
        children: [
          Center(
            child: IndexedStack(
              index: index,
              children: [
                Text("Home"),
                Text("Gift"),
                Text("List"),
              ],
            ),
          )
        ],
        footer: ButtonBar(selectedIndex: index, buttons: [
          IconTab(
              onPressed: () => setState(() => index = 0),
              icon: Icons.house,
              selectedIcon: Icons.house_fill,
              label: "Home"),
          IconTab(
              onPressed: () => setState(() => index = 1),
              icon: Icons.gift,
              selectedIcon: Icons.gift_fill,
              label: "Gift"),
          IconTab(
              onPressed: () => setState(() => index = 2),
              icon: Icons.cards,
              selectedIcon: Icons.cards_fill,
              label: "List"),
        ]),
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
          Tile(
            title: Text("Title"),
            leading: Text("L"),
            trailing: Text("T"),
          ),
          Tile(
            leading: Text("L"),
            title: Text("Title"),
          ),
          Tile(
            leading: Text("L"),
            subtitle: Text("Subtitle Only"),
          ),
          CheckboxTile(
            title: Text("Checkbox Tile"),
            leading: Text("L"),
            subtitle: Text("Subtitle"),
            value: true,
          ),
          CheckboxTile(
            title: Text("Checkbox Tile"),
            leading: Text("L"),
            trailing: Text("T"),
            subtitle: Text("But with a trailing widget"),
            value: true,
          ),
          CheckboxTile(
            title: Text("Leading Checkbox Tile"),
            leading: Text("L"),
            checkPosition: TileWidgetPosition.leading,
            trailing: Text("T"),
            subtitle: Text("But with a leading widget"),
            value: true,
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
          const Divider(
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
          const Divider(
            height: 16,
            child: Text("Headlines"),
          ),
          Text("Heading 1", style: Theme.of(context).typography.h1),
          Text("Heading 2", style: Theme.of(context).typography.h2),
          Text("Heading 3", style: Theme.of(context).typography.h3),
          Text("Heading 4", style: Theme.of(context).typography.h4),
          const Divider(
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
                  child: const Icon(Icons.activity),
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
                  leading: Icon(Icons.activity),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(16),
                TextButton(
                  child: Icon(Icons.activity),
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
                  leading: Icon(Icons.activity),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(16),
                OutlineButton(
                  child: Icon(Icons.activity),
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
                  leading: Icon(Icons.activity),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(16),
                SecondaryButton(
                  child: Icon(Icons.activity),
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
                  leading: Icon(Icons.activity),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(16),
                PrimaryButton(
                  child: Icon(Icons.activity),
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
                  leading: Icon(Icons.activity),
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
