import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'display_screen.dart'; // تأكد من أنك قد أضفت صفحة DisplayScreen في المشروع

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية المتدرجة
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff209EBB), Color(0xff023047)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'مرحبًا\nتسجيل الدخول!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // الحاوية التي تحتوي على النموذج
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // حقل البريد الإلكتروني
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.email, color: Colors.grey),
                          label: Text(
                            'البريد الإلكتروني',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff209EBB),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك أدخل بريدك الإلكتروني';
                          }
                          String pattern =
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return 'من فضلك أدخل بريدًا إلكترونيًا صحيحًا';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // حقل رقم الهاتف
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.phone, color: Colors.grey),
                          label: Text(
                            'رقم الهاتف',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff209EBB)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك أدخل رقم هاتفك';
                          }
                          if (value.length < 10) {
                            return 'رقم الهاتف يجب أن يتكون من 10 أرقام';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // حقل كلمة المرور
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                          label: Text(
                            'كلمة المرور',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff209EBB),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك أدخل كلمة المرور';
                          }
                          if (value.length < 8) {
                            return 'كلمة المرور يجب أن تتكون من 8 أحرف على الأقل';
                          }
                          if (!RegExp(r'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])')
                              .hasMatch(value)) {
                            return 'يجب أن تحتوي كلمة المرور على حرف كبير وحرف صغير ورقم';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // زر تسجيل الدخول
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // إذا كانت البيانات صحيحة، انتقل إلى شاشة DisplayScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DisplayScreen(
                                  email: _emailController.text,
                                  phone: _phoneController.text,
                                  password: _passwordController.text,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(shadowColor: Colors.indigo),
                        child: Text("تسجيل الدخول"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class DisplayScreen extends StatelessWidget {
  final String email;
  final String phone;
  final String password;

  // استلام البيانات عبر الـ constructor
  DisplayScreen({
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تفاصيل الحساب"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("البريد الإلكتروني: $email"),
            SizedBox(height: 10),
            Text("رقم الهاتف: $phone"),
            SizedBox(height: 10),
            Text("كلمة المرور: $password"),
          ],
        ),
      ),
    );
  }
}




/*class loginscreen extends StatefulWidget {


  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController=TextEditingController();
  final _phoneController=TextEditingController();
  final _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

         body:Stack(



        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff209EBB),
                      Color(0xff023047),
                    ]
                )
            ),

            child: Padding(
              padding: const EdgeInsets.only(top: 60.0,left: 22),
              child: Text('Hello\nSign in!',style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
            ),

          ),
          Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40), topRight: Radius.circular(40)
                  ),
                  color: Colors.white,
                ),

                height: double.infinity,
                width: double.infinity,

                child:Padding(
                     padding:  const EdgeInsets.only(left: 18.0 ,right: 18),
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                           controller: _emailController,
                            obscureText: true,


                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.check,color: Colors.grey,),
                              label: Text('Gmail',style: TextStyle(
                                fontWeight:  FontWeight.bold,
                                color: Color(0xff209EBB),

                              ),

                              )
                            ),validator: (value){
                            if (value == null || value.isEmpty){
                              return 'enter your email';
                            }
                            String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                            RegExp regex= RegExp(pattern);
                            if (!regex.hasMatch(value)){
                              return 'please enter a valid email';
                            }
                            return null;
                          },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.numbers,color: Colors.grey,),
                                label: Text('Number',style: TextStyle(
                                    fontWeight:  FontWeight.bold,
                                    color: Color(0xff209EBB)
                                ),)

                            ),
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                              label: Text('Password',style: TextStyle(
                                  fontWeight:  FontWeight.bold,
                                  color: Color(0xff209EBB)
                              ),),

                          ),
                            obscureText: true,
                            validator: (value){
                              if (value == null || value.isEmpty){
                                return 'enter your password';
                              }
                              if (value.length<8){
                                return 'the password must be at least 8 digits';
                              }
                              if (!RegExp(r'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])').hasMatch(value)){
                                return'must correct your password';
                              }
                              return null;
                            },

                          ),
                  ElevatedButton(onPressed:  (){if (_formKey.currentState!.validate()){
                    print( 'Email: ${_emailController.text}');
                    print( 'phone: ${_phoneController.text}');
                    print( 'password: ${_passwordController}');

                  }},

                    style: ElevatedButton.styleFrom(shadowColor:Colors.indigo),child: Text("SignIN"),)


                        /*  SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('Forgot Password?',style: TextStyle(
                                fontWeight:  FontWeight.bold,
                                fontSize: 17,
                                color: Color(0xff209EBB),
                            ),),
                          ),*/
                         /* SizedBox(height: 70,),
                          Container(
                            height: 55,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular( 30),
                              gradient: LinearGradient(colors:[
                                Color(0xff209EBB),
                                Color(0xff023047),
                              ])
                            ),  child: ElevatedButton(onPressed: (){
                            if (_formKey.currentState!.validate()){
                              print( 'Email: ${_emailController.text}');
                            }
                          }, child: Text( 'sign in'))*/


                            //Center(child: Text('SIGN IN',style: TextStyle(
                             // fontWeight: FontWeight.bold,
                             // fontSize: 20,
                            //  color: Colors.white


                   ,
],
                ),


    ),

    ],
          ));
  }
}*/


/*class MyClassHadeel extends StatefulWidget {
  const MyClassHadeel({super.key});

  @override
  State<MyClassHadeel> createState() => _MyClassHadeelState();
}

class _MyClassHadeelState extends State<MyClassHadeel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignIn"),
      backgroundColor: Colors.indigoAccent,
      centerTitle: true,),
    body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Enter your name",
            icon: Icon(Icons.account_circle_rounded)
          ),
        ),
      Padding(padding: EdgeInsets.only(bottom: 25)),
      TextField(
        decoration: InputDecoration(
          hintText: "Enter your password",
            icon: Icon(Icons.ad_units_outlined)),),

        Padding(padding: EdgeInsets.only(bottom: 70)),
        ElevatedButton(onPressed:  (){}, child: Text("SignIN"),
        style: ElevatedButton.styleFrom(shadowColor:Colors.indigo),)


          ],),
      
      
    ),
    );
  }
}*/
