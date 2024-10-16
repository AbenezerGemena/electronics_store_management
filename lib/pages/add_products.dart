import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart'; 
import 'package:store_management/main.dart';
import 'package:store_management/services/product_provider.dart';


class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final GetIt _getIt = GetIt.instance;
  late NavigationService _navigationService;

  String? selectedProductType;
  String? selectedProductName;
  int? quantity;

  final List<String> items = [
    'IOS',
    'Android',
    'PC',
    'Mac',
    'Desktop',
    'Smart Watch',
    'Watch',
    'Airpad',
    'Headset',
    'Smart TV',
    'Charger Cable',
    'Wifi Cable',
    'TV Cable',
    'Others',
  ];

  final List<String> productNames = [
    'Phone',
    'Computer',
    'Television',
    'Watch',
    'Airphone',
    'Cables',
  ];

  @override
  void initState() {
    super.initState();
    _navigationService = _getIt.get<NavigationService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Products"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _navigationService.goBack();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: _buildAddUI(),
    );
  }

  Widget _buildAddUI() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.06,
          vertical: MediaQuery.of(context).size.height * 0.09,
        ),
        child: Column(
          children: [
            _addProductTextField(),
          ],
        ),
      ),
    );
  }

  Widget _addProductTextField() {
    return Center(
      child: Container(
        child: Form(
          child: Column(
            children: [
              _productNameDropDownTextField(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              _dropDownTextFormField(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Quantity",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  quantity = int.tryParse(value); 
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              _addProductButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productNameDropDownTextField() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        hintText: "Product Name",
        border: OutlineInputBorder(),
      ),
      value: selectedProductName,
      items: productNames.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedProductName = newValue;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select a product name';
        }
        return null;
      },
    );
  }

  Widget _dropDownTextFormField() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        hintText: "Product Type",
        border: OutlineInputBorder(),
      ),
      value: selectedProductType,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedProductType = newValue;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select a product type';
        }
        return null;
      },
    );
  }

  Widget _addProductButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      child: MaterialButton(
        onPressed: () {
          // Ensure values are selected and quantity is provided
          if (selectedProductName != null &&
              selectedProductType != null &&
              quantity != null) {
            // Create a new ProductModel
            ProductModel newProduct = ProductModel(
              productName: selectedProductName!,
              productType: selectedProductType!,
              quantity: quantity!,
            );

            // Add product to provider
            Provider.of<ProductProvider>(context, listen: false)
                .addProduct(newProduct);

            // Navigate back after adding the product
            _navigationService.goBack();
          } else {
            // Show error message if values are not set
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Please fill all fields")),
            );
          }
        },
        color: Colors.blue[800],
        child: const Text(
          "Add Product",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
