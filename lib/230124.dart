import 'package:flutter/material.dart';

class DayOne extends StatelessWidget {
  const DayOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Flutter App bar",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          color: Colors.blue.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Hello text 0",style: TextStyle(fontSize: 23,color: Colors.white),),
              Container(
                height: 200,
                width: 200,
                color: Colors.yellow,
                child: const Column(
                  children: [
                    Text("Hello text 0",style: TextStyle(fontSize: 23,color: Colors.white),),
                    Text("Hello text 0",style: TextStyle(fontSize: 23,color: Colors.white),),
                    Text("Hello text 0",style: TextStyle(fontSize: 23,color: Colors.white),),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),

              ),
              Text("Hello text 0",style: TextStyle(fontSize: 23,color: Colors.white),),
            ],
          ),

        ),
      ),
    );
  }
}
