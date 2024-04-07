
import 'package:flutter/material.dart';



class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'REGISTER',
                    style:
                    TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validat: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter your name';
                        } else if (!RegExp(r'^[A-Z]').hasMatch(value)) {
                          return 'Name must start with a capital letter';
                        }
                        return null;
                    },

                    lable: 'User Name',
                    prefix: Icons.person,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validat: (value) {
                          if (value!.isEmpty) {
                            return 'Email must not be empty';
                          } else if (!value.endsWith('@gmail.com')) {
                            return 'Email must end with @gmail.com';
                          }
                          return null;
                      },
                      lable: 'Email',
                      prefix: Icons.email),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    validat: (value) {
                        if (value!.isEmpty) {
                          return 'Password must not be empty';
                        } else if (value.length <= 12) {
                          return 'Password must be longer than 12 characters';
                        }
                        return null;
                    },
                    lable: 'Password',
                    prefix: Icons.lock,
                    suffix: isPassword ? Icons.visibility_off:Icons.visibility,
                    suffixPressed: (){
                      setState(() {
                        isPassword=!isPassword;
                      });
                    },
                    isPassword: isPassword,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    validat: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter your phone number';
                        } else if (!RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(value)) {
                          return 'Please enter a valid Egyptian phone number';
                        }
                        return null;
                    },



                    lable: 'Phone',
                    prefix: Icons.phone,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                      Function: () {
                        if (formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                          print(nameController.text);
                          print(phoneController.text);
                        }
                      },
                      text: 'registar',

                  ),
                  SizedBox(
                    height: 15.0,
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Widget defaultButton({
  double width = double.infinity ,
  double radius = 0.0 ,
  Color background=Colors.blue ,
  bool isUpperCase = true,
  required Function  ,
  required String text ,
}) =>
    Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed:   Function ,
        child: Text(
          isUpperCase? text.toUpperCase():text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormField ({
  required TextEditingController controller,
  required TextInputType type,
  onSubmit,
  onChange,
  onTap,
  required  validat,
  bool isPassword = false,
  required String lable ,
  required IconData prefix,
  IconData? suffix ,
  suffixPressed,
})=>
    TextFormField(
      controller: controller,
      keyboardType: type ,
      onFieldSubmitted:onSubmit ,
      onChanged: onChange,
      validator: validat,
      onTap: onTap,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText:lable, //hintText: 'Email Address'
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null ? IconButton(
          onPressed:suffixPressed ,
          icon: Icon(
            suffix,
          ),
        ) : null,
      ),
    );






