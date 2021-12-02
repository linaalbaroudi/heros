import 'package:flutter/material.dart';
import 'package:heros/models/hero_model.dart';
import 'package:heros/services/heroes_api.dart' as api;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heroes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'United Nations Super Heroes Fund'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool collapseFilter = false;
  final _formKey = GlobalKey<FormState>();
  late String heroSearchText;
  bool sortByPower = false;
  List<HeroModel> heroes = [];

  collaplse(){
    setState(() {
      collapseFilter = !collapseFilter; 
    });
  }

  search() async {
    final _isValid = _formKey.currentState!.validate();
    if (!_isValid) {
      return;
    }
    _formKey.currentState!.save();
    try {
      heroes.clear();
      HeroModel hero = HeroModel(name: '', description: '', powers: "", rate: 0);
      HeroResponse searchResponse = (await api.searchHero(heroSearchText, sortByPower? "power" : "name"));
      print("status: " + searchResponse.status! );
      if (searchResponse.status == "200") {
        print("heroes: " + searchResponse.heroesList!.toString() ); 
        setState(() {
          heroes = searchResponse.heroesList!;
        });
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Ops, something went wrong!"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        
        children: [
          Card(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Filters: ", 
                   style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(onPressed: collaplse, icon: const Icon(Icons.filter)),
                ],
              ),
              collapseFilter? 
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        icon: Icon(Icons.search),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter an app name";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => search,
                      onSaved: (value) {
                        heroSearchText = value!.trim().toLowerCase();
                      },
                    ),
                    Row(
                      children: [
                        const Text("Sort By Power"),
                        Checkbox(
                          value: sortByPower,
                          onChanged: (value) {
                            //formFieldState.didChange(value);
                            setState(() {
                              sortByPower = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ) : const SizedBox(),
            ]  
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: heroes.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 3,
                              ),
                              left: BorderSide(
                                width: 1,
                              ),
                              right: BorderSide(
                                width: 1,
                              ),
                              top: BorderSide(
                                width: 1,
                              ),
                            )
                          ),
                          child: const Text("Hero Name",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                          ),
                        ),
                        Expanded(child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 3,
                              ),
                              left: BorderSide(
                                width: 1,
                              ),
                              right: BorderSide(
                                width: 1,
                              ),
                              top: BorderSide(
                                width: 1,
                              ),
                            )
                          ),
                          child: Text(heroes[index].name!,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 3,
                              ),
                              left: BorderSide(
                                width: 1,
                              ),
                              right: BorderSide(
                                width: 1,
                              ),
                              top: BorderSide(
                                width: 1,
                              ),
                            )
                          ),
                          child: const Text("Powers",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                          ),
                        ),
                        Expanded(child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 3,
                              ),
                              left: BorderSide(
                                width: 1,
                              ),
                              right: BorderSide(
                                width: 1,
                              ),
                              top: BorderSide(
                                width: 1,
                              ),
                            )
                          ),
                          child: Text(heroes[index].powers!,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                              ),
                              left: BorderSide(
                                width: 1,
                              ),
                              right: BorderSide(
                                width: 1,
                              ),
                              top: BorderSide(
                                width: 1,
                              ),
                            )
                          ),
                          child: const Text("Rate",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                          ),
                        ),
                        Expanded(child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                              ),
                              left: BorderSide(
                                width: 1,
                              ),
                              right: BorderSide(
                                width: 1,
                              ),
                              top: BorderSide(
                                width: 1,
                              ),
                            )
                          ),
                          child: SizedBox(
                            width:100,
                            child: Row(
                              children: [
                                Icon(Icons.star_rate_rounded, color: heroes[index].rate!>0 ? Colors.purple : Colors.grey,),
                                Icon(Icons.star_rate_rounded, color: heroes[index].rate!>1 ? Colors.purple : Colors.grey,),
                                Icon(Icons.star_rate_rounded, color: heroes[index].rate!>2 ? Colors.purple : Colors.grey,),
                                Icon(Icons.star_rate_rounded, color: heroes[index].rate!>3 ? Colors.purple : Colors.grey,),
                                Icon(Icons.star_rate_rounded, color: heroes[index].rate!>4 ? Colors.purple : Colors.grey,)
                              ],
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
          ),
        ],
      ),
    );
  }
}
