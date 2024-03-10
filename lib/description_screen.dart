import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({Key? key, required this.imagePath})
      : super(key: key);

  final String imagePath;

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  int _selectedIndex = 0; // Index for the selected tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void shareImage() async {
    try {
      final Uri uri = Uri.file(widget.imagePath);
      if (await canLaunch(uri.toString())) {
        await launch(uri.toString());
      } else {
        throw 'Could not launch $uri';
      }
    } catch (e) {
      print('Error sharing image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height -   kBottomNavigationBarHeight,
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            Center(
              child: SizedBox(
                height: 250.0,
                width: 350.0,
                child: AnotherCarousel(
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
                  images: [
                    NetworkImage(
                        'https://img.freepik.com/free-photo/sea-beach_1203-3515.jpg'),
                    NetworkImage(
                        'https://img.freepik.com/free-photo/hammock_74190-2012.jpg?w=996&t=st=1709795621~exp=1709796221~hmac=655848eb384645d924117e794d374c05853a50379cf6d8a81ac2aeea5b459363'),
                    NetworkImage(
                        'https://img.freepik.com/free-photo/beautiful-tropical-beach-sea-sand-with-coconut-palm-tree-blue-sky-white-cloud_74190-7479.jpg?w=996&t=st=1709795626~exp=1709796226~hmac=d30be632726d3654364e874ae25dcd1c0ce49665a2e716abcbab0d60ba722c76'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10), // Add some spacing between carousel and icons
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Distribute icons evenly
              children: [
                Icon(Icons.download),
                Icon(Icons.save_as_outlined),
                Icon(Icons.favorite),
                Icon(Icons.star),
                Icon(Icons.rectangle_outlined),
                IconButton(
                  onPressed: shareImage,
                  icon: Icon(Icons.share),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
           const Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // Distribute icons evenly

                  children: <Widget>[
                    Icon(Icons.crop_square_outlined),
                    Text('1034'),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(Icons.favorite),
                    Text('1034'),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.purpleAccent,
                      size: 24.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white10,
                      size: 20.0,
                    ),
                    Text('3.2'),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Actor Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Indian Actress'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.watch_later_outlined),
                      Text('Duration 20 Mins'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            const Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.wallet_outlined),
                      Text('Total Average Fees '),
                      Icon(Icons.currency_rupee),
                      Text('9,999')
                    ],
                  ),
                ],
              ),
            ),
           const SizedBox(
              height: 5,
            ),
            Container(
              alignment:
                  Alignment.topLeft, // Align the content to the top-left corner
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Align children to the start (left)
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0,
                        top:
                            10.0), // Add padding to align text away from the edges
                    child: Text(
                      'About',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, left: 10),
                    child: Text(
                        'From cardiovascular health to fitness,flexiblity,blance,stress releief, better sleep ,increased cognitive performance, and more , you can reap all of these benefits in just one session out on the waves. So you may find yourself wondering what the benefits of going on a surf camp,'),
                  ),
                  // Other children...
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
