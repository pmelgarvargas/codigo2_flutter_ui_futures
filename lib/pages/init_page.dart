import 'package:codigo2_ui_future/data/data.dart';
import 'package:codigo2_ui_future/pages/detail_page.dart';
import 'package:codigo2_ui_future/widgets/item_category_widget.dart';
import 'package:codigo2_ui_future/widgets/item_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitPage extends StatefulWidget {
  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  bool isLoading = true;
  Data data = Data();
  List<Map<String, dynamic>> listData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initData();
  }

  Future<void> initData() async {
    listData = await data.fetchData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: height * 0.52,
              decoration: const BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(42.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://imageio.forbes.com/specials-images/imageserve/627e31007be5959e6359a3ab/Oia--Santorini-Island--Cyclades--Greece--Twilight--Houses-and-churches-after-sunset/960x0.jpg?format=jpg&width=960",
                  ),
                ),
              ),
              child: SafeArea(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hi Pedro,",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                          const Text(
                            "Where do you want to go?",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              hintText: "Where aye you going?",
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.90),
                                  fontSize: 14.0),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.44),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white.withOpacity(0.85),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 18.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.68),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14.0),
                            bottomRight: Radius.circular(42.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Santorini, Greece",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Recommendation",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => const Icon(
                                      Icons.star,
                                      color: Color(0xffFEAA36),
                                      size: 22.0,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "4.3",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      " (2323 reviews)",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   height: 20.0,
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle, size: 10.0,color: Colors.grey,),
                      Icon(Icons.circle,size: 15.0,color: Colors.blue,),
                      Icon(Icons.circle,size: 10.0,color: Colors.grey,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hot places",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff2E3033),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "SEE ALL",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff3681D8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),

                  ////


                  FutureBuilder(
                    future: data.fetchData(),
                    builder: (BuildContext context, AsyncSnapshot snap) {
                      if (snap.hasData) {
                        List<Map<String, dynamic>> list = snap.data;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: list
                                .map(
                                  (matasquita) => ItemSliderWidget(
                                    place: matasquita,
                                    onMandarina: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                            data: matasquita,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),

                  const SizedBox(
                    height: 14.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xff2E3033),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "SEE ALL",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff3681D8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        ItemCategoryWidget(
                          txt: "Art & Cultures",
                          colorr: 0xff5D6DFF,
                          icono: Icon(
                            Icons.ac_unit_outlined,
                            color: Colors.white,
                          ),
                        ),
                        ItemCategoryWidget(
                          txt: "Adventure",
                          colorr: 0xff33D4F9,
                          icono: Icon(
                            Icons.flag,
                            color: Colors.white,
                          ),
                        ),
                        ItemCategoryWidget(
                          txt: "Festival",
                          colorr: 0xff2B89E0,
                          icono: Icon(
                            Icons.attractions,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(
                  //   height: 140,
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       ItemSliderWidget(),
                  //       ItemSliderWidget(),
                  //       ItemSliderWidget(),
                  //       ItemSliderWidget(),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                onPressed: ()  async {

                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String name = prefs.getString("name") ?? "-";
                  int n = prefs.getInt("matasquita") ?? 0;
                  print(name);
                  print(n);

                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home, color: Colors.blue, size: 40.0,),
                    SizedBox(width: 25.0,),
                    Icon(Icons.location_on,color: Colors.grey,size: 40.0,),
                    SizedBox(width: 25.0,),
                    Icon(Icons.camera_outlined,color: Colors.grey,size: 40.0,),
                    SizedBox(width: 25.0,),
                    Icon(Icons.heart_broken_rounded,color: Colors.grey,size: 40.0,),
                    SizedBox(width: 25.0,),
                    Icon(Icons.person,color: Colors.grey,size: 40.0,),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
