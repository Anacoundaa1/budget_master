import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/object.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';


void main() {
  runApp(MainApplication());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {

@override
  StatefulElement createElement() {
    // TODO: implement createElement
    return super.createElement();
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Accueil(),
    SuiviDepense(),
    AjouterDepenses(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Suivi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Ajouter dépenses',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green, // Couleur de l'élément sélectionné
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}


class AjouterDepenses extends StatelessWidget {
  const AjouterDepenses({super.key});

  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home:  Scaffold(
          body: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 500,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xFF215555),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                  ),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 40, right: 30, top: 80),
                  child: const Text(
                    'Ajouter mes dépenses',
                    style: TextStyle(
                      fontFamily: 'ClashDisplayMedium',
                      fontSize: 30,
                      color: Colors.white
                    ),
                  ),
                ),
                Container(
                  width: 500,
                  height: 632,
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(40),
                  child: 
                     const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         AjouterDepenseForm()
                      ],
                    )
                ),
              ],
              
              
            ),
            backgroundColor: Colors.white,
        ),
      );
    }
}

class SuiviDepense extends StatelessWidget {
  const SuiviDepense({super.key});

  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home:  Scaffold(
          body: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 500,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Color(0xFF215555),
                  ),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 40, right: 30, top: 80),
                  child: const Text(
                    'Détails des dépenses',
                    style: TextStyle(
                      fontFamily: 'ClashDisplayMedium',
                      fontSize: 30,
                      color: Colors.white
                    ),
                  ),
                ),
                Container(
                  width: 500,
                  height: 682,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    boxShadow: const [BoxShadow(blurRadius: 8, spreadRadius: 2)],
                    color: Colors.white
                  ),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(40),
                  child: 
                     const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'février 2024',
                          style: TextStyle(
                            fontFamily: 'ClashDisplaySemiBold',
                            fontSize: 13,
                            color: Colors.grey
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Depense(),
                        Depense(),
                        Depense(),
                        SizedBox(height: 25),
                        Text(
                          'janvier 2024',
                          style: TextStyle(
                            fontFamily: 'ClashDisplaySemiBold',
                            fontSize: 13,
                            color: Colors.grey
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Depense(),
                        Depense(),
                        Depense(),
                        SizedBox(height: 30),
                        Text(
                          'décembre 2024',
                          style: TextStyle(
                            fontFamily: 'ClashDisplaySemiBold',
                            fontSize: 13,
                            color: Colors.grey
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Depense(),
                      ],
                    )
                ),
              ],
              
              
            ),
            backgroundColor: Color(0xFF215555),
        ),
      );
    }
}


class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  height: 432,
                  decoration: const BoxDecoration(
                    color: Color(0xFF215555)
                  ),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 30, right: 30, top: 70),
                  child: const CarteDepenseTotal()
                ),
                Container(
                  width: 500,
                  height: 400,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    boxShadow: const [BoxShadow(blurRadius: 8, spreadRadius: 2)],
                    color: Colors.white
                  ),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(40),
                  child: 
                     const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'Activité récentes',
                          style: TextStyle(
                            fontFamily: 'ClashDisplaySemiBold',
                            fontSize: 25,
                            color: Colors.black
                          ),
                        ),
                         Text(
                          'janvier 2024',
                          style: TextStyle(
                            fontFamily: 'ClashDisplaySemiBold',
                            fontSize: 13,
                            color: Colors.grey
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Depense(),
                        Depense(),
                        Depense(),
                      ],
                    )
                ),
              ],
              
              
            ),
            backgroundColor: Color(0xFF215555),
      );
    }
}

class MainApplication extends StatelessWidget {
    const MainApplication({super.key});
    @override
      Widget build(BuildContext context) {
        return MaterialApp(
          routes: {
            '/': (context) => MainApp(), 
            '/homePage': (context) => MyApp(), 
          }
        );
      }
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: 
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   HalfCircle(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
              
                children: [
                  Text(
                    'CONNEXION',
                    style: TextStyle(
                      fontFamily: 'ClashDisplaySemibold',
                      fontSize: 35,
                      color: Color(0xFF215555)
                    ),
                  ),
                  Divider( 
                    color: Color(0xFF215555), // Couleur du trait
                    thickness: 7, // Epaisseur du trait
                    indent: 110, // Marge à gauche du trait
                    endIndent: 260, // Marge à droite du trait
                  ),
                  LoginForm()
                  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   HalfCircle(),
                ],
              ),
            ],
          ),
    );
  }
}


