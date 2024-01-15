import 'package:flutter/material.dart';

import 'package:quote_app/api/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Inspiring Quotes",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                      future: api(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          Center(
                            child: Text("No Data"),
                          );
                        }
                        return Container(
                          width: 300,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child:
                                    Text(snapshot.data['quote'].toString())));
                      }),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.grey, Colors.cyan],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft),
                            color: Colors.cyan,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 9,
                                  spreadRadius: 1,
                                  color: Colors.grey)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Text("New Quote"))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
