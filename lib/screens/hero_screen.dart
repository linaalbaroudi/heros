import 'package:flutter/material.dart';
import 'package:heros/models/hero_model.dart' ;

class HeroScreen extends StatelessWidget {
  const HeroScreen({ Key? key , required this.hero}) : super(key: key);
  final HeroModel hero;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Column(
            children:  [
              const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(Icons.person),
                  ),
              ),
              Row(
                children: [
                  const Text("Hero Name: ", 
                   style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(hero.name!),
                ],
              ),
              Row(
                children: [
                  const Text("Description: ", 
                   style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(hero.description!),
                ],
              ),
              Row(
                children: [
                  const Text("Powers: ", 
                   style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: hero.powers!.length,
                    itemBuilder: (BuildContext context, int index) {
                      if(index == hero.powers!.length-1){
                        return Text( hero.powers![index] + ".");
                      }else{
                        return Text( hero.powers![index] + ", ");
                      }
                    }
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}