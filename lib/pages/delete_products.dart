import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store_management/main.dart';

class DeleteProducts extends StatefulWidget {
  const DeleteProducts({super.key});

  @override
  State<DeleteProducts> createState() => _DeleteProductsState();
  
}

class _DeleteProductsState extends State<DeleteProducts> {
  GetIt _getIt = GetIt.instance;
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
    'Smart tv'
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
        title: const Text("Update Products"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _navigationService.pushNamed("/home");
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
                
                
                decoration: const InputDecoration(
                  label: Text("Old Amount"),
                  border: OutlineInputBorder(),
                 
                  
                  
                ),
                
              ),
               SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            
              TextFormField(
                
                
                decoration:const InputDecoration(
                  label: Text("Updated Amount",),
                  border: OutlineInputBorder(),
                 
                  
                ),
                
              ),
             SizedBox(height: MediaQuery.of(context).size.height*0.05,),
               _updateProductButton(),
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
  Widget _updateProductButton(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.06,
      child: MaterialButton(
        onPressed: (){},
        child:  Text(
          "Update Product",
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