class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>(); 
  late String _username;
  late String _password; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100.0,right: 100.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'nom d\'utilisateur',
                hintStyle: TextStyle(
                  fontFamily: 'ClashDisplayRegular',
                  fontSize: 20,
                  color: Color.fromARGB(200, 33, 85, 85)
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir votre nom d\'utilisateur';
                }
                return null;
              },
              onSaved: (value) {
                _username = value!;
              },
            ),
            TextFormField(
              obscureText: true, 
              decoration: const InputDecoration(
                hintText: 'mot de passe',
                hintStyle: TextStyle(
                  fontFamily: 'ClashDisplayRegular',
                  fontSize: 20,
                  color: Color.fromARGB(200, 33, 85, 85)
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir votre mot de passe';
                }
                return null;
              },
              onSaved: (value) {
                _password = value!;
              },
            ),
            SizedBox(height: 16), // Espace vertical entre les champs de texte
            FilledButton(
              onPressed: () {
                 Navigator.of(context).pushNamed('/homePage');
                if (_formKey.currentState!.validate()) {
                  // Valide le formulaire
                  _formKey.currentState!.save(); // Sauvegarde les valeurs du formulaire
                  // Ici, vous pouvez traiter les données du formulaire (par exemple, authentification)
                  print('Nom d\'utilisateur: $_username');
                  print('Mot de passe: $_password');
                }
              },
              child: Text(
                'Se connecter',
                style: TextStyle(
                  fontFamily: 'ClashDisplayMedium', // Police personnalisée
                  fontSize: 15, 
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 77, 152, 103)), // Couleur de fond du bouton
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Couleur du texte du bouton
                minimumSize: MaterialStateProperty.all<Size>(Size(250, 30)), // Taille minimale du bouton
                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))), // Forme du bouton (bordures non arrondies)
              ),
            ),
            const Row(
              children: [
                Text(
                  "Tu n’as pas de compte ? ",
                  style: TextStyle( 
                    fontFamily: 'ClashDisplayRegular', // Police personnalisée
                    fontSize: 10.5, // Taille de la police
                  ),
                ),
                Text(
                  "Créer un compte",
                  style: TextStyle( 
                    fontFamily: 'ClashDisplayRegular', 
                    fontSize: 10.5,
                    decoration: TextDecoration.underline, 
                  ),
                )
              ],
            )
            
          ],
        ),
      ),
    );
  }
}

class QuarterCircle extends StatelessWidget {
  const QuarterCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.green, // Couleur du cercle
        ),
        Positioned(
          left: 0,
          top: 0,
          child: ClipPath(
            clipper: QuarterCircleClipper(), // Utilisation du CustomClipper
            child: Container(
              width: 100, // Largeur du quart de cercle
              height: 100, // Hauteur du quart de cercle
              color: Colors.green, // Couleur du quart de cercle
            ),
          ),
        ),
      ],
    );
  }
}
class QuarterCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0); // Ligne horizontale vers la droite
    path.arcToPoint(
      Offset(0, size.height), // Point de fin de l'arc
      radius: Radius.circular(size.width), // Rayon du cercle
      clockwise: false, // Sens anti-horaire
    );
    path.close(); // Fermeture du chemin pour former un quart de cercle
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(200, 33, 85, 85) // Couleur du demi-cercle
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawArc(rect, pi, pi, true, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class HalfCircle extends StatelessWidget {
  const HalfCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HalfCirclePainter(),
      child: Container(
        width: 150, // Largeur du demi-cercle
        height: 150, // Hauteur du demi-cercle
      ),
    );
  }
}



class Depense extends StatelessWidget {
  const Depense({super.key});

  @override
    Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(10),
               decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xFF215555)
                ),
                child: const Text(
                  'AB',
                  style: TextStyle(
                    fontFamily: 'ClashDisplayRegular',
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
            ),
            const SizedBox(width: 30),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Accueil',
                  style: TextStyle(
                    fontFamily: 'ClashDisplaySemiBold',
                    fontSize: 20,
                    color: Colors.black
                  ),
                ),
                Text(
                  'Accueil',
                  style: TextStyle(
                    fontFamily: 'ClashDisplayRegular',
                    fontSize: 15,
                    color: Colors.black
                  ),
                ),
              ],
            ), 
            const SizedBox(width: 130),
            const Text(
              '+ 125 €',
              style: TextStyle(
                fontFamily: 'ClashDisplayMedium',
                fontSize: 20,
                color: Colors.green
              ),
            ),
          ],
        ),
      );
    }
}


