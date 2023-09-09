import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class ViewKit extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;

  ViewKit(
      {Key? key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color})
      : super(key: key);

  @override
  _ViewKitState createState() => _ViewKitState();
}

class _ViewKitState extends State<ViewKit> {
  int _kitSizes = 0;
  bool _likeStatus = false;
  void _changeSizes(int index){
    setState(() {
      _kitSizes = index;
    });
  }
  void _changeLikeStatus(){
    setState(() {
      _likeStatus = !_likeStatus;
    });
  }
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        leading: GestureDetector(
          onTap: ()=> Navigator.pop(context),
          child: Container(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, -1),
                  child: ClipPath(
                    clipper: ProsteBezierCurve(
                      position: ClipPosition.bottom,
                      list: [
                        BezierCurveSection(
                          start: Offset(0, 150),
                          top: Offset(screenWidth / 2, 230),
                          end: Offset(screenWidth, 150),
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(color: widget.color),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment(0, 0),
                    child: Image.asset(
                      widget.imagePath,
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 2,
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 150,),
                        Text("Size",style: TextStyle(
                          fontSize: 15,
                        ),),
                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            int _smallSize = 0;
                            _changeSizes(_smallSize);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                              color: _kitSizes == 0 ? Colors.black : Colors.white
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Text("S",style: TextStyle(
                                fontSize: 17,
                                color: _kitSizes == 0 ? Colors.white : Colors.black
                              ),),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            int _mediumSize = 1;
                            _changeSizes(_mediumSize);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              color: _kitSizes == 1 ? Colors.black : Colors.white
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Text("M",style: TextStyle(
                                fontSize: 17,
                                color: _kitSizes == 1? Colors.white : Colors.black
                              ),),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            int _largeSize = 2;
                            _changeSizes(_largeSize);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              color: _kitSizes == 2 ? Colors.black : Colors.white
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Text("L",style: TextStyle(
                                fontSize: 17,
                                color:  _kitSizes == 2? Colors.white : Colors.black
                              ),),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
          Text(
            widget.itemName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  _changeLikeStatus();
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    _likeStatus? Icons.favorite : Icons.favorite_border,
                    color: _likeStatus? Colors.red : Colors.black,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      '\$' + widget.itemPrice,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
