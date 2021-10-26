import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
      MaterialApp(
        home: MainPage(),
      ),
    );

final colorPrimary = Color(0xFFFF4891);

class MainPage extends StatelessWidget {
  @override
  build(BuildContext ctx) {
    final fullWidth = MediaQuery.of(ctx).size.width;
    final smallDiameter = fullWidth * 2 / 3;
    final bigDiameter = fullWidth * 7 / 8;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: -smallDiameter / 3,
            top: -smallDiameter / 3,
            child: Container(
              width: smallDiameter,
              height: smallDiameter,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFB226B2), Color(0xFFFF6DA7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: -smallDiameter / 4,
            top: -smallDiameter / 4,
            child: Container(
              width: bigDiameter,
              height: bigDiameter,
              child: Center(
                child: Text(
                  'dribblee',
                  style: GoogleFonts.pacifico(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFB226B2), colorPrimary],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            right: -bigDiameter / 2,
            bottom: -bigDiameter / 2,
            child: Container(
              width: bigDiameter,
              height: bigDiameter,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF3E9EE),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 300, 20, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: colorPrimary,
                          ),
                          labelText: 'Email: ',
                          labelStyle: TextStyle(color: colorPrimary),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                        ),
                        cursorColor: colorPrimary,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: colorPrimary,
                          ),
                          labelText: 'Password: ',
                          labelStyle: TextStyle(color: colorPrimary),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: colorPrimary,
                            ),
                          ),
                        ),
                        cursorColor: colorPrimary,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                    child: Text(
                      'FORGOT PASSWORD?',
                      style: TextStyle(fontSize: 12, color: colorPrimary),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: fullWidth / 2,
                        height: 40,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: Center(
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              splashColor: Colors.amber,
                              onTap: () {},
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Color(0xFFB226B2), colorPrimary],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEsnhuk7RNQtaawHAefA1oDZjeUySF-sRzBHoBcAw&s=0',
                        ),
                        clipBehavior: Clip.antiAlias,
                        mini: true,
                        elevation: 0,
                        onPressed: () {},
                      ),
                      FloatingActionButton(
                        child: Image.network(
                          'https://static.xx.fbcdn.net/rsrc.php/v3/yZ/r/FRUz8mgQn8c.png',
                        ),
                        clipBehavior: Clip.antiAlias,
                        mini: true,
                        elevation: 0,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DON\'T HAVE ACCOUNT?',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                        color: colorPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
