import 'package:flutter/material.dart';
import 'package:receitas/components/main_drawer.dart';
import 'package:receitas/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SettingsScreen(this.settings, this.onSettingsChanged, {Key? key})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                    'Sem Glúten',
                    'Só exibe receitas sem glúten',
                    settings.isGlutenFree,
                    (value) => setState(() {
                          settings.isGlutenFree = value;
                        })),
                _createSwitch(
                    'Sem Lactose',
                    'Só exibe receitas sem lactose',
                    settings.isLactoseFree,
                    (value) => setState(() {
                          settings.isLactoseFree = value;
                        })),
                _createSwitch(
                    'Vegana',
                    'Só exibe receitas veganas',
                    settings.isVegan,
                    (value) => setState(() {
                          settings.isVegan = value;
                        })),
                _createSwitch(
                    'Vegetariana',
                    'Só exibe receitas vegetarianas',
                    settings.isVegetarian,
                    (value) => setState(() {
                          settings.isVegetarian = value;
                        })),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
