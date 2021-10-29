import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/widgets.dart';
import 'package:real_widget_app/data.dart';

void main(){
  runApp(WidgetApp());
}

class WidgetApp extends StatelessWidget{
  
Widget build(BuildContext context){
  return MaterialApp(
    title: 'My Widget App',
    theme: ThemeData (
      primarySwatch: Colors.lightGreen,
    ),
    home: WidgetApp(),
  );
}
}

class MyWidgetApp extends StatefulWidget {
  @override
  _MyWidgetApp createState() => _MyWidgetApp();
}

class _MyWidgetApp extends State<MyWidgetApp> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
     
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<DetailsDataModel>;
          return ListView.builder(
        
              itemCount: 5,
              itemBuilder: (context, id) {
                
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                   
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                     
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image(
                            image: NetworkImage(items[id].avatar.toString()),
                            fit: BoxFit.fill,
                          ),
                        ),
                       
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                           
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  items[id].first_name.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                             
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  items[id].last_name.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(items[id].username.toString()),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }

  // ignore: non_constant_identifier_names
  Future<List<DetailsDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/mock_data1.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => DetailsDataModel.fromJson(e)).toList();
  }
}




































// //method to read json file in flutter
// // ignore: non_constant_identifier_names
// Future<List<DetailsDataModel>> ReadJsonData() async {
//     //read json file
//     final jsondata = await rootBundle.rootBundle.loadString('assets/mock_data1.json');
//     //decode json data as list
//     final list = json.decode(jsondata) as List<dynamic>;
    
//     //map json and initialize using DataModel
//     return list.map((e) => DetailsDataModel.fromJson(e)).toList();
//   }

// //to parse data and display data in listview
//  FutureBuilder(
//       future: ReadJsonData(),
//       builder: (context, data) {
//         if (data.hasError) {
//          //in case if error found
//           return Center(child: Text("${data.error}"));
//         } else if (data.hasData) {
//            //once data is ready this else block will execute
//           // items will hold all the data of DataModel
//            //items[index].name can be used to fetch name of product as done below
//           var items = data.data as List<ProductDataModel>;
//           return ListView.builder(
//               itemCount: items == null ? 0 : items.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 5,
//                   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 50,
//                           height: 50,
//                           child: Image(
//                             image:
//                                 NetworkImage(items[index].imageURL.toString()),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Expanded(
//                             child: Container(
//                           padding: EdgeInsets.only(bottom: 8),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(left: 8, right: 8),
//                                 child: Text(
//                                   items[index].name.toString(),
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 8, right: 8),
//                                 child: Text(items[index].price.toString()),
//                               )
//                             ],
//                           ),
//                         ))
//                       ],
//                     ),
//                   ),
//                 );
//               });
//         } else {
//               // show circular progress while data is getting fetched from json file
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     )