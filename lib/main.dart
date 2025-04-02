import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //Start
  bool _copiedPhone = false;
  bool _copiedEmail = false;

  void copyToClipboard(BuildContext context, String text, bool isPhone) {
    Clipboard.setData(ClipboardData(text: text));

    setState(() {
      if (isPhone) {
        _copiedPhone = true;
      } else {
        _copiedEmail = true;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied: $text'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );

    // Reset the icon after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        if (isPhone) {
          _copiedPhone = false;
        } else {
          _copiedEmail = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('image/user.png'),
                  radius: 50.0,
                  backgroundColor: Colors.red[50],
                ),
                Text(
                  'GRUND.EO',
                  style: TextStyle(
                    fontFamily: 'FugazOne',
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    letterSpacing: 5.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(color: Colors.teal.shade100),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.phone, color: Colors.teal),
                      title: Text(
                        '+234 9012798330',
                        style: TextStyle(
                          color: Colors.teal,
                          fontFamily: 'Roboto',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(
                        _copiedPhone ? Icons.check : Icons.copy,
                        color: Colors.teal,
                      ),
                      onTap:
                          () =>
                              copyToClipboard(context, '+234 9012798330', true),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.mail, color: Colors.teal),
                      title: Text(
                        'oebuka198@gmail.com',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Colors.teal,
                        ),
                      ),
                      trailing: Icon(
                        _copiedEmail ? Icons.check : Icons.copy,
                        color: Colors.teal,
                      ),
                      onTap:
                          () => copyToClipboard(
                            context,
                            'oebuka198@gmail.com',
                            false,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
