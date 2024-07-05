import 'package:flutter/material.dart';
import '../pages/register.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/forget_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default font family.
        fontFamily: "Lexend",
      ),
      
      home: const MyLoginPage(title: ''),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    return Scaffold(
      backgroundColor: Color(0xff350080),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: size.width * 0.5,
            height: size.height * 0.2,
            margin: EdgeInsets.fromLTRB(
              size.width * 0.23,
              size.height * 0,
              size.width * 0.23,
              size.height * 0.08,
            ),
            //decoration: BoxDecoration(color: Colors.black),
            child: SvgPicture.asset(
              "assets/butcheUILogo.svg",
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment(300, 50),
                  padding: EdgeInsets.all(size.width * 0.04),
                  height: size.height * 0.55,
                  width: size.width * 1,
                  decoration: BoxDecoration(
                    color: Color(0xffffffffff),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          size.width * 0.23,
                          size.height * 0.02,
                          size.width * 0.23,
                          size.height * 0.03,
                        ),
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Giriş Yap',
                          style: TextStyle(
                            fontFamily: "Lexend",
                            fontSize: size.width * 0.09,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          size.width * 0.02,
                          size.height * 0,
                          size.width * 0.04,
                          size.height * 0.005,
                        ),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'E-MAIL',
                          style: TextStyle(
                              fontSize: size.width * 0.03,
                              fontFamily: "Lexend",
                              letterSpacing: 2),
                        ),
                      ),
                      Container(
                        child: Container(
                          height: size.height * 0.04,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.1, color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(
                                size.width * 0.02,
                                0,
                                size.width * 0.02,
                                size.height * 0.022,
                              ),
                              hintText: "E-Mail",
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: size.width * 0.03,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          size.width * 0.02,
                          size.height * 0.02,
                          size.width * 0.04,
                          size.height * 0.005,
                        ),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'ŞİFRE',
                          style: TextStyle(
                              fontSize: size.width * 0.03,
                              fontFamily: "Lexend",
                              letterSpacing: 2),
                        ),
                      ),
                      Container(
                        child: Container(
                          height: size.height * 0.04,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.1, color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: Stack(
                            children: [
                              TextField(
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                    size.width * 0.02,
                                    0,
                                    size.width * 0.02,
                                    size.height * 0.022,
                                  ),
                                  hintText: "Şifre",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: size.width * 0.03,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                              Align(
                                alignment: Alignment(1, 0), // Yüksekliği ayarlamak için kullanın
                                child: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          size.width * 0,
                          size.height * 0.015,
                          size.width * 0.56,
                          size.height * 0.03,
                        ),
                        child: GestureDetector(
                          child: Text(
                            'Şifremi Unuttum',
                            style: TextStyle(fontSize: size.width * 0.04),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPassword()),
                            );
                          },
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(70),
                                ),
                              ),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              Size(size.width * 0.6, size.height * 0.07),
                            ),
                            foregroundColor: const MaterialStatePropertyAll(
                                Color(0xffF4F4F4)),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xff39B54A)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Giriş Yap',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          size.width * 0.23,
                          size.height * 0.02,
                          size.width * 0.23,
                          size.height * 0.003,
                        ),
                        child: Text(
                          'Hesabın yok mu?',
                          style: TextStyle(fontSize: size.width * 0.05),
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          child: Text(
                            'Kayıt Ol',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
