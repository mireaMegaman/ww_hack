// base dart
import 'dart:convert';
// base flutter
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// app pages
import 'package:mmt_auto/src/user/desktop/desk_image.dart';
import 'package:mmt_auto/src/user/desktop/desk_video.dart';
import 'package:mmt_auto/src/user/mmt.dart';
// external dependencies
import 'package:url_launcher/url_launcher.dart';

// ---------------------------------------------------------------------------------------------- //
// ---------------------------------------------------------------------------------------------- //

final Uri repository = Uri.parse('https://github.com/mireaMegaman/perm_hack');

// ---------------------------------------------------------------------------------------------- //
// ---------------------------------------------------------------------------------------------- //

class RTSPDesktop extends StatefulWidget {
  const RTSPDesktop({super.key});
  
  @override
  State<RTSPDesktop> createState() => RTSPDeskState();

}

// ---------------------------------------------------------------------------------------------- //
// ---------------------------------------------------------------------------------------------- //

class  RTSPDeskState extends State<RTSPDesktop>{

  Future<void> sendTextMessage(String message) async {
    final url = Uri.parse('http://127.0.0.1:80/rtsp');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'message': message});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Text message sent successfully');
      } else {
        print('Failed to send text message');
      }
    } catch (error) {
      print('Error sending text message: $error');
    }
  }

  final ScrollController _vertical = ScrollController(), _horizontal = ScrollController();
  final _myController = TextEditingController();
  var rtspLink = '';

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  Future<void> _repo() async {
    if (!await launchUrl(repository)) {
      throw Exception('Could not launch $repository');
    }
  }
  
// ---------------------------------------------------------------------------------------------- //
// ---------------------------------------------------------------------------------------------- //

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_mmt.jpg"), fit: BoxFit.cover
        )
      ),
      child: 
        Scaffold(
          backgroundColor: const Color.fromARGB(105, 0, 0, 0),
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            backgroundColor: const Color.fromARGB(45, 0, 0, 0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(6,0,0,0),
              child: IconButton(
                icon: Image.asset('assets/images/loader.png'),
                padding: const EdgeInsets.all(12.0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainDesktop()),
                  );
                },
              ),
            ),
            title: Row(
              children: [
                  TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainDesktop()),
                    );
                  }, 
                  child: 
                    const Text(
                      "Фото",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(255, 128, 128, 128)
                      ),
                    )
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const VideoDesktop()),
                    );
                  }, 
                  child: 
                    const Text(
                      "Видео",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(255, 128, 128, 128)
                      ),
                    )
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RTSPDesktop()),
                    );
                  }, 
                  child: 
                    const Text(
                      "RTSP",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(255, 117, 199, 50)
                      ),
                    )
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Megamen()),
                    );
                  }, 
                  child: 
                    const Text(
                      "Команда",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(255, 128, 128, 128)
                      ),
                    )
                ),
              ),
              Padding(
              padding: const EdgeInsets.fromLTRB(6,0,0,0),
                child: IconButton(
                  icon: Image.asset('assets/images/github.png', color: const Color.fromARGB(255, 128, 128, 128), height: 22,),
                  padding: const EdgeInsets.all(12.0),
                  onPressed: () {
                    _repo();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                child:  IconButton(
                  icon: const Icon(
                    Icons.autorenew_outlined,
                    color: Color.fromARGB(255, 117, 199, 50),
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      rtspLink = '';
                    });
                  },
                ),
              ),
            ],
          ),
          body: 
            Center(
              child: 
              RawScrollbar(
                controller: _horizontal,
                trackVisibility: true,
                thickness: 7,
                thumbColor: const Color.fromARGB(47, 39, 176, 67),
                radius: const Radius.circular(20),
                child: RawScrollbar(
                  controller: _vertical,
                  // thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 7,
                  thumbColor: const Color.fromARGB(47, 39, 176, 67),
                  radius: const Radius.circular(20),
                  notificationPredicate: (notif) => notif.depth == 1,
                  child: SingleChildScrollView(
                    controller: _horizontal,
                    child: SingleChildScrollView( 
                      controller: _vertical,
                      scrollDirection: Axis.horizontal,
                      child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ConstrainedBox(constraints: const BoxConstraints(minWidth: 300, maxWidth: 1000),
                            child: 
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Text(
                                              "Для обработки RTSP-потоков введите ссылку ниже:",
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18,
                                                color: Color.fromARGB(255, 235, 232, 232),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.fromLTRB(5, 5, 5, 20),
                                            padding:
                                                const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                            width: 400, 
                                            // MediaQuery.of(context).size.width * 0.45
                                            height: 70,
                                            decoration: BoxDecoration(
                                              // color: const Color(0xff5f7078),
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: TextField(
                                                    controller: _myController,
                                                    obscureText: false,
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16,
                                                      color: Color(0xffffffff),
                                                    ),
                                                    decoration: InputDecoration(
                                                      disabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(6.0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF62CA76), width: 1),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(6.0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF62CA76), width: 1),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(6.0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF62CA76), width: 1),
                                                      ),
                                                      labelText: "Введите RTSP-ссылку",
                                                      labelStyle: const TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 16,
                                                        color: Color(0xffd7d7d7),
                                                      ),
                                                      hintText: "Ваша ссылка здесь",
                                                      hintStyle: const TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 16,
                                                        color: Color.fromARGB(56, 245, 241, 241),
                                                      ),
                                                      filled: false,
                                                      fillColor: const Color(0x00505050),
                                                      isDense: false,
                                                      contentPadding: const EdgeInsets.symmetric(
                                                          vertical: 8, horizontal: 12),
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.login),
                                                  onPressed: () {
                                                    // print(_myController.text);
                                                    sendTextMessage(_myController.text);
                                                    rtspLink = _myController.text;
                                                    setState(() {
                                                      _myController.text = '';
                                                    });
                                                  },
                                                  
                                                  color: const Color(0xFF62CA76),
                                                  iconSize: 24,
                                                ),
                                              ],
                                            ),
                                          ),
                                          // ElevatedButton.icon(
                                          //   icon: _isLoading
                                          //       ? const Center(child: SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Color(0xFF181818), )))
                                          //       : const Icon(Icons.add, color: Color(0xFF181818), size: 22,),
                                          //   label: Text(
                                          //     _isLoading ? 'Загрузка...' : 'Ваше видео',
                                          //     style: const TextStyle(fontSize: 20, color: Color(0xFF181818)),
                                          //   ),
                                          //   onPressed: () => _isLoading ? null : uploadVideo(),
                                          //     style: ElevatedButton.styleFrom(
                                          //     padding: const EdgeInsets.all(14),
                                          //     backgroundColor: const Color(0xFF62CA76),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Для увеличения скорости обработки потока - используйте графические ускорители",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      color: Color.fromARGB(94, 235, 232, 232),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 470,
                                  width: MediaQuery.of(context).size.width * 0.95,
                                  margin: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 730,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(33, 85, 86, 87),
                                            border: Border.all(color: const Color(0xFF62CA76)),
                                            borderRadius: const BorderRadius.all(Radius.circular(7)),
                                          ),
                                          child: Column(
                                            children: [
                                                
                                            ],
                                          )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
// ---------------------------------------------------------------------------------------------- //
// ---------------------------------------------------------------------------------------------- //                         
                        ],
                      )
                    ),
                  ),
                ),
              )
            ),
        ),
        
    );
  }
}