class CarteDepenseTotal extends StatelessWidget {
  const CarteDepenseTotal({super.key});

  @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Accueil',
                style: TextStyle(
                  fontFamily: 'ClashDisplayMedium',
                  fontSize: 35,
                  color: Colors.white
                ),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                child: Text(
                  'Se deconnecter',
                  style: TextStyle(
                    fontFamily: 'ClashDisplayMedium', // Police personnalisée
                    fontSize: 15, 
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 196, 46, 0)), // Couleur de fond du bouton
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Couleur du texte du bouton
                  minimumSize: MaterialStateProperty.all<Size>(Size(100, 30)), // Taille minimale du bouton
                  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))), // Forme du bouton (bordures non arrondies)
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Container(
            width: 380,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.5),width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 20,
                ),
              ],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(189, 49, 144, 51),
                  Color.fromARGB(189, 7, 161, 195),
                ]
              )
              
            ),
            child: const Padding(
              padding: EdgeInsets.only(left:30.0, top:20,bottom: 20),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dépenses mensuelles depuis le 01/01/24',
                    style: TextStyle(
                      fontFamily: 'ClashDisplayLight',
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    '1.050,95 €',
                    style: TextStyle(
                      fontFamily: 'ClashDisplaySemiBold',
                      fontSize: 40,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    'Carte universelle de BENALIA Mohamed',
                    style: TextStyle(
                      fontFamily: 'ClashDisplayLight',
                      fontSize: 15,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }
}




class AjouterDepenseForm extends StatefulWidget {
  const AjouterDepenseForm({super.key});

  @override
  _AjouterDepenseFormState createState() => _AjouterDepenseFormState();
}

class _AjouterDepenseFormState extends State<AjouterDepenseForm> {
  final _formKey = GlobalKey<FormState>(); 
  late String _montant;
  late String _intitule;
  late String _date;
  late String _categorie;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0,right: 40.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'montant de la dépense',
                hintStyle: TextStyle(
                  fontFamily: 'ClashDisplayRegular',
                  fontSize: 20,
                  color: Color.fromARGB(200, 33, 85, 85)
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir votre nom d\'utilisateur';
                }
                return null;
              },
              onSaved: (value) {
                _montant = value!;
              },
            ),
             SizedBox(height: 40), 
            TextFormField(
              obscureText: true, 
              decoration: const InputDecoration(
                hintText: 'intitule',
                hintStyle: TextStyle(
                  fontFamily: 'ClashDisplayRegular',
                  fontSize: 20,
                  color: Color.fromARGB(200, 33, 85, 85)
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir votre mot de passe';
                }
                return null;
              },
              onSaved: (value) {
                _intitule = value!;
              },
            ),
             SizedBox(height: 40), 
            TextFormField(
              obscureText: true, 
              decoration: const InputDecoration(
                hintText: 'date',
                hintStyle: TextStyle(
                  fontFamily: 'ClashDisplayRegular',
                  fontSize: 20,
                  color: Color.fromARGB(200, 33, 85, 85)
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir votre mot de passe';
                }
                return null;
              },
              onSaved: (value) {
                _intitule = value!;
              },
            ),
            SizedBox(height: 40), 
            TextFormField(
              obscureText: true, 
              decoration: const InputDecoration(
                hintText: 'catégorie',
                hintStyle: TextStyle(
                  fontFamily: 'ClashDisplayRegular',
                  fontSize: 20,
                  color: Color.fromARGB(200, 33, 85, 85)
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir votre mot de passe';
                }
                return null;
              },
              onSaved: (value) {
                _intitule = value!;
              },
            ),
            SizedBox(height: 40), // Espace vertical entre les champs de texte
            FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Valide le formulaire
                  _formKey.currentState!.save(); // Sauvegarde les valeurs du formulaire
                  // Ici, vous pouvez traiter les données du formulaire (par exemple, authentification)
                  print('Nom d\'utilisateur: $_montant');
                  print('Mot de passe: $_intitule');
                }
              },
              child: Text(
                'Ajouter',
                style: TextStyle(
                  fontFamily: 'ClashDisplayMedium', // Police personnalisée
                  fontSize: 15, 
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 77, 152, 103)), // Couleur de fond du bouton
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Couleur du texte du bouton
                minimumSize: MaterialStateProperty.all<Size>(Size(250, 30)), // Taille minimale du bouton
                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))), // Forme du bouton (bordures non arrondies)
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

