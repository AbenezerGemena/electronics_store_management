
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store_management/constant.dart';
import 'package:store_management/main.dart';
import 'package:store_management/services/alert_service.dart';
import 'package:store_management/services/auth_service.dart';

import 'package:store_management/widget/custom_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  final GetIt _getIt = GetIt.instance;
  late AuthService _authService;
  late NavigationService _navigationService;
  
   late AlertServices _alertServices;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  

 
  bool _passwordVisible = false;
    void _togglePasswordVisibility(){
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  
  User? _user;

  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
    _navigationService = _getIt.get<NavigationService>();
    _alertServices = _getIt.get<AlertServices>();
    _auth.authStateChanges().listen((event) {
      _user = event;
    });

  }
  String? email,password;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildUI(),
    );
 
  }

  Widget _buildUI(){
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width*0.08,
          vertical: MediaQuery.of(context).size.height*0.009,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.12,
            ),
            _headerText(),
            SizedBox(height: MediaQuery.of(context).size.height*0.05 ,),
            _loginForm(),
           
          ],
        ),
      ),
    );

  }
  Widget _loginForm(){
    return Center(
      child: Container(
        child: Form(
          key: _loginFormKey,
          child: Column(
            children: [
              CustomFormField(
                onSaved: (value) {
                  setState(() {
                    email =value;
                  });
                  
                },
                validationRegExp: EMAIL_VALIDATION_REGEX,
                hintText: "email",
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.blue,
                  ),
            
                
                 height: MediaQuery.of(context).size.height*0.1
                 ),
                 SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                 _passwordTextField(),
            
               SizedBox(height: MediaQuery.of(context).size.height*0.05,),

               _logInButten(),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
               _createAccountLink()

            ],
          ),
          ),
        
      ),

    );
  }
  Widget _logInButten(){
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.06,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed:()async{
          if(_loginFormKey.currentState?.validate()??false){
            _loginFormKey.currentState?.save();
             bool result = await _authService.login(email!, password!);
             print(result);
             if(result){
              _navigationService.pushReplacementNamed("/home");

             } else{
              _alertServices.showToast(
                text: "Failed to login, please try again!",
                icon: Icons.error
                );
                print("errrrrr");
             }
            
            return null;
          }
        } , 
        child: const Text(
          "LogIn",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500

          ),
        )
        ),
    



    );
  }
  Widget _headerText(){
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30

          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5)
          ),
        Text(
          "Back",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.w900
          ),
        )
      ],
    );
  }
  Widget _passwordTextField(){
        return TextFormField(
      obscureText: !_passwordVisible,
      onSaved: (newValue) {
        setState(() {
          password = newValue;
        });
      },
      validator: (value) {
        if(value != null && PASSWORD_VALIDATION_REGEX.hasMatch(value)){
          return null;
        }
        return "Please enter your email";
      },
      decoration: InputDecoration(
        prefixIcon:  const  Icon(
          Icons.lock,
          color: Colors.blue,
          ),
        suffixIcon: IconButton(
          onPressed: (){
            _togglePasswordVisibility();
          },
           icon: Icon(
            _passwordVisible?Icons.visibility:Icons.visibility_off
            )
           ),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          
        ),
       
      ),
    );
    
  }
  Widget _createAccountLink(){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account ?",
          style: TextStyle(
            
            fontSize: 17
          ),
        ),
        GestureDetector(
          onTap: (){
            _navigationService.pushNamed("/sign up");
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w900,
              fontSize: 20
            ),
          ),
        )
      ],
    );
  }

}