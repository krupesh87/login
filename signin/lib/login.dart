

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //  final _auth=FirebaseAuth.instance;
   final TextEditingController passwordcontroller=TextEditingController();
   final TextEditingController emailcontroller=TextEditingController();
class _MyLoginState extends State<MyLogin> {
  //firebase 
 
  @override
  Widget build(BuildContext context) {
   
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.png'),
          fit: BoxFit.cover
          ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35,top: 130),
              child: Text(
                'Welcome ',
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 33
                  ),
              ),
            ),

            // form begin

            Form(
              autovalidateMode: AutovalidateMode.always, 
              key: formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.5,
                    right: 35,
                    left: 35
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailcontroller,
                        validator:MultiValidator(
                          [ EmailValidator(errorText: "Not a valid Email"),
                          RequiredValidator(errorText: "Required")
                          ]
                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          labelText: 'Email',
                          hintText:'Email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                        ),
                        onSaved: (newValue) {
                          emailcontroller.text=newValue!;
                        },
                      ),
                     SizedBox(
                       height: 30,
                     ),
                      TextFormField(
                        controller: passwordcontroller,
                        obscureText: true,
                        validator:
                        MultiValidator(
                          [
                            RequiredValidator(errorText: "Required"),
                            PatternValidator(r'(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$', errorText: "one upper,one lower case,one special character"),
                             PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character') ,
                          
                          
                            MinLengthValidator(8, errorText: "should be atleast 8 character"),
                            MaxLengthValidator(18, errorText: "password is too long")
                          ]
                        ),
                       
                        
                      
                         decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          labelText: 'Password',
                          hintText:'Password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                        ),
                        onSaved: (newValue) => {
                          passwordcontroller.text=newValue!
                        },
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('SIGNIN ',
                            
                            style: TextStyle(
                              color: Color(0xff4c505b),
                              fontSize: 30,
                              fontWeight: FontWeight.w700
                            ),),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xff4c505b),
                              child:IconButton(
                                color: Colors.white,
                                onPressed: (){},//
                                icon: Icon(Icons.arrow_forward),

                              )
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[ TextButton(onPressed:(){}, child: Text(
                              'forgot password',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                 color: Color(0xff4c505b),
                              ),
                            ))]
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed:(){
                              Navigator.pushNamed(context, 'register');
                            }, child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                 color: Color(0xff4c505b),
                              ),
                            ),),

                          ],
                        ),

                  ],),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

//login function
// void signIn(String email,String password) async {
//   if(formKey.currentState!.validate()){
//     await _auth
//     .signInWithEmailAndPassword(email:email,password:password)
//     .then((uid)=>{
//       Fluttertoast.showToast(msg: "SuccessFul"),
   
//     }).catchError((e)=>{
//        Fluttertoast.showToast(msg: e!.message)

//     }
     
//     );
//   }
// }