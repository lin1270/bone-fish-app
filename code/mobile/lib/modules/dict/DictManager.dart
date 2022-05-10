import 'package:bonefishapp/modules/dict/BaseDict.dart';
import 'package:bonefishapp/modules/dict/WebDict.dart';

class DictManager {
  static DictManager? _instance;
  static DictManager instance() {
    if (_instance == null) {
      _instance = DictManager();
      _instance?._init();
    }
    return _instance as DictManager;
  }

  final List<BaseDict> _dicts = List.empty(growable: true);
  List<BaseDict> get dicts => _dicts;

  void _init() {
    _dicts.add(WebDict(
        id: "1",
        name: "漢語大詞典",
        url:
            r"http://www.maiyuren.com/dict/single.html?inapp=1&word=${word}&dict=4"));

    _dicts.add(WebDict(
        id: "2",
        name: "說文解字注",
        url:
            r"http://www.maiyuren.com/dict/single.html?inapp=1&word=${word}&dict=6"));

    _dicts.add(WebDict(
        id: "3",
        name: "康熙字典",
        url:
            r"http://www.maiyuren.com/dict/single.html?inapp=1&word=${word}&dict=5"));
  }
}
