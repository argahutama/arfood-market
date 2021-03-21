part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            ///Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Food Market',
                        style: blackFontStyle1,
                      ),
                      Text(
                        'Lets get some foods',
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://pbs.twimg.com/media/COOuy9vVEAAQ25p?format=jpg&name=medium'),
                          fit: BoxFit.cover),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 258,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: mockFoods
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                left:
                                    (e == mockFoods.first) ? defaultMargin : 0,
                                right: defaultMargin,
                              ),
                              child: FoodCard(e),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: ['New Taste', 'Popular', 'Recommended'],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Builder(
                    builder: (_) {
                      List<Food> foods = (selectedIndex == 0)
                          ? mockFoods
                          : (selectedIndex == 1)
                              ? []
                              : [];
                      return Column(
                        children: foods
                            .map(
                              (e) => Padding(
                                padding: EdgeInsets.fromLTRB(
                                    defaultMargin, 0, defaultMargin, 16),
                                child: FoodListItem(
                                  food: e,
                                  itemWidth: listItemWidth,
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ],
    );
  }
}
