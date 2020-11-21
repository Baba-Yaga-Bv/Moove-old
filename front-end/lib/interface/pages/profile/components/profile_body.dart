import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:moove/domain/steps_per_day.dart';

import '../../../config.dart';

class ProfileBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileBodyState();
}

class ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        // Top container
        Container(
          height: screenSize.height * 0.35,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: defaultBlurRadius
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: defaultRoundedCorner,
              bottomRight: defaultRoundedCorner
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile pic
              Center(
                  child: Container(
                height: screenSize.height * 0.22,
                width: screenSize.height * 0.22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/pictures/placeholder.jpg")
                  ),
                ),
              )),
              Padding(
                padding: EdgeInsets.fromLTRB(0, mediumPadding, 0, 0),
              ),
              // Name
              Center(child: Text("Linux Fox", style: mediumTextStyle))
            ],
          ),
        ),
        // User info cards
        Expanded(
          child: SingleChildScrollView(
            child: Row(
              children: [
                Spacer(),
                Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: mediumPadding)),
                    // Steps for this week
                    buildWeeklySteps(),
                    Padding(padding: EdgeInsets.only(top: mediumPadding)),
                    // Achievements for this week
                    buildWeeklyAchievements(),
                    Padding(padding: EdgeInsets.only(top: mediumPadding)),
                  ]
                )
              ]
            )
          )
        )
      ]
    );
  }

  Container buildWeeklySteps() {
    Size screenSize = MediaQuery.of(context).size;
    // Steps chart
    return Container(
      height: screenSize.height * 0.35,
      width: screenSize.width * 0.95,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 10)),
          // Weekly steps text
          Text(
            "Weekly steps",
            style: smallTextStyle,
          ),
          // Steps chart
          Container(
            padding: EdgeInsets.all(10),
            height: screenSize.height * 0.3,
            width: screenSize.width * 0.9,
            clipBehavior: Clip.none,
            child: BarChart(
              [
                new Series<StepsPerDay, String>(
                id: 'Steps this week',
                colorFn: (_, __) => ColorUtil.fromDartColor(primaryColor),
                domainFn: (StepsPerDay stepsPerDay, _) => stepsPerDay.dateString(),
                measureFn: (StepsPerDay stepsPerDay, _) => stepsPerDay.currentSteps,
                data: [
                  new StepsPerDay(DateTime(2020, 11, 18), 1234),
                  new StepsPerDay(DateTime(2020, 11, 19), 2736),
                  new StepsPerDay(DateTime(2020, 11, 20), 18741),
                  new StepsPerDay(DateTime(2020, 11, 21), 7366),
                  new StepsPerDay(DateTime(2020, 11, 22), 600),
                  new StepsPerDay(DateTime(2020, 11, 23), 12674),
                  new StepsPerDay(DateTime(2020, 11, 24), 1674)
                ],
                )
              ],
              animate: true,
              defaultRenderer: new BarRendererConfig(
                cornerStrategy: const ConstCornerStrategy(30),
              ),
              domainAxis: OrdinalAxisSpec(
                renderSpec: SmallTickRendererSpec(
                  labelStyle: TextStyleSpec(
                    fontSize: 18,
                    color: MaterialPalette.white
                  ),
                  lineStyle: new LineStyleSpec(
                    color: MaterialPalette.white
                  )
                )
              ),
              primaryMeasureAxis: NumericAxisSpec(
                renderSpec: GridlineRendererSpec(
                  labelStyle: TextStyleSpec(
                    fontSize: 18,
                    color: MaterialPalette.white
                  ),
                  lineStyle: new LineStyleSpec(
                    color: MaterialPalette.white
                  )
                )
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.only(
          topLeft: defaultRoundedCorner,
          bottomLeft: defaultRoundedCorner
        )
      )
    );
  }

  Container buildWeeklyAchievements() {
    double baseHeight = 42.5;
    Size screenSize = MediaQuery.of(context).size;
    List dummyAchievements = [
      "Achievement 1",
      "Achievement 2",
      "Achievement 3"
    ];

    // Achievements list
    if (dummyAchievements.length == 0) {
      return Container(
          height: baseHeight,
          width: screenSize.width * 0.95,
          child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 10)),
                // Weekly steps text
                Text(
                  "No achievements done this week",
                  style: smallTextStyle,
                ),
              ]
          ),
          decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.only(
                  topLeft: defaultRoundedCorner,
                  bottomLeft: defaultRoundedCorner
              )
          )
      );
    }
    return Container(
        height: baseHeight * 2 + (screenSize.height * 0.072) * dummyAchievements.length,
        width: screenSize.width * 0.95,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10)),
            // Weekly steps text
            Text(
              "Achievements this week",
              style: smallTextStyle,
            ),
            // Achievements list
            Container(
                padding: EdgeInsets.all(10),
                height: (screenSize.height * 0.072) * dummyAchievements.length,
                width: screenSize.width * 0.9,
                clipBehavior: Clip.none,
                child: ListView.separated(
                  itemCount: dummyAchievements.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.all(defaultRoundedCorner)
                      ),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Icon(Icons.star, size: smallIconSize, color: Colors.white),
                          Padding(padding: EdgeInsets.all(40)),
                          Center(
                              child: Text(
                                'Entry ${dummyAchievements[index]}',
                                style: superSmallTextStyle,
                              )
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                )
            ),
            // Show more text
            TextButton(
                onPressed: () {},
                child: Text(
                  "show more...",
                  style: smallTextStyle,
                )
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.only(
                topLeft: defaultRoundedCorner,
                bottomLeft: defaultRoundedCorner
            )
        )
    );
  }
}
