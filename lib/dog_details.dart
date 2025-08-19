import 'package:flutter/material.dart';

class DogDetailsScreen extends StatelessWidget {
  final String? breed;
  final String? info;
  
  const DogDetailsScreen({super.key, required this.breed,required this.info});

  String getImagePath(){
    switch(breed.toString()){
      case 'Shitzu':
      return 'assets/images/shitzu.png';
      case 'Beagle':
      return 'assets/images/beagle.jpg';
      case 'Golden Retriever':
      return 'assets/images/golden.jpg';
    
      case 'Chow Chow':
      return 'assets/images/chow.jpg';
      default:
      return 'assets/images/tibetan.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(breed.toString()),
    backgroundColor: Colors.brown,
    foregroundColor: Colors.white70,),
    body: Column(
      children: [
        const Text('Dog',style:TextStyle(fontSize:27,color: Colors.black,fontWeight: FontWeight.bold),),
        SizedBox(height:30),
        Text(breed.toString(),style: const TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.orangeAccent)),
        SizedBox(height:30),
        ClipOval(child: Image.asset(getImagePath(),height:200,width: 200,fit: BoxFit.cover,)),
        SizedBox(height:30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Text('About:${info.toString()}')),
        )
        
      ],
    ),
    );
  }
}