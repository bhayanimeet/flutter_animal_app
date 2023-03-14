import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/global.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "Detail Page",
          style: GoogleFonts.arya(fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade500,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Colors.indigo,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    Global.animalList.elementAt(Global.value),
                    height: 230,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  Global.animal.elementAt(Global.value),
                  style: GoogleFonts.play(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: const Alignment(1, -1.15),
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "${Global.animal.elementAt(Global.value)} Details",
                          style: GoogleFonts.arya(
                            color: Colors.black,
                            fontSize: 30,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("${Global.animalList1.elementAt(Global.value)}",style: GoogleFonts.arya(fontSize: 17)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Global.value = Global.random.nextInt(5);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    });
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(
                      Icons.refresh_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
