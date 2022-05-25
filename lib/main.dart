import 'package:flutter/material.dart';
import 'dataproduk.dart';
import 'widget/button.dart';
import 'detailproduk.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text('Mobil yang Tersedia', style: TextStyle(color: Color(0xff090a0d))),
        elevation: 0,
      ),
      body: ListView(
        children: produkdata.map(
          (itemmobil) {
            return Container(
              height: 250,
              padding: EdgeInsets.all(16),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      )
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        itemmobil.gambar,
                        fit: BoxFit.cover,
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Rp.${itemmobil.harga},-/Day',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
                              ),
                              Text(
                                '${itemmobil.nama} ${itemmobil.nama}',
                                style: TextStyle(color: Color(0xff090a0d)),
                              )
                            ],
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return DetailProduk(produkdata: itemmobil);
                                }));
                              },
                              child: KananButton())
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
