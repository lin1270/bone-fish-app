import 'package:bonefishapp/modules/dict/BaseDict.dart';
import 'package:bonefishapp/modules/dict/DictManager.dart';
import 'package:bonefishapp/modules/dict/DictWidget.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DictSwiperWidget extends StatefulWidget {
  const DictSwiperWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DictSwiperWidgetState();
  }
}

class _DictSwiperWidgetState extends State<DictSwiperWidget>
    with SingleTickerProviderStateMixin {
  _DictSwiperWidgetState() {
    _dictChanged(0);

    // todo:
    // event_center收到詞典變更，刷新
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  TabController? _tabController;

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _dictChanged(index) {
    BaseDict dict = DictManager.instance().dicts.elementAt(index);
    DictManager.instance().setCurrDict(dict);
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return DictWidget(dict: DictManager.instance().dicts.elementAt(index));
      },
      itemCount: DictManager.instance().dicts.length,
      onIndexChanged: _dictChanged,
    );
  }
}
