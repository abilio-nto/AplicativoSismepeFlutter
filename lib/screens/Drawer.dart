import 'package:carteirasismepe/models/DadosGlobais.dart';
import 'package:carteirasismepe/models/Usuario.dart';
import 'package:carteirasismepe/screens/CardInicial.dart';
import 'package:carteirasismepe/screens/CarteiraPage.dart';
import 'package:carteirasismepe/screens/Servicos.dart';
import 'package:carteirasismepe/screens/SplashScreen.dart';
import 'package:carteirasismepe/screens/carouselPage.dart';
import 'package:carteirasismepe/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.userName, required this.user})
      : super(key: key);
  final String userName;
  final Usuario user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(user: user, userName: userName),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  const HomeScreen({Key? key, required this.userName, required this.user})
      : super(key: key);
  final String userName;
  final Usuario user;
}

class _HomeScreenState extends State<HomeScreen> {

  final _advancedDrawerController = AdvancedDrawerController();
  Usuario? user;
  late String userName;
  ValueNotifier<int> _pageIndex = ValueNotifier<int>(0);
  @override
  void initState() {
    super.initState();
    user = widget.user ?? Usuario.defaultValue();

  }

  @override
  Widget build(BuildContext context) {
    DadosGlobais dadosGlobais = Provider.of<DadosGlobais>(context);
    List<String> nomes = user!.nome.split(" ");
    String primeirosDoisNomes = nomes.sublist(0, 2).join(" ");
    String primeiroNome = nomes.sublist(0, 1).join(" ");
    return ValueListenableBuilder<int>(valueListenable: _pageIndex , builder: (context,_pageIndex,child) {
      return AdvancedDrawer(
          backdrop: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [Colors.blue, Colors.blue.withOpacity(0.2)],
              // ),
            ),
          ),
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
           openScale: 1.0,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            // NOTICE: Uncomment if you want to add shadow behind the page.
            // Keep in mind that it may cause animation jerks.
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //     color: Colors.black12,
            //     blurRadius: 0.0,
            //   ),
            // ],
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 60,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(2.0),
                child: Container(
                  color: Colors.cyanAccent, // Cor da borda
                  height: 2.0, // Espessura da borda
                ),
              ),
              title: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text('Olá, ${primeiroNome}', style: TextStyle( color: Colors.blue),),
                  )
              ),

              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        key: ValueKey<bool>(value.visible,),
                        color: Colors.blue,
                      ),
                    );
                  },
                ),
              ),
            ),
            body:
                   Container(
                       decoration: BoxDecoration(
                         color: Colors.lightBlueAccent,
                         image: DecorationImage(
                           image: AssetImage('assets/img/1.png'), // Substitua pelo caminho da sua imagem
                           fit: BoxFit.cover,
                         ),
                       ),
                       width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height,
                       child: SingleChildScrollView(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Center(
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Card(
                                     elevation: 7,
                                     shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(9.0)),
                                     clipBehavior: Clip.hardEdge,
                                     child: Container(
                                       decoration: BoxDecoration(
                                           border: Border(
                                             top: BorderSide(
                                               color: Colors.cyanAccent, // Cor da borda
                                               width: 3.0, // Espessura da borda
                                             ),
                                           )),
                                       child: InkWell(
                                         splashColor: Colors.blue.withAlpha(30),
                                         child: SizedBox(
                                           width: 460,
                                           height: 500,
                                           child: Stack(
                                             children: [
                                               Row(
                                                 children: [
                                                   Expanded( // Adicionado widget Expanded
                                                     child: Image.network(
                                                       'https://drive.google.com/uc?export=view&id=1gHJApZyhbEoNIyaDoBdEUlcfwbvUOcIe',
                                                       fit: BoxFit.cover,
                                                       height: 500,
                                                       width: 500,
                                                     ),
                                                   )
                                                 ],
                                               ),
                                             ],
                                           ),
                                         ),
                                       ),
                                     )),
                               ),
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                CardInicial(pageName: "FaleConosco",icon: "IconamoonPhone", desc:"Fale Conosco" ),
                               // CardInicial(pageName: "DuvidasFrequentes",icon: "IconamoonQuestionMarkCircleBold", desc:"Dúvidas Frequentes" ),
                             ],)
                           ],
                         ),
                       )
                   ),

          ),
          drawer: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                // image: DecorationImage(
                //   image: AssetImage('assets/img/fundo.png'), // Substitua pelo caminho da sua imagem
                //   fit: BoxFit.cover,
                // ),
              ),
              child: ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width:MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.blue,

                      ),
                      child:       Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.0,
                              height: 100.0,
                              margin: const EdgeInsets.only(
                                top: 24.0,
                                bottom: 15.0,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.person_outline, size: 70, color: Colors.white,),
                              // child: Image(image: AssetImage('assets/img/userIcon.png'), fit: BoxFit.cover, )
                            ),
                            Text(
                              "${user!.nome}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text("Matricula: ${user!.matricula}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                            Text("CPF: ${user!.cpf}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                  child:Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                        userName: '',
                                        user: Usuario.defaultValue(),
                                      )));
                            },
                            shape: Border(
                                bottom:BorderSide(
                                    color: Colors.blue
                                )
                            ),
                            leading:  Image(image: AssetImage('assets/img/homeIcon.png'), fit: BoxFit.cover, ),
                            title: Text('Inicio',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ),
                          ListTile(

                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Servicos()),
                                    (Route<dynamic> route) => route is Servicos, // mantém apenas a rota da página de serviços
                              );

                              DadosGlobais dadosGlobais = Provider.of<DadosGlobais>(context, listen: false);
                              dadosGlobais.atualizarSelectedIndex(1);

                            },
                            leading:  Image(image: AssetImage('assets/img/carteiraIcon.png'), fit: BoxFit.cover, ),
                            shape: Border(
                                bottom:BorderSide(
                                    color: Colors.blue
                                )
                            ),
                            title: Text('Carteira',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Image(image: AssetImage('assets/img/faleConoscoicon.png'), fit: BoxFit.cover, ),
                            title: Text('Fale Conosco',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                            shape: Border(
                                bottom:BorderSide(
                                    color: Colors.blue
                                )
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading:Image(image: AssetImage('assets/img/duvidasicon.png'), fit: BoxFit.cover, ),
                            title: Text('Dúvidas Frequentes',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                            shape: Border(
                                bottom:BorderSide(
                                    color: Colors.blue
                                )
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                    Spacer(),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black38,
                      ),
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 16.0,
                          ),
                          child: TextButton(
                            onPressed: () => Dialogs.bottomMaterialDialog(
                                msg: 'Tem certeza que deseja sair do Aplicativo?',
                                title: 'Sair Do aplicativo',
                                context: context,
                                actions: [
                                  IconsOutlineButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    text: 'Cancelar',
                                    iconData: Icons.cancel_outlined,
                                    textStyle: TextStyle(color: Colors.grey),
                                    iconColor: Colors.grey,
                                  ),
                                  IconsButton(
                                    onPressed: () async {
                                      // Obtém a instância do SharedPreferences
                                      final prefs =
                                      await SharedPreferences.getInstance();

                                      // Remove o token
                                      prefs.remove('token');

                                      // Atualize o valor de _isLoggedIn para false
                                      // _isLoggedIn.value = false;

                                      // Navega para a página de login
                                      dadosGlobais.usuarioLogado(false);
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => login()),
                                            (Route<dynamic> route) => false,
                                      );
                                    },
                                    text: 'Sair',
                                    iconData: Icons.exit_to_app,
                                    color: Colors.red,
                                    textStyle: TextStyle(color: Colors.white),
                                    iconColor: Colors.white,
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage('assets/img/sairIcon.png'), fit: BoxFit.cover, ),
                                SizedBox(width: 10),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )
      );
    });
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
// import 'package:carteirasismepe/models/Usuario.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
//
// class CustomDrawer extends StatefulWidget {
//   const CustomDrawer({Key? key, required this.userName, this.user})
//       : super(key: key);
//   final String userName;
//   final Usuario? user;
//
//   @override
//   State<CustomDrawer> createState() => _CustomDrawerState();
// }
//
// class _CustomDrawerState extends State<CustomDrawer> {
//   final _advancedDrawerController = AdvancedDrawerController();
//   ValueNotifier<int> _pageIndex = ValueNotifier<int>(0);
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<
//         int>(valueListenable: _pageIndex , builder: (context,_pageIndex,child)
//     {
//       return AdvancedDrawer(
//           backdrop:Container(
//
//           ),
//           controller: _advancedDrawerController,
//           child: Scaffold(
//             appBar: AppBar(
//               title: const Text("teste"),
//               backgroundColor: Colors.blue,
//               toolbarHeight: 60,
//               bottom: PreferredSize(
//                 preferredSize: Size.fromHeight(2),
//                 child: Container(
//                   color: Colors.cyanAccent,
//                   height: 2,
//                 ),
//               ),
//               leading: IconButton(
//                 onPressed: _handleMenuButtonPressed,
//                 icon: ,
//               ),
//             ),
//
//             body: Placeholder(),
//           ) , drawer: Placeholder(),
//       )
//
//     };
//     );
//   }
//
//   void _handleMenuButtonPressed() {
//     // NOTICE: Manage Advanced Drawer state through the Controller.
//     // _advancedDrawerController.value = AdvancedDrawerValue.visible();
//     _advancedDrawerController.showDrawer();
//   }
// }
