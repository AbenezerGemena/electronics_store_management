import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store_management/main.dart';


class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final GetIt _getIt = GetIt.instance;
  late NavigationService _navigationService;



  @override
  void initState() {
    super.initState();
    _navigationService = _getIt.get<NavigationService>();
  }
  String? selectedProductType;
  String?  selectedProductName;
  final List<String> items = [
    'IOS',
    'Android',
    'PC',
    'Mac',
    'Desktop',
    'Smart watch',
    'watch',
    'Airpad',
    'Headset',
    'Smart tv',
    'Charger cable',
    'Wifi cable',
    'Tv cable',
    'Others'
    
  ];
  
  final List<String> productNames =[
    'phone',
    'computer',
    'Television',
    'Watch',
    'Airphone',
    'Cables',


  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
  Widget _addProductTextField(){
    return Center(
      child: Container(
        child: Form(
          child: Column(
            children: [
              _productNameDropDownTextField(),
         
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              
              _dropDownTextFormField(),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              TextFormField(
                
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Quantity",
                  
                  
                ),
                
              ),
               SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              _addProductButton(),
            ],

        )),
       
         

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
          return 'Please select a platform';
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
          return 'Please select a platform';
        }
        return null;
      },
    );
  }
  Widget _addProductButton(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.06,
      child: MaterialButton(
        onPressed: (){},
        child:  Text(
          "Add Product",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
            
          ),

          ),
        color: Colors.blue[800]
        
        ),
    );

  }
}



