import 'package:flutter/material.dart';
import 'package:youtube/model/video.dart';
import 'package:youtube/ui/videocard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<videoModel> item = [
    videoModel(
        "https://i.ytimg.com/vi/GYhRzNuQSAE/sddefault.jpg",
        "Rorschach Official Trailer | Mammootty| NisamBasheer | Wayfarer Films",
        "1:30 min",
        "https://e7.pngegg.com/pngimages/528/888/png-clipart-fx-movie-channel-logo-television-channel-fox-movies-others-miscellaneous-television.png",
        "FoxMovie",
        "1M views",
        "OCT 14 ,2022"),
    videoModel(
        "https://www.thenewsminute.com/sites/default/files/styles/slideshow_image_size/public/OthiramKadakam_KingofKotha_Posters_30072021_1200.jpg?itok=6NwLyJjd",
        "soubin's Directorial Othiram Kdakam Will be presenting Dulquer's Variety Face",
        "2:5min",
        "https://pbs.twimg.com/profile_images/1225402923175178240/6pAHAT_S_400x400.jpg",
        "Malayalam Cinima Talks",
        "5lack views",
        "jan 5,2022"),
    videoModel(
        "https://i.ytimg.com/vi/DDM1_APS1pM/maxresdefault.jpg",
        "Full Goat !! |Mutton Inside Veggies| Cooking Whole Goat in BIG Vessel",
        "15min",
        "https://www.brandaware.in/uploads/influencers/profile_pictures/firoz_chuttipara_35fbcc34909aec.jpg",
        "Village Food Channel",
        "850k views",
        "feb 14 ,2022"),
    videoModel(
        "https://i.pinimg.com/550x/80/6b/38/806b381ecd466e25a52423d5fbe918f1.jpg",
        "Bottle Craft| Beer Bottle Craft|M4 TECH",
        "7:00min",
        "data:image/jpeg;base64,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",
        "M4 TECH",
        "32Lack views",
        "OCT 14 ,2022"),
    videoModel(
        "https://i.ytimg.com/vi/WsCT8UN8Ylk/sddefault.jpg",
        "മുഖ്യമന്ത്രിയുടെ  കുടുംബാഗങ്ങൾ  പോയത് സർക്കാർ ചെലവിലല്ല ; പരിശോധിക്കും | veena",
        "30sec",
        "https://www.manoramaonline.com/content/dam/mm/mo/news/kerala/images/2021/4/30/manorama-news-logo.jpg",
        "Manorama News",
        "6.5k views",
        "OCT 16 ,2022"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Image.asset(
          "assets/images/mOxfpS.png",
          width: 100,
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.cast)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          Container(
            height: 30,
            width: 30,
            child: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: FilterChip(
                        onSelected: (value) {},
                        label: Text("Explore"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: FilterChip(
                        onSelected: (value) {},
                        label: Text("All"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: FilterChip(
                        onSelected: (value) {},
                        label: Text("gaming"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: FilterChip(
                        onSelected: (value) {},
                        label: Text("Music"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: FilterChip(
                        onSelected: (value) {},
                        label: Text("Movies"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: FilterChip(
                        onSelected: (value) {},
                        label: Text("entertinment"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              videoCard(item[0]),
              videoCard(item[1]),
              videoCard(item[2]),
              videoCard(item[3]),
              videoCard(item[4]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: 50,
        child: TabBar(
          tabs: [
            Tab(
              child: Icon(Icons.home_outlined,color: Colors.black,),
            ),
            Tab(
              child: Icon(Icons.explore,color: Colors.black,),
            ),
            Tab(
              child: Icon(
                Icons.add_circle_outline,color: Colors.black,
                size: 40,
              ),
            ),
            Tab(
              child: Icon(Icons.subscriptions,color: Colors.black,),
            ),
            Tab(
              child: Icon(Icons.video_library_outlined,color: Colors.black,),
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
