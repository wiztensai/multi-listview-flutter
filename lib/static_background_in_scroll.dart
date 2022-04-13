

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_listview/size_config.dart';

class StaticWidgetInScroll extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                  top: 0,
                  child: Image.asset('assets/bg.png', width: SizeConfig.screenWidth,)),

              SizedBox(
                height: SizeConfig.screenHeight,
                child: Column(
                  children: [
                    Text("lorem ipsum dolor"),
                    ListView.separated(
                      // shrinkWrap: true,
                      itemCount: 50,
                      itemBuilder: (BuildContext, int) =>
                          Container(
                            color: Colors.yellow,
                            width: SizeConfig.screenWidth * 0.24,
                            height: SizeConfig.screenWidth * 0.24,
                          ),
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }



}