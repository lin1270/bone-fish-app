import 'package:bone_fish_app/modules/dict/DictManager.dart';
import 'package:bone_fish_app/modules/dict/DictWidget.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class DictSwiperWidget extends StatefulWidget {
  const DictSwiperWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DictSwiperWidgetState();
  }
}

class _DictSwiperWidgetState extends State<DictSwiperWidget> {
  _DictSwiperWidgetState() {
    // todo:
    // event_center收到詞典變更，刷新
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
        itemBuilder: (BuildContext context,int index){
          return DictWidget(dict: DictManager.instance().dicts.elementAt(index));
        },
        itemCount: DictManager.instance().dicts.length,
      );
  }

}