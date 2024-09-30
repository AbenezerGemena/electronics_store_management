import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store_management/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetIt _getIt = GetIt.instance;
  late NavigationService _navigationService;
  @override
  void initState() {
    super.initState();
    _navigationService = _getIt.get<NavigationService>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home"
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.menu)
          ),
          actions: [
            IconButton(
              onPressed: (){
                _navigationService.pushReplacementNamed("/login");
              },
              icon: Icon(Icons.logout))
          ],
      ),
      body: _buildHomeUI(),
      
    );
  }
  Widget _buildHomeUI(){
    return SafeArea(
      child:Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width*0.05,
          vertical: MediaQuery.of(context).size.height*0.156,
        ),
        child: Column(
          
          children: [
            _addProductButton(),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            _viewProductButton(),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            _updateProductButton(),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            _deleteProduct(),


          ],
        ),
        )
      );
  }
  Widget _addProductButton(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.06,
      child: MaterialButton(
        onPressed: (){
          _navigationService.pushNamed("/add");
        },
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
    Widget _viewProductButton(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.06,
      child: MaterialButton(
        onPressed: (){
          _navigationService.pushNamed("/view");
        },
        child:  Text(
          "View Product",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
            
          ),

          ),
        color: Colors.blue[800]
        
        ),
    );

  }
    Widget _updateProductButton(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.06,
      child: MaterialButton(
        onPressed: (){
          _navigationService.pushNamed("/update");
        },
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
    Widget _deleteProduct(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.06,
      child: MaterialButton(
        onPressed: (){
          _navigationService.pushNamed("/delete");
        },
        child:  Text(
          "Delete Product",
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