import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/app_theme.dart';
import 'package:flutter_clean_architecture/src/features/auth/domain/stores/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  var email = '';
  var password = '';
  final authStore = Modular.get<AuthStore>();

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.appColor,
      ),
      child: Scaffold(
        backgroundColor: AppTheme.appColor,
        body: Stack(
          children: [
            Positioned(top: -60, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.scale(
                scale: 0.20,
                child: Image.asset(
                  'assets/images/Unity FIT Logo.png',
                )
          ),
          const Text(
            "unityFit",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              letterSpacing: 2
            )
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Bem Vindo", style: TextStyle(
          color: AppTheme.appColor,
          fontSize: 32,
          )
        ),
        _buidGrayText("Faça seu login"),
        const SizedBox(height: 40,),
        //_buidGrayText("Email"),
        TextFormField(
          onChanged: (value){
            email=value;
          },
          decoration: const InputDecoration(
            //border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
        //_buildInputField(emailController),
        const SizedBox(height: 40),
        //_buidGrayText("Senha"),
        TextFormField(
          onChanged: (value){
            password=value;
          },
          decoration: const InputDecoration(
            //border: OutlineInputBorder(),
            labelText: 'Senha',
          ),
          obscureText: true,
        ),
        //_buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buidRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginButtom(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buidGrayText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey
      )
    );
  }

  Widget _buidRememberForgot(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: rememberUser, onChanged: (value){
              setState((){
                rememberUser = value!;
              });
            }),
            _buidGrayText("Lembre de mim")
          ],
        )
      ],
    );
  }

  Widget _buildLoginButtom(){
    return ElevatedButton(
      onPressed: () async {
        if (email.isNotEmpty && password.isNotEmpty) {
          final authStore = Modular.get<AuthStore>();
          authStore.login(email: email, password: password);
          Modular.to.navigate('/home');
        } else {
          // mensagem de erro
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.appColor,
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: AppTheme.appColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

  }
}