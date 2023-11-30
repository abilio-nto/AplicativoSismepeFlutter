// import 'package:flutter/material.dart';
// import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
//
//
//
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'FanCarouselImageSlider',
// //       theme: ThemeData(
// //         primarySwatch: Colors.pink,
// //       ),
// //       home: const HomePage(),
// //     );
// //   }
// // }
//
// class CarouselPage extends StatelessWidget {
//   const CarouselPage({super.key});
//
//   static const List<String> sampleImages = [
//     'https://2.bp.blogspot.com/-gzfl9GpT7GA/UM8W4tAvA2I/AAAAAAAAFRA/KoUM8hCc0c4/s1600/marcacao_consulta.jpg',
//     'https://www.sismepe.pe.gov.br/wp-content/uploads/2021/09/NOVO-SISMEPE-scaled-e1675341849261.jpg',
//     'https://www.sismepe.pe.gov.br:4443/Imagens/logo_sismepe.jpg',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               height: 600, // Defina a altura que você deseja para o carrossel
//               child: FanCarouselImageSlider(
//                 imagesLink: sampleImages,
//                 isAssets: false,
//                 autoPlay: true,
//                 expandImageHeight: 600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselPage extends StatefulWidget {
  CarouselPage({Key? key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const List<String> sampleImages = [
      'https://drive.google.com/uc?export=view&id=14LxJdz8KG0WDc-LeJ5hLjzpykYGRxZE4',
      'https://drive.google.com/uc?export=view&id=14Tw4N5jj_SGSefSsuNPbsCHwITuSPUnf',
      'https://drive.google.com/uc?export=view&id=1mLJkes1ST96INdXuQ_yYELBbSkT1U43j',
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 500,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: sampleImages.map((item) => Container(
              child: Center(
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
                          width: 500,
                          height: 500,
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Expanded( // Adicionado widget Expanded
                                    child: Image.network(
                                      item,
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
            )).toList(),
          ),
        ],
      ),
    );

  }
}
