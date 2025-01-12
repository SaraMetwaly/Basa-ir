import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import 'package:qbanking_app/providers/firebaseAuthentication.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  // final FirebaseAuthentication _firebaseAuth = FirebaseAuthentication();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _signedUp = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //  onPressed: (){context.go(AppRouter.home.path);},
        //  icon: const Icon(Icons.arrow_back), color: Colors.white,),
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 45,),
              Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 21, 84, 23),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                ),
          ),
            const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                ),
              ),
                        const SizedBox(height: 12,),
              Container(
              height: 70,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 230, 246),
                borderRadius: BorderRadius.circular(25),
              ),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 109, 140, 103),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 215, 215, 215),
                      blurRadius: 4,
                      offset: Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
                  width: 350,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Login", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                    ],
                  ),
                ),
                onTap: () {
                  _login();
                },
              ),
            ),

            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                context.go('/signup');
              },
              child: RichText(
                text: const TextSpan (
                  text: "Not Registered? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign-Up",
                      style: TextStyle(
                        color: Color.fromARGB(255, 156, 141, 8),
                        fontWeight: FontWeight.bold
                      )
                    )
                  ])),
            )
        ],
      ),
    );
  }

  void _login() async {
    setState(() {
      _signedUp = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    // User? user = await _firebaseAuth.loginWithEmailAndPassword(email, password);

    setState(() {
      _signedUp = false;
    });

    // if (user != null) {
    //   // navigation to home
    // }
  }
}
