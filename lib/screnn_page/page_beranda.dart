import 'package:flutter/material.dart';
import 'package:latihansatuedukasi/screnn_page/page_battom_navigation.dart';

class PageBeranda extends StatelessWidget {
  const PageBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'gambar/victoriafllas.jpeg',
                fit: BoxFit.contain,
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 8,
              ),
              MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)
                =>const PageBottomNavigationBar()
                ));
              },
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('Edukasi',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
              ),
              const SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
}