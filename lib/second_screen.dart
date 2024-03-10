import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:promilo_assignment/description_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<String> cardTitles = ['Author', 'Memeber', 'Author'];
  final List<String> cardMemeber = ['1,028 Meetups','1,028 Meetups','1,028 Meetups',];
  final List<String> imagePaths = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'Individual Meetup',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.mic),
                      onPressed: () {
                        // Add your voice search functionality here
                      },
                    ),
                  )),
                ),
                SizedBox(
                  height: 250.0,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        AnotherCarousel(
                          boxFit: BoxFit.cover,
                          autoplay: false,
                          animationCurve: Curves.fastOutSlowIn,
                          animationDuration: Duration(milliseconds: 1000),
                          dotSize: 6.0,
                          dotIncreasedColor: Color(0xFFFF335C),
                          dotBgColor: Colors.transparent,
                          dotPosition: DotPosition.bottomCenter,
                          dotVerticalPadding: 10.0,
                          showIndicator: true,
                          indicatorBgPadding: 7.0,
                          images: const [
                            AssetImage('assets/image1.jpg'),
                            AssetImage('assets/image2.jpg'),
                            AssetImage('assets/image3.jpg'),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 150,
                          top: 150,
                          child: Container(
                            // color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child:const Text(
                              'Popular Meetups in India',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Text('Trending Popular People',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Expanded(
                  child: ListView.builder(

                    scrollDirection: Axis.horizontal,
                    itemCount: cardTitles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 200.0,
                          height: 150.0,
                          child: Card(
                            elevation: 3, // Set elevation for a shadow effect
                            shape: RoundedRectangleBorder(
                              // Define the shape of the card
                              borderRadius: BorderRadius.circular(10), // Set border radius
                              side: BorderSide(color: Colors.black, width: 1), // Set border properties
                            ),

                            child: Column(

                              children: <Widget>[
                                ListTile(

                                  title: Text(cardTitles[index]),
                                  subtitle: Text(cardMemeber[index]),

                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100, bottom: 0, top: 22),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20), // Adjust border radius as needed
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    child: Text(
                                      'See more',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                ),
                SizedBox(height: 30,),
                Text('Top Trending Meetups',style: TextStyle(fontWeight: FontWeight.bold),),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imagePaths.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to a new screen on tap
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DescriptionScreen(imagePath: imagePaths[index])),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200.0,
                            height: 150.0,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  imagePaths[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),


              ],

            ),
          ),

      ),
    );
  }
}
