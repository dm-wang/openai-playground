import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class TypeAheadWidget extends StatelessWidget {
  TypeAheadWidget({Key? key}) : super(key: key);

  Future<List<String>> _getSuggestions(String pattern) async {
    // In real apps, this could be a network request or database query
    const sampleData = ['Apple', 'Banana', 'Cherry', 'Date', 'Fig', 'Grape'];
    return sampleData
        .where((item) => item.toLowerCase().startsWith(pattern.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(
      textFieldConfiguration: const TextFieldConfiguration(
        decoration: InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
        ),
      ),
      suggestionsCallback: _getSuggestions,
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion),
        );
      },
      onSuggestionSelected: (suggestion) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Selected: $suggestion')));
      },
    );
  }
}
