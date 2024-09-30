import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store_management/main.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  GetIt _getIt =GetIt.instance;
  late NavigationService _navigationService;
  @override
  void initState() {
    super.initState();
    _navigationService = _getIt.get<NavigationService>();
  }
  String?p;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "View Products"
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            _navigationService.pushNamed("/home");
          }, 
          icon: Icon(
            Icons.arrow_back
          ),
      ),
      ),
      body: _buildViewProductUI(),

    );
  }
  Widget _buildViewProductUI(){
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width*0.02,
          vertical: MediaQuery.of(context).size.height*0.02
          
        ),
        child:ListView(
          children: [
            _phoneProductView(),
            _computerViewPrduct(),
            _televisionProductView(),
            _watchProductView(),
            _cabeleProductView(),
            _airphoneProductView()
            
            
           
            
             
          ],
        )
        )
        );
      
  }

  Widget _phoneProductView(){
    return Container(
     height: MediaQuery.of(context).size.height*0.27,
     padding: EdgeInsets.all(4),
     margin: EdgeInsets.all(7),
     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
              // Blur radius
                offset: Offset.zero,
        
          blurStyle: BlurStyle.normal

        )
      ]

     ),
     child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: MediaQuery.of(context).size.height*0.2,
            decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/phone.png"),
                fit: BoxFit.fill
                )


            ) ,


        )
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Name: Mobile Phone"),
                Text("Product Types and amount:"),
                Row(
                  
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("ios:  45")

                  ],
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Android:  50")

                  ],
                ),
                
            

                
              ],

            ),

        ))

      ],
     ),
    );
   
  }
  Widget _computerViewPrduct(){
    return Container(
     height: MediaQuery.of(context).size.height*0.27,
     padding: EdgeInsets.all(4),
     margin: EdgeInsets.all(7),
     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
              // Blur radius
                offset: Offset.zero,
        
          blurStyle: BlurStyle.normal

        )
      ]

     ),
     child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/computer.png"),
                fit: BoxFit.fill
                )


            ) ,


        )
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Name: Computer"),
                Text("Product Types and amount:"),
                Row(
                  
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Mac:  30")

                  ],
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("PC:  70")

                  ],
                ),
                 Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Desktop:  56")

                  ],
                ),
                
            

                
              ],

            ),

        ))

      ],
     ),
    );

  }
  Widget _televisionProductView(){
    return Container(
     height: MediaQuery.of(context).size.height*0.27,
     padding: EdgeInsets.all(4),
     margin: EdgeInsets.all(7),
     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
              // Blur radius
                offset: Offset.zero,
        
          blurStyle: BlurStyle.normal

        )
      ]

     ),
     child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            // decoration:BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("image/tv1.png"),
            //     fit: BoxFit.fill
            //     )


            // ) ,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                "image/tv.png",
                fit: BoxFit.cover,
                ),
              
            ),


        )
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Name: Television"),
                Text("Product Types and amount:"),
                Row(
                  
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Smart Tv:  67")

                  ],
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Others:  34")

                  ],
                ),
                
            

                
              ],

            ),

        ))


      ],
     ),
    );
   
  }
  Widget _cabeleProductView(){
    return Container(
     height: MediaQuery.of(context).size.height*0.27,
     padding: EdgeInsets.all(4),
     margin: EdgeInsets.all(7),
     decoration: BoxDecoration(
      
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
              // Blur radius
                offset: Offset.zero,
        
          blurStyle: BlurStyle.normal

        )
      ],
      

     ),
     child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            // decoration:BoxDecoration(
            //   image: DecorationImage(
            //    // image: AssetImage("image/cables.png"),
            //     //fit: BoxFit.fill
            //     )


            // ) ,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset("image/cables.png"),
            ),


        )
        ),
     Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Name: Cable"),
                Text("Product Types and amount:"),
                Row(
                  
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Charger cable:  79")

                  ],
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Tv cable:  32")

                  ],
                ),
                 Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Wifi cable:  54")

                  ],
                ),
                 Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Others: 90")

                  ],
                ),
                
            

                
              ],

            ),

        ))


      ],
     ),
    );
   
  }
  Widget _watchProductView(){
    return Container(
     height: MediaQuery.of(context).size.height*0.27,
     padding: EdgeInsets.all(4),
     margin: EdgeInsets.all(7),
     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
              // Blur radius
                offset: Offset.zero,
        
          blurStyle: BlurStyle.normal

        )
      ]

     ),
     child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/watch.png"),
                fit: BoxFit.fill
                )


            ) ,


        )
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Name: Watch"),
                Text("Product Types and amount:"),
                Row(
                  
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Smart Watch:  80")

                  ],
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Other:  76")

                  ],
                ),
                
            

                
              ],

            ),

        ))

      ],
     ),
    );
   
  }
  Widget _airphoneProductView(){
    return Container(
     height: MediaQuery.of(context).size.height*0.27,
     padding: EdgeInsets.all(4),
     margin: EdgeInsets.all(7),
     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
              // Blur radius
                offset: Offset.zero,
        
          blurStyle: BlurStyle.normal

        )
      ]

     ),
     child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/airpad.png"),
                fit: BoxFit.fill
                )


            ) ,
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(1),
            //   child: Image.asset("image/airpad.png"),
            // ),


        )
        ),
               Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Name: Airpon"),
                Text("Product Types and amount:"),
                Row(
                  
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Airpad:  67")

                  ],
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05)),
                    Text("Headset:  76")

                  ],
                ),
                
            

                
              ],

            ),

        ))

      ],
     ),
    );
   
  }
  
  
}