import 'package:flutter/material.dart';

import '../../core/constants/cities_list_constant.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    required this.dropdownValue,
    required this.onChanged,
    super.key,
  });
  final void Function(String?)? onChanged;
  final String dropdownValue;

  final List<String> cities = CitiesListConstant.citiesList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DropdownButton(
            value: dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: cities.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
