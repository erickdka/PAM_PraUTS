import 'package:flutter/material.dart';
import 'dataproduk.dart';
import 'main.dart';
import 'widget/icon_card.dart';

class DetailProduk extends StatefulWidget {
  final dataproduk produkdata;

  const DetailProduk({this.produkdata});

  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  bool imageAss = true;
  String imageDetail = '';
  int nilai = 0;

  void kurang() {
    if (nilai == 0) {
      nilai = 0;
      setState(() {});
    } else {
      nilai--;
      setState(() {});
    }
  }

  void tambah() {
    nilai += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      this.widget.produkdata.nama,
                      style: TextStyle(color: Color(0xff090a0d), fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: imageAss
                      ? ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                          child: Image.asset(
                            this.widget.produkdata.gambar,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(),
                ),
                Positioned(
                  right: 0,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          imageAss = true;
                          imageDetail = '';
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white),
                          padding: const EdgeInsets.all(1),
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              this.widget.produkdata.gambar,
                              width: 65,
                              height: 65,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              height: 150,
              child: ListView(
                padding: const EdgeInsets.only(left: 32, right: 32),
                scrollDirection: Axis.horizontal,
                children: [
                  IconCard(judul: "Harga", icon: Icons.monetization_on, value: this.widget.produkdata.harga.toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Deskripsi',
                style: TextStyle(color: Color(0xff090a0d), fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 48),
              child: Text(
                this.widget.produkdata.nama,
                style: TextStyle(color: Color(0xffbcc4cd), fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue,
                          ),
                          child: IconButton(
                            onPressed: () {
                              kurang();
                            },
                            icon: Icon(Icons.remove),
                            color: Colors.white,
                          )),
                      Container(
                        color: Colors.white,
                        child: Text('${nilai.toString()}/hari'),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue,
                          ),
                          child: IconButton(
                            onPressed: () {
                              tambah();
                            },
                            icon: Icon(Icons.add),
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (nilai == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('ingin booking untuk berapa hari?'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          } else {}
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Booking Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
