import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jersey_app/components/my_bottombar.dart';
import 'package:provider/provider.dart';
import '../util/glassbox.dart';
import '../components/jersey_item_tile.dart';
import '../model/cart_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBottomIndex = 0;
  void _handlebottomBar(int? index){
    setState(() {
      _currentBottomIndex = index!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: GlassBox(
          child: MyBottomBar(
            onTap: _handlebottomBar,
            index: _currentBottomIndex,
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'Kit',
                          style: GoogleFonts.openSans(
                              color: Colors.black, fontSize: 18),
                          children: [
                            TextSpan(
                                text: 'Kiosk',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold, fontSize: 19))
                          ]),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          size: 19,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: TextSpan(
                      text: 'Pick your',
                      style: GoogleFonts.openSans(
                          color: Colors.black, fontSize: 30),
                      children: [
                        TextSpan(
                            text: ' Jersey',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' from the', style: GoogleFonts.openSans()),
                        TextSpan(
                            text: ' Kiosk',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold))
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        size: 30,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          print("filter");
                        },
                        child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          width: 10,
                          height: 10,
                          child: Image.asset(
                            "lib/images/filter.png",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<CartModel>(
                builder: (context, value, child) => Flexible(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                      padding: EdgeInsets.all(5),
                      itemCount: value.shopItem.length,
                      itemBuilder: (context, index) => JerseyItemTile(
                            itemName: value.shopItem[index][0],
                            itemPrice: value.shopItem[index][1],
                            imagePath: value.shopItem[index][2],
                            color: value.shopItem[index][3],
                            textRating: value.shopItem[index][4],
                            onTap: () {
                              Provider.of<CartModel>(context, listen: false)
                                  .addItemToCart(index);
                            },
                          )),
                ),
              ),
            ],
          ),
        ));
  }
}
