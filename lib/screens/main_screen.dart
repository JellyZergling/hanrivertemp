import 'package:flutter/material.dart';
import 'package:hangangtemperature/models/temp_model.dart';
import 'package:hangangtemperature/services/api_service.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final Future<List<TempModel>> temps = ApiService.getTodaysData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        title: const Text(
          'Test',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Yeongdeok-Blueroad',
          ),
        ),
      ),
      body: FutureBuilder(
        future: temps,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var temp = snapshot.data![index];
                return Row(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     blurRadius: 15,
                        //     offset: Offset(10, 10),
                        //     color: Colors.black,
                        //   )
                        // ],
                      ),
                      width: 250,
                      height: 250,
                      child: Column(
                        children: [
                          Text(
                            temp.id,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            temp.temp,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
