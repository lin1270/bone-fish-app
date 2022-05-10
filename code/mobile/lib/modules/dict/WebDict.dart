import 'package:bonefishapp/modules/dict/BaseDict.dart';

class WebDict extends BaseDict {
  String url;

  /// * [id] 辭典的ID，辭典的唯一標識
  /// * [name] 辭典的名稱，用于界面顯示
  /// * [url] 須以${word}作為字詞點位符
  WebDict({required super.id, required super.name, required this.url});

  @override
  Future<List<String>> getReleatedWords(String word) {
    throw UnsupportedError("該辭典沒有關聯詞組");
  }

  @override
  Future<DictSearchResult> search(String word) {
    return Future(() {
      return DictSearchResult(
          word: word,
          trueWord: word,
          content: url.replaceAll(RegExp(r'${url}'), 'word'));
    });
  }
}
