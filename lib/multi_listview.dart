import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/**
 * - kalo height double.infinity, berarti
    tinggi di childnya harus dikasih height pasti/ angka
    kalo ngga, child akan infinity juga dan jadi error hasSize

    jadi, listview child, gridview harus dikasih shrink wrap

    kalo misal listview dan gridview ngga bisa discroll,
    itu biasanya karena listview vertikal dan udah punya height.
    dan secara default, listview itu bisa discrol. biar bisa discrol, maka mesti dikasih neverscrollablephysic
 */
class MultiListview extends StatelessWidget {
  var SPACING_NORMAL = 16.0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(SPACING_NORMAL),
            // width: double.infinity,
            // height: double.infinity,
            color: Colors.purple,
            child: Column(
              children: [

                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: SPACING_NORMAL,
                        mainAxisSpacing: SPACING_NORMAL
                    ),
                    itemBuilder: (BuildContext, int){
                      return Container(
                        color: Colors.green,
                        width: width * 0.24,
                        height: width * 0.24,
                      );
                    }),

                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext, int) =>
                      Container(
                        color: Colors.yellow,
                        width: width * 0.24,
                        height: width * 0.24,
                      ),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}