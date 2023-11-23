import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mmt_auto/src/user/desktop/desk_image.dart';
import 'package:mmt_auto/src/user/mobile/mobile_image.dart';
import 'package:url_launcher/url_launcher.dart';


final Uri githubMMT = Uri.parse('https://github.com/mireaMegaman/perm_hack');


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  Future<void> _launchUrl() async {
    if (!await launchUrl(githubMMT)) {
      throw Exception('Could not launch $githubMMT');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 300, maxWidth: 620),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child:                    Image(
                              image: AssetImage("assets/images/MinPrir.png"),
                              height: 150,
                              width: 250,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              constraints: const BoxConstraints(minWidth: 150, maxWidth: 400),
                              child: 
                              const Text(
                                "Приветствуем в",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 28,
                                  color: Color(0xFFF3F2F3),
                                ),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints(minWidth: 150, maxWidth: 400),
                              child: 
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                child: Text(
                                  "MMT-AUTO",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 28,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints(minWidth: 120, maxWidth: 400),
                              child: 
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                                child: Text(
                                  "Продукт разработан совместно с \n'Минприроды России' \n\nОбработка видеофиксации транспорта",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20,
                                    color: Color(0xffcdcdcd),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                            const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                            child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 4,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (Platform.isWindows || Platform.isLinux) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const MainDesktop()),
                                      );
                                    }
                                    if (Platform.isAndroid) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const MainMobile()),
                                      );
                                    }
                                  },
                                  color: const Color(0xFF62CA76),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  // textColor: const Color(0xff393939),
                                  textColor: const Color(0xFF181818),
                                  height: 50,
                                  child: const Text(
                                    "Начать работу",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   flex: 4,
                              //   child: MaterialButton(
                              //     onPressed: () {
                              //       // Navigator.push(
                              //       //   context,
                              //       //   MaterialPageRoute(builder: (context) => const Login()),
                              //       // );
                              //     },
                              //     color: const Color(0xFF62CA76),
                              //     elevation: 0,
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(22.0),
                              //     ),
                              //     padding: const EdgeInsets.all(16),
                              //     // textColor: const Color(0xff393939),
                              //     textColor: const Color(0xFF181818),
                              //     height: 50,
                              //     child: const Text(
                              //       "Войти",
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //         fontSize: 16,
                              //         fontWeight: FontWeight.w700,
                              //         fontStyle: FontStyle.normal,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   width: 16,
                              // ),
                              // Expanded(
                              //   flex: 6,
                              //   child: MaterialButton(
                              //     onPressed: () {
                              //       // Navigator.push(
                              //       //   context,
                              //       //   MaterialPageRoute(builder: (context) => const Register()),
                              //       //   // MaterialPageRoute(builder: (context) => CVModel()),
                              //       // );
                              //     },
                              //     color: const Color(0x00697a71),
                              //     elevation: 0,
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(22.0),
                              //       side: const BorderSide(
                              //           color: Color(0xff424242), width: 2),
                              //     ),
                              //     padding: const EdgeInsets.all(16),
                              //     textColor: const Color(0xFF62CA76),
                              //     height: 50,
                              //     child: const Text(
                              //       "Создать профиль",
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //         fontSize: 16,
                              //         fontWeight: FontWeight.w700,
                              //         fontStyle: FontStyle.normal,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: Padding(
                        //     padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        //     child: 
                        //       Column(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         mainAxisSize: MainAxisSize.min,
                        //         children: [
                        //           const Padding(
                        //             padding: EdgeInsets.fromLTRB(0, 0, 7, 0),
                        //             child: Text(
                        //               "Еще не готовы зарегестрироваться?",
                        //               textAlign: TextAlign.start,
                        //               overflow: TextOverflow.clip,
                        //               style: TextStyle(
                        //                 fontWeight: FontWeight.w400,
                        //                 fontStyle: FontStyle.normal,
                        //                 fontSize: 14,
                        //                 color: Color(0xffc7c4c4),
                        //               ),
                        //             ),
                        //           ),
                        //           MaterialButton(
                        //             onPressed: () {
                        //               // Navigator.push(
                        //               //   context,
                        //               //   MaterialPageRoute(builder: (context) => const CVModel()),
                        //               // );                                    
                        //             },
                        //             color: const Color(0x00ffffff),
                        //             elevation: 0,
                        //             shape: const RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.zero,
                        //             ),
                        //             padding: const EdgeInsets.all(0),
                        //             textColor: const Color(0xFF62CA76),
                        //             height: 40,
                        //             minWidth: 90,
                        //             child: const Text(
                        //               "Тогда просто попробуйте",
                        //               style: TextStyle(
                        //                 fontSize: 14,
                        //                 fontWeight: FontWeight.w400,
                        //                 fontStyle: FontStyle.normal,
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //   ),
                        // ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: 
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 7, 0),
                                    child: Text(
                                      "Source-код вы можете найти",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xffc7c4c4),
                                      ),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      _launchUrl();
                                    },
                                    color: const Color(0x00ffffff),
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    padding: const EdgeInsets.all(0),
                                    textColor: const Color(0xFF62CA76),
                                    height: 40,
                                    minWidth: 90,
                                    child: const Text(
                                      "на нашем Github",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
