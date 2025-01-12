import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});
  
  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen>{

  // final FirebaseAuthentication _firebaseAuth = FirebaseAuthentication();
  
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _signedUp = false;

    @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //  onPressed: (){context.go(AppRouter.home.path);},
        //  icon: const Icon(Icons.arrow_back), color: Colors.white,),
        leading: IconButton(
          onPressed: () {
            context.go('/login');
          }, icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,),

        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 45,),
              Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        backgroundColor:  const Color.fromARGB(255, 21, 84, 23),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                    ),
                ),
          ),
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
                      Text("SignUp", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                    ],
                  ),
                ),
                onTap: () {
                  _signUp();
                },
              ),
            ),
        ],
      ),
    );

  }

  void _signUp() async {
    setState(() {
      _signedUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // User? user = await _firebaseAuth.signUpWithEmailAndPassword(email, password);

    setState(() {
      _signedUp = false;
    });

    // if (user != null) {
    //   // navigate to home screen
    // }
    // else {
    //   showToast(message: "Error happend. Try Again!");
    // }
  }
}

