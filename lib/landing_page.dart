import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest6_1915016043_mutiara/details_page.dart';
import 'package:posttest6_1915016043_mutiara/getx_controller/pilihanCon.dart';
import 'package:posttest6_1915016043_mutiara/getx_controller/txtControl.dart';

String alamat = "", kota = "";

bool tampil = false;

class landing_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfffF6F3F3),
      body: ListView(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              width: lebar,
              height: tinggi,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    width: lebar,
                    height: 274,
                    child: Opacity(
                      opacity: 0.6,
                      child: Container(
                        child: Image.asset(
                          "icecream.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 119,
                    width: lebar,
                    height: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Ice Cream",
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Color(0xfffA68078),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 160,
                    width: lebar,
                    height: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "by mutiarannsa",
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          color: Color(0xfffA68078),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 327,
                    width: lebar,
                    height: 74,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Center(
                        child: Text(
                          "Your Ice Cream truck is here!",
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            height: 3,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      top: 486,
                      width: lebar,
                      height: 37,
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Get.to(SecondPage());
                          },
                          child: Text("Get Started"),
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xfffA68078),
                              primary: Colors.white),
                        ),
                      ))
                ],
              )),
        ]),
      ]),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posttest 6 Mutiara',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: MySecondPage(),
    );
  }
}

class MySecondPage extends StatelessWidget {
//   const MySecondPage({Key? key}) : super(key: key);

//   @override
//   State<MySecondPage> createState() => _MySecondPageState();
// }

// class _MySecondPageState extends State<MySecondPage> {
  final TextControl alamatCtrl = Get.put(TextControl());
  final TextControl kotaCtrl = Get.put(TextControl());
  final pilihCon isSesuaiCtrl = Get.put(pilihCon());

  bool isSesuai = false;

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   alamatCtrl.dispose();
  //   kotaCtrl.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ice Cream"),
        centerTitle: true,
        backgroundColor: Color(0xfffA68078),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text("Sebelum memulai order, Masukkan detail alamat Anda"),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    maxLines: 1,
                    controller: alamatCtrl.alamatCon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Alamat",
                      hintText: "Alamat Lengkap Anda",
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    maxLines: 2,
                    controller: kotaCtrl.kotaCon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Kota/Kabupaten",
                      hintText: "Kota/Kabupaten Anda",
                    ),
                  ),
                  ListTile(
                    title: Text("Apakah Sudah sesuai?"),
                    leading: Obx(
                      (() => Checkbox(
                        value: isSesuaiCtrl.isSesuai.value,
                        onChanged: (value) {
                          isSesuaiCtrl.isSesuai(value);
                        },
                      ))
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
                width: 20,
                child: TextButton(
                  onPressed: () {
                    if (alamatCtrl.alamatCon.text != '' && kotaCtrl.kotaCon.text != '') {
                      final snackBarSuccess = SnackBar(
                        content: Text(
                          "Berhasil!!",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        duration: Duration(seconds: 2),
                        padding: EdgeInsets.all(10),
                        backgroundColor: Color(0xfffA68078),
                      );

                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBarSuccess);
                      Get.to(ThirdPage(alamatCtrl.alamatCon.text, kotaCtrl.kotaCon.text));

                      // Navigator.push(context, MaterialPageRoute(builder: (_) {
                      //   //setState(() {
                      //   alamat = alamatCtrl.text;
                      //   kota = kotaCtrl.text;
                      //   //});
                      //   return ThirdPage(alamat, kota);
                      // }));
                    } else {
                      final snackBarFailed = SnackBar(
                        content: Text(
                          "Isi Terlebih Dahulu Alamat dan Kota Anda",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        duration: Duration(seconds: 3),
                        padding: EdgeInsets.all(10),
                        backgroundColor: Color.fromARGB(255, 156, 53, 45),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBarFailed);
                    }
                  },
                  child: Text("Next"),
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xfffA68078),
                      primary: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  final String alamat;
  final String kota;
  ThirdPage(this.alamat, this.kota);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  
  
  @override
  final List<BottomNavigationBarItem> _myItem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.icecream),
      label: "Outlet",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
  ];

  final List<Widget> _myPages = [
    HomePage(),
    Container(),
    Container(),
  ];

  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ice Cream"),
        centerTitle: true,
        backgroundColor: Color(0xfffA68078),
        foregroundColor: Colors.white,
      ),
      body: _myPages.elementAt(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        items: _myItem,
        onTap: (int newIndex) {
          setState(() {
            _pageIndex = newIndex;
          });
        },
      ),
    );
  }
}
