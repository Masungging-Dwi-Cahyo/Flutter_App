import 'package:flutter/material.dart';

//Fungsi main untuk menjalankan kode program
void main() {
  runApp(const MyApp());
}

//Class untuk mengatur tampilan yang tidak dapat berubah atau statis
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_App',

      //Bagian tema aplikasi dengan setting warna hijau
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      //Halaman utama dengan menampilkan text dibagian atas
      home: MyHomePage(title: 'Aplikasi Flutter'),
    );
  }
}

//Class untuk mengatur tampilan yang dapat berubah atau dinamis
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  //Bagian yang dijalankan untuk tampilan dinamis yaitu class _MyHomePageState
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//Bagian class _MyHomePageState
class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  String _displayText = 'Selamat Datang'; //Text awal

  //Untuk mengubah text awal dengan inputan yang dimasukkan
  //Text awal akan diganti dengan text inputan
  void _updateText() {
    setState(() {
      _displayText = _controller.text.isNotEmpty
          ? 'Hallo, ${_controller.text} apa kabar ?'
          : 'Selamat Datang'; //Bagian text awal yang akan berubah
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {

    //Untuk mengatur tampilan secara otomatis mengikuti ukuran layar
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        //Mengatur container dengan tepi layar
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          //Mengatur tampilan agar berada ditengah atau center
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Untuk mengatur tampilan text (display awal "Selamat Datang")
            Text(
              _displayText,
              style: TextStyle(
                fontSize: screenWidth * 0.05, //Ukuran text
                fontWeight: FontWeight.bold, //Mengatur text tebal
              ),
            ),

            //Untuk mengatur jarak antara text dengan kolom inputan
            SizedBox(height: screenHeight * 0.05),

            //Untuk mengatur tampilan pada kolom inputan
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Masukkan nama anda',
                border: OutlineInputBorder(),
              ),
            ),

            //Untuk mengatur jarak antara kolom inputan dengan tombol klik
            SizedBox(height: screenHeight * 0.03),

            //Untuk mengatur tampilan tombol klik
            ElevatedButton(
              onPressed: _updateText,
              child: Text(
                'Klik disini',
                style: TextStyle(fontSize: screenWidth * 0.03),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
