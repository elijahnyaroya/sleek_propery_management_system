import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_property_management_system/blocs/property_event.dart';
import 'package:sleek_property_management_system/widgets/textarea_widget.dart';

import '../blocs/property_bloc.dart';
import '../services/api_service.dart';
import '../widgets/input_widget.dart';

class AddPropertyPage extends StatelessWidget {
  final apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Property'),
      ),
      body: BlocProvider(
        create: (context) => PropertyBloc(apiService:apiService ),
        child: AddPropertyForm(),
      ),
    );
  }
}

class AddPropertyForm extends StatefulWidget {
  @override
  _AddPropertyFormState createState() => _AddPropertyFormState();
}

class _AddPropertyFormState extends State<AddPropertyForm> {
  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController bedroomsController = TextEditingController();
  final TextEditingController bathroomsController = TextEditingController();
  final TextEditingController yearBuiltController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? selectedCountry;
  String? selectedListingType;
  final List<String> countries = ['DUBAI', 'USA'];
  final List<String> listingTypes = ['Sale', 'Rent', 'Lease'];
  String? selectedImage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Expanded(
                 flex: 1,
                 child: InputField(
                     controller: propertyNameController,
                     label: 'Property Name',
                     hint: 'Property Name',
                     errorMessage: "Property name is  required",
                     inputType: TextInputType.text,
                     isPassword: false),
               ),
              SizedBox(width: 10,),
               Expanded(
                 flex: 1,
                 child: InputField(
                     controller: addressController,
                     label: 'Address',
                     hint: 'Address',
                     errorMessage: "Address  is required",
                     inputType: TextInputType.text,
                     isPassword: false),
               ),

             ],
           ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: InputField(
                      controller: stateController,
                      label: 'State',
                      hint: 'State',
                      errorMessage: "State  is  required",
                      inputType: TextInputType.text,
                      isPassword: false),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: DropdownButtonFormField<String>(
                    value: selectedCountry,
                    decoration: InputDecoration(labelText: 'Country'),
                    items: countries.map((country) => DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    )).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: InputField(
                      controller: priceController,
                      label: 'Price',
                      hint: 'Price',
                      errorMessage: "Price  is  required",
                      inputType: TextInputType.number,
                      isPassword: false),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Property Type'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: InputField(
                      controller: bedroomsController,
                      label: 'Bedroom No',
                      hint: 'Bedroom No',
                      errorMessage: "Bedrooms no  is  required",
                      inputType: TextInputType.number,
                      isPassword: false),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child:InputField(
                      controller: bathroomsController,
                      label: 'Bathrooms No',
                      hint: 'Bathrooms No',
                      errorMessage: "Bathrooms no  is  required",
                      inputType: TextInputType.number,
                      isPassword: false),
                ),
              ],
            ),

            SizedBox(height: 20,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: InputField(
                      controller: yearBuiltController,
                      label: 'Year built',
                      hint: 'Year built',
                      errorMessage: "Year built  is  required",
                      inputType: TextInputType.number,
                      isPassword: false),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child:TextFormField(
                    decoration: InputDecoration(labelText: 'Status'),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child:DropdownButtonFormField<String>(
                    value: selectedListingType,
                    decoration: InputDecoration(labelText: 'Listing Type'),
                    items: listingTypes.map((type) => DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    )).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedListingType = value;
                      });
                    },
                  )
                ),
              ],
            ),

            SizedBox(height: 20,),
            TeaxtAreaField(label: "Description ",
                hint: "Description ",
                errorMessage: "Description is required",
                inputType: TextInputType.text,
                controller: descriptionController),
            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedImage = '';
                });
              },
              child: Text('Upload Image'),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200, // Set the desired width here
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    final propertyDetails = {
                      'property_name': propertyNameController.text,
                      'address': addressController.text,
                      'state': stateController.text,
                      'country': selectedCountry,
                      'price': priceController.text,
                      'property_type': 'Example Type',
                      'bedrooms': bedroomsController.text,
                      'bathrooms': bathroomsController.text,
                      'year_built': yearBuiltController.text,
                      'status': 'Example Status',
                      'listing_type': selectedListingType,
                      'image': selectedImage,
                      'description': descriptionController.text,
                    };

                    context.read<PropertyBloc>().add(AddProperty(propertyDetails));
                  },
                  child: Text('Submit'),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    propertyNameController.dispose();
    addressController.dispose();
    stateController.dispose();
    priceController.dispose();
    bedroomsController.dispose();
    bathroomsController.dispose();
    yearBuiltController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
