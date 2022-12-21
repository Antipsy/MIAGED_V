import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'Component.dart';
import 'Toast.dart';
import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

import 'login.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    final emailcon = TextEditingController();
    final passwordcon = TextEditingController();
    final nomcon = TextEditingController();
    final prenomcon = TextEditingController();
    final datencon = TextEditingController();
    final codepcon = TextEditingController();
    final addresscon = TextEditingController();
    final villecon = TextEditingController();
    final _formkey = GlobalKey<FormState>();
    bool hidePassword = true;

    @override
    void dispose() {
      emailcon.dispose();
      passwordcon.dispose();
      nomcon.dispose();
      prenomcon.dispose();
      datencon.dispose();
      codepcon.dispose();
      addresscon.dispose();
      villecon.dispose();
      super.dispose();
    }
    Future addUserDetails(String nomcon,String prenomcon,String emailcon,String datencon,String addresscon, int codepcon,String Ville) async{
      await FirebaseFirestore.instance.collection('users').add({
        'nom': nomcon,
        'prenom': prenomcon,
        'email': emailcon,
        'date': datencon,
        'address': addresscon,
        'codep': codepcon,
        'ville': Ville,

      });
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: bcolor,
        automaticallyImplyLeading: false,
        title: Text(" MIAGED  "),

      ),
      body: Stack(
        children: [

          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [



                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.9,
                    height: MediaQuery.of(context).size.height * 0.849,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),

                          TextFormField(
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'First Enter Nom';
                            //   } else {
                            //     return null;
                            //   }
                            // },

                              controller: nomcon,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.supervised_user_circle),
                                hintText: "Nom",
                              )),
                          TextFormField(
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'First Enter Prenom';
                            //   } else {
                            //     return null;
                            //   }
                            // },

                              controller: prenomcon,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.supervised_user_circle),
                                hintText: "Prenom",
                              )),
                          TextFormField(
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'First Enter Date de naissance';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                              keyboardType: TextInputType.datetime,
                              controller: datencon,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range),
                                hintText: "dd/mm/yyyy",
                              ),



                          ),

                          TextFormField(
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'First Enter Email';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                              keyboardType: TextInputType.emailAddress,
                              controller: emailcon,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "Email",
                              )),
                          TextFormField(
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'First Enter Adress';
                            //   } else {
                            //     return null;
                            //   }
                            // },

                              controller: addresscon,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.home),
                                hintText: "Adresse",
                              )),
                          TextFormField(
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'First Enter Code Postal';
                            //   } else {
                            //     return null;
                            //   }
                            // },

                              controller: codepcon,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.numbers),
                                hintText: "Code postal",
                              )),
                          TextFormField(
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'First Enter Ville';
                            //   } else {
                            //     return null;
                            //   }
                            // },

                              controller: villecon,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_city),
                                hintText: "Ville",
                              )),
                          TextFormField(
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'First Enter Password';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            onChanged: (value) {
                              print(value);
                            },
                            obscureText: hidePassword,
                            controller: passwordcon,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: "********",
                              suffixIcon: IconButton(
                                icon: hidePassword
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),


                          roundbutton(
                              title: "Sign Up.",
                              tapfun: () {
                                // if (_formkey.currentState!.validate()) {
                                print("press signup");
                                addUserDetails(nomcon.text.trim(), prenomcon.text.trim(), emailcon.text.trim(), datencon.text.trim(), addresscon.text.trim(), int.parse(codepcon.text.trim()), villecon.text.trim());
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                    email: emailcon.text.toString(),
                                    password: passwordcon.text.toString())
                                    .then((value) {
                                  print("suc");

                                  print("suc next scren");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              home(name: '')));
                                }).onError((error, stackTrace) {
                                  print("error");

                                  toastmessage(error.toString());
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => login()));
                      },
                      child: Text("Login")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}