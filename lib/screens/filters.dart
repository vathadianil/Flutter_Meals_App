import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreen();
  }
}

class _FiltersScreen extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoceFreeFilterSet = false;
  var _vegitarianFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _lactoceFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _vegitarianFilterSet = activeFilters[Filter.vegetarian]!;
    _veganFreeFilterSet = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifer) {
      //   Navigator.of(context).pop();
      //   if (identifer == 'meals') {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (cts) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: PopScope(
        canPop: true,
        onPopInvokedWithResult: (bool didpop, dynamic result) {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoceFreeFilterSet,
            Filter.vegetarian: _veganFreeFilterSet,
            Filter.vegan: _veganFreeFilterSet,
          });
          if (didpop) return;
          // Navigator.of(context).pop();
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              subtitle: Text(
                'Only include Gluten-Free Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoceFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoceFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactoce-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              subtitle: Text(
                'Only include Lactoce-Free Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegitarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegitarianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegitarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              subtitle: Text(
                'Only include Vegitarian Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              subtitle: Text(
                'Only include Vegan Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
