import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/property_bloc.dart';
import '../blocs/property_state.dart';
import '../blocs/property_event.dart';

class PropertyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Properties'),
      ),
      body: BlocBuilder<PropertyBloc, PropertyState>(
        builder: (context, state) {
          if (state is PropertyLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is PropertyError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          if (state is PropertyLoaded) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Actions')),
                    DataColumn(label: Text('Property Name')),
                    DataColumn(label: Text('Address')),
                    DataColumn(label: Text('State')),
                    DataColumn(label: Text('Country')),
                    DataColumn(label: Text('Price')),
                    DataColumn(label: Text('Property Type')),
                    DataColumn(label: Text('Bedroom No')),
                    DataColumn(label: Text('Bathroom No')),
                    DataColumn(label: Text('Built Year')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Listing Type')),
                    DataColumn(label: Text('Description')),

                  ],
                  rows: state.properties.map((property) {
                    return DataRow(
                      cells: [
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              context
                                  .read<PropertyBloc>()
                                  .add(DeleteProperty(property['id']));
                            },
                          ),

                        ),
                        DataCell(Text(property['property_name'] ?? '')),
                        DataCell(Text(property['address'] ?? '')),
                        DataCell(Text(property['state'] ?? '')),
                        DataCell(Text(property['country'] ?? '')),

                        DataCell(Text('\$${property['price'] ?? '0'}')),
                        DataCell(Text(property['property_type'] ?? '')),
                        DataCell(Text('\$${property['bedrooms'] ?? '0'}')),
                        DataCell(Text('\$${property['bathrooms'] ?? '0'}')),
                        DataCell(Text(property['year_built'] ?? '')),
                        DataCell(Text(property['status'] ?? '')),
                        DataCell(Text(property['listing_type'] ?? '')),
                        DataCell(Text(property['description'] ?? '')),

                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          }

          return Center(child: Text("No Data"));
        },
      ),
    );
  }
}
