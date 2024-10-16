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
     /* appBar: AppBar(
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
              icon:const Icon(Icons.logout))
          ],
      ),*/
      body: _buildHomeUI(),
      
    );
  }
  Widget _buildHomeUI(){
    return SafeArea(
      child:Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width*0.01,
          vertical: MediaQuery.of(context).size.height*0.01,
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height*0.02
            )),
            _searchBar(),
            Padding(padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height*0.05
            )),
            
          
            _menuContainer()
          ],
         
          
          

        
        ),
        )
      );
  }

  Widget _menuContainer(){
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            blurRadius: 1,
            blurStyle: BlurStyle.inner,
           
          )
          
        ]
      

      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Spacer(),
                _addProductButton(),
                Spacer(),
                _viewProduct(),
                Spacer()
               

              ],

            )
            ),
          Expanded(
            child: Column(
              children: [
                Spacer(),
                _updateProduct(),
                Spacer(),
                _deleteProduct(),
                Spacer()

                
              ],

            )
          )
        ],
       
      ),
    );
  }
  Widget _addProductButton(){
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.4,
      height: MediaQuery.of(context).size.height*0.06,
      child: ElevatedButton(
        onPressed: (){
          _navigationService.pushNamed('/add');
        }, 
        child: Text('Add Product')
        ),
      
        
    );

  }
  Widget _viewProduct(){
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.4,
      height: MediaQuery.of(context).size.height*0.06,
      child: ElevatedButton(
        onPressed: (){
          _navigationService.pushNamed('/view');
        }, 
        child: Text('View Product')
        ),
      
        
    );

  }
 Widget _updateProduct(){
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.4,
      height: MediaQuery.of(context).size.height*0.06,
      child: ElevatedButton(
        onPressed: (){
          _navigationService.pushNamed('/update');
        }, 
        child: Text('Update Product')
        ),
      
        
    );

  }
  Widget _deleteProduct(){
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.4,
      height: MediaQuery.of(context).size.height*0.06,
      child: ElevatedButton(
        onPressed: (){
          _navigationService.pushNamed('/delete');
        }, 
        child: Text('Delete Product')
        ),
      
        
    );

  }

Widget _searchBar(){
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.05,
    child:SearchAnchor(

      builder:   (BuildContext context, SearchController controller){
        return SearchBar(
          leading: Icon(Icons.search),
          //backgroundColor: WidgetStatePropertyAll(Colors.white),
          hintText: "Search",

        );
      }, 
      suggestionsBuilder:(BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          }
      )
  );
}






  
}