
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:store_management/constant.dart';
import 'package:store_management/main.dart';
import 'package:store_management/widget/custom_form_field.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey();
  bool _passwordVisible = false;
  final GetIt _getIt = GetIt.instance;
  late NavigationService _navigationService;
  String? email,password,errorMessage,phoneNumber,name;
  final _auth = FirebaseAuth.instance;


  void _togglePasswordVisibility(){
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
  void _toggleConformationPasswordVisibility(){
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
  @override
  void initState() {
    super.initState();
    _navigationService = _getIt.get<NavigationService>();
  }
 
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerText(),
            SizedBox(height: MediaQuery.of(context).size.height*0.03),
          
            _signUpForm(),

            
            
           
          ],
        ),
      ),
    );
  }

  Widget _signUpForm(){
    return SizedBox(
      child: Form(
        key: _signUpFormKey,
        child: Column(
          children: [
            CustomFormField(
              hintText: "Name", 
              height: MediaQuery.of(context).size.height*0.1, 
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.blue,
                ), 
              validationRegExp: NAME_VALIDATION_REGEX,
              onSaved: (value) {
                setState(() {
                  name = value;
                  
                });
                
              },
              ),
              CustomFormField(
                hintText: "Email", 
                height: MediaQuery.of(context).size.height*0.1, 
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.blue,
                ), 
                validationRegExp: EMAIL_VALIDATION_REGEX,
                onSaved: (value){
                  setState(() {
                    email = value;
                  });

                },
                ),
            _passwordTextFormField(),
            //SizedBox( height: MediaQuery.of(context).size.height*0.03),
            //_passwordConformationTextFormField(),
             SizedBox( height: MediaQuery.of(context).size.height*0.03),
            
              CustomFormField(
                hintText: "Phone Number", 
                height: MediaQuery.of(context).size.height*0.1,
                prefixIcon: const Icon(
                  Icons.call,
                  color: Colors.blue,
                ), 
                validationRegExp: PHONE_NUMBER_VALIDATION_REGEX,
                onSaved: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                  
                },
                ),
                _signUpButton(),
                 SizedBox( height: MediaQuery.of(context).size.height*0.03),
                _accountHaveLink()

          
           
          ],

      )
      ),

    );
  }
  Widget _signUpButton(){
      return SizedBox(
      height: MediaQuery.of(context).size.height*0.06,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        
        onPressed:()async{
          if(_signUpFormKey.currentState?.validate()??false){
            _signUpFormKey.currentState!.save();
            setState(() {
              errorMessage =null;
              
            });
            try{
              final newUser = await _auth.createUserWithEmailAndPassword(
                email: email!, 
                password: password!
                );
                if(newUser !=null){
                  Navigator.pushNamed(context,"/home");
                }
            } catch(e){
              setState(() {
                errorMessage = e.toString();
              });
               print("Sign Up Error: $errorMessage"); 
            }

            
            
          
            
          }
         
          
        } , 
        child: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500

          ),
        ),
        
        ),
    



    );
  }
    Widget _passwordTextFormField() {
    return TextFormField(
      obscureText: !_passwordVisible,
      onSaved: (newValue) {
        setState(() {
          password =newValue;
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

 Widget _passwordConformationTextFormField() {
    return TextFormField(
      obscureText: !_passwordVisible,
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
            _toggleConformationPasswordVisibility();

          },
           icon: Icon(
            _passwordVisible?Icons.visibility:Icons.visibility_off
           
            )
           ),
        hintText:"Conform Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          
        ),
       
      ),
    );
  }

  Widget _headerText(){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Let's Create Your",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900
          ),
        ),
        Text(
          "account",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w900,
            fontSize: 30
          ),
        )
      ],
    );
    
  }

  Widget _accountHaveLink(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have account ?",
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        GestureDetector(
          onTap: (){
            _navigationService.pushNamed("/login");
            

          },
            child: const Text(
              "Log In",
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