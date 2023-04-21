import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randamapi/screen/model/randam_model.dart';
import 'package:randamapi/screen/provider/randam_provider.dart';

class RandamView extends StatefulWidget {
  const RandamView({Key? key}) : super(key: key);

  @override
  State<RandamView> createState() => _RandamViewState();
}

class _RandamViewState extends State<RandamView> {
  RandamProvider? randamProviderT;
  RandamProvider? randamProviderF;

  @override
  Widget build(BuildContext context) {
    randamProviderT = Provider.of<RandamProvider>(context, listen: true);
    randamProviderF = Provider.of<RandamProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text(
          "Randam Api",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.black26,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: randamProviderT!.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  RandamModel? rm2 = snapshot.data;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 64.0,
                                backgroundImage: NetworkImage(
                                    rm2!.results[index].picture.medium),
                                backgroundColor: Colors.transparent,
                              ),
                             // SizedBox(height: 16),

                              SizedBox(height: 20),
                              Center(
                                child: Text(
                                  "Name",
                                  style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      "${rm2!.results[index].location.street.name}",
                                      style: TextStyle(
                                        fontSize: 15,color: Colors.black
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Center(
                                    child: Text(
                                      " BirthDate",
                                      style: TextStyle(
                                        fontSize: 25,fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "${rm2!.results[index].dob.date}",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Center(
                                    child: Text(
                                      "Age",
                                      style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "${rm2!.results[index].dob.date}",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),

                                  ),SizedBox(height: 20,)
                                  ,Center(
                                    child: Column(
                                      children: [
                                        Text("Country ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                        Text(
                                          "${rm2!.results[index].location.country}",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: rm2!.results.length,
                  );
                }
                return Container(child: CircularProgressIndicator());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Next"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey)),
          ),
        ],
      ),
    ));
  }
}
