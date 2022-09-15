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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.cyan),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton(
            underline: const SizedBox(),
            elevation: 10,
            style: const TextStyle(fontSize: 20, color: Colors.black),
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down_circle),
            iconEnabledColor: Colors.cyanAccent,
            isExpanded: true,
            items: cities.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Center(
                  child: Text(
                    items,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
