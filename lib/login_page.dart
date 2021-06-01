import 'package:flutter/material.dart';
import 'package:hsvh_test/auth_service.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool state = true;

  void setlogin(bool newState) {
    print("working 2");
    setState(() {
      state = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 30,
          ),
          child: ListView(
            children: <Widget>[
              Center(
                child: Text(
                  'Welcome to Applore',
                  style: TextStyle(
                    fontFamily: 'Titillium Web',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Developing and delivering Native and Hybrid mobile apps and webapps using modern technologies.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/welcome.jpg"),
                  ),
                ),
              ),
              state ? Login(setlogin) : SignUp(setlogin),
            ],
          ),
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context, String message) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).maybePop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class Login extends StatelessWidget {
  final Function setlogin;
  Login(this.setlogin);
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'User Id',
          ),
          controller: _emailC,
        ),
        TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Password',
          ),
          obscureText: true,
          controller: _passwordC,
        ),
        MaterialButton(
          minWidth: double.infinity,
          onPressed: () {
            if (_emailC.text.isNotEmpty && _passwordC.text.length >= 6) {
              AuthService().signIn(_emailC.text, _passwordC.text).catchError(
                (onError) {
                  showAlertDialog(
                    context,
                    onError.message.toString(),
                  );
                },
              );
            } else {
              showAlertDialog(
                context,
                'Invalid Email or Password',
              );
            }
          },
          height: 60,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            'Login',
            style: TextStyle(
              fontFamily: 'Titillium Web',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          color: Colors.grey[700],
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {
            print('working 1');
            setlogin(false);
          },
          child: Text(
            'New User? SignUp',
          ),
        ),
      ],
    );
  }
}

class SignUp extends StatelessWidget {
  final Function setlogin;
  SignUp(this.setlogin);
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'User Id',
          ),
          controller: _emailC,
        ),
        TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Password',
          ),
          obscureText: true,
          controller: _passwordC,
        ),
        MaterialButton(
          minWidth: double.infinity,
          onPressed: () {
            if (_emailC.text.isNotEmpty && _passwordC.text.length >= 6) {
              AuthService().signUp(_emailC.text, _passwordC.text).catchError(
                (onError) {
                  showAlertDialog(
                    context,
                    onError.message.toString(),
                  );
                },
              );
            } else {
              showAlertDialog(
                context,
                'Invalid Email or Password',
              );
            }
          },
          height: 60,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontFamily: 'Titillium Web',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          color: Colors.grey[700],
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: () {
            setlogin(true);
          },
          child: Text(
            'Existing User? Login',
          ),
        ),
      ],
    );
  }
}
