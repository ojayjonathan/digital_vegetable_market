part of '../home_page.dart';

class Booking extends StatelessWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: const BottomNavigation(0),
      body: Column(
        children: [
          Stack(
            children: [
              const Positioned(
                top: 0,
                left: 0,
                child: CurvePaint(),
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: height * 0.1),
                  _Search(),
                  SizedBox(height: height * 0.08),
                ],
              )
            ],
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              childAspectRatio: 1.2,
              children: [],
            ),
          )
        ],
      ),
    );
  }
}

class _Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 10,
              shadowColor: Colors.grey[300],
              child: TextField(
                onChanged: (_) {},
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0x00ffffff),
                  hintText: "Search",
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
                size: 40,
              ))
        ],
      ),
    );
  }
}
