import 'package:flutter/material.dart';

void main() {
  runApp(market());
}

class market extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlantListScreen(),
    );
  }
}

class Plant {
  final String image;
  final String name;
  final String description;
  final double price;

  Plant(
      {required this.name,
      required this.description,
      required this.price,
      required this.image});
}

class PlantListScreen extends StatelessWidget {
  final List<Plant> plants = [
    Plant(
      image: 'assets/image/vegSeed.jpg',
      name: 'Vegetable Seeds',
      description:
          '15 Packets of Organic & hybrid Vegetable Seeds For Home Garden & Planting For Pots and Patio - Includes Free E-book for Kitchen Gardening.',
      price: 20.0,
    ),
    Plant(
      image: 'assets/image/pesticide.jpg',
      name: 'Mancozeb 75% WP Contact Fungicide for Agricultural Plants',
      description:
          'Mancozeb 75% WP Contact Fungicides are suitable for seed treatment and various crops such as flowers, vegetables, fruits it is effective against the widest range of diseases caused by fungal pathogens in various crops like Paddy, Potato, Tomato, Chilies, Grapes, Apple as well as other fruits, vegetables, cereals, and pulses.',
      price: 25.0,
    ),
    Plant(
      image: 'assets/image/copperPesticide.jpg',
      name: 'Copper Sulphate Fungicide',
      description:
          'Copper sulphate is a chemical compound that is used in agriculture and horticulture as a fungicide and as a supplement to provide plants with copper, an essential nutrient. It appears as a blue crystalline powder.',
      price: 30.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
              child: Text(
            'PLANT-O-LOGY',
            style: TextStyle(
                color: Colors.greenAccent, fontWeight: FontWeight.bold),
          )),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 900,
              width: 450,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/image/plantbg.jpg'))),
              child: Container(
                decoration: BoxDecoration(color: Colors.black54),
                child: ListView.builder(
                  itemCount: plants.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        plants[index].name,
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                      subtitle: Text(
                        plants[index].description,
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: Text(
                        '\$${plants[index].price.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlantDetailScreen(plant: plants[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )));
  }
}

class PlantDetailScreen extends StatelessWidget {
  final Plant plant;

  PlantDetailScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Center(
                child: Text(
              plant.name,
              style: TextStyle(color: Colors.greenAccent),
            )),
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                height: 900,
                width: 450,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/image/plantbg.jpg'))),
                child: Container(
                  decoration: BoxDecoration(color: Colors.black87),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(plant.image)))),
                        Text('Description:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent)),
                        Text(
                          plant.description,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Price: \$${plant.price.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                '${plant.name} added to cart,',
                                style: TextStyle(color: Colors.greenAccent),
                              ),
                            ));
                          },
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
