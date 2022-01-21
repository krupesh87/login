import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:signin/login.dart';
import 'package:signin/model/usermodel.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);
 
  @override
  _MyRegisterState createState() => _MyRegisterState();
}
final _auth=FirebaseAuth.instance;
 final TextEditingController emailcontroller=TextEditingController();
 final TextEditingController namecontroller=TextEditingController();
 final TextEditingController passwordcontroller=TextEditingController();
 final TextEditingController confirmcontroller=TextEditingController();
class _MyRegisterState extends State<MyRegister> {
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String password="";
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),

            // form begin
            Form(
              autovalidateMode: AutovalidateMode.always, 
              key: formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextFormField(
                               controller:namecontroller,
                               onSaved: (newValue) {
                                 namecontroller.text=newValue!;
                               },
                              validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: "Required"),
                                  MinLengthValidator(2, errorText:"Enter valid Name"),
                                  PatternValidator(r'(?=.[A-Z a-z])', errorText: "Only Letter "),
                                  MaxLengthValidator(30, errorText: "Enter valid Name")
                                ]
                              ),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                               
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Name",
                                  labelText: "Name",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: emailcontroller,
                              onSaved: (newValue) {
                                emailcontroller.text=newValue!;
                              },
                              validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: "Required"),
                                  EmailValidator(errorText: "Not a valid Email")
                                ]
                              ),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  hintText: "Email",
                                  labelText: "Email",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: passwordcontroller,
                              onSaved: (newValue) {
                                passwordcontroller.text=newValue!;
                              },
                              onChanged: (val) => password = val, 
                              validator:  MultiValidator(
                          [
                            RequiredValidator(errorText: "Required"),
                            PatternValidator(r'(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$', errorText: "one upper,one lower case,special character"),
                             PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character') ,
                          
                          
                            MinLengthValidator(8, errorText: "should be atleast 8 character"),
                            MaxLengthValidator(18, errorText: "password is too long")
                          ]
                        ),
                              style: TextStyle(color: Colors.white),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  hintText: "Password",
                                
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              controller: confirmcontroller,
                              onSaved: (newValue) {
                                confirmcontroller.text=newValue!;
                              },
                              validator: (val) {
                              
                                return MatchValidator(errorText: 'passwords do not match').validateMatch(val!, passwordcontroller.text);
                              },
                              style: TextStyle(color: Colors.white),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  hintText: "Confirm Password",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        signup(emailcontroller.text, passwordcontroller.text);
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'login');
                                  },
                                  child: Text(
                                    'Sign In',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                  style: ButtonStyle(),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }






void signup(String email,String password) async{
  print("hii");
  if(formKey.currentState!.validate()){
    await _auth.createUserWithEmailAndPassword(email: email, password: password)
    .then((value) =>{
      

    postDetailToFirestore()})
    .catchError((e){
      Fluttertoast.showToast(msg: e!.message);
    });
  }
  }
  void postDetailToFirestore() async{
    print("h1 tag");
    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    User?user=_auth.currentUser;
    UserModel userModel=UserModel();
    userModel.email=user!.email;
    userModel.uid=user.uid;
    userModel.password=passwordcontroller.text;
  



    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg: "created successful");
    Navigator.pushNamed(context, 'login');

 
}
}
