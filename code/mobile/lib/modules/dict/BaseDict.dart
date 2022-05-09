class DictSearchResult {
  String? word; // 搜尋到的字/詞
  String? trueWord; // 辭典中真正存儲的字詞，如，搜尋內容為1，則該內容可能為“一”，如搜尋“简”，则该内容可能为“簡”。
  String? content; // 解釋內容，如果是WEB，則該內容是URL

  DictSearchResult({this.word, this.trueWord, this.content});
}


class BaseDict {
  String id;
  String name;
  int wordCount = 0;

  /// * [id] 辭典的ID，辭典的唯一標識
  /// * [name] 辭典的名稱，用于界面顯示
  BaseDict({required this.id, required this.name});


  /// 獲取辭典收錄的字詞數
  int getWordCount() {
    return wordCount;
  }

  /// 搜尋漢字/詞
  /// * [word] 要搜尋的漢字，默認以[word]開頭
  /// * 支援以？作為點位符進行搜尋，如：
  ///   “？心？意”，則可匹配“一心一意”、“三心二意”等
  /// * ？與?同義
  /// * 若是不能完全匹配[word]，則將會搜尋[word]最匹配的字詞，如：
  ///   “有一天”，則會搜尋出“有”的結果，而
  ///   “有功一天”，則會搜尋出“有功”的結果。
  Future<DictSearchResult> search(String word) {
    throw UnimplementedError();
  }

  /// 搜尋漢字相關詞組
  /// * [word] 要搜尋的漢字，默認以[word]開頭
  /// * 支援以？作為點位符進行搜尋，如：
  ///   “？心？意”，則可匹配“一心一意”、“三心二意”等
  /// * ？與?同義
  /// * 若是不能完全匹配[word]，則將會搜尋[word]最匹配的字詞，如：
  ///   “有一天”，則會搜尋出“有”的結果，而
  ///   “有功一天”，則會搜尋出“有功”的結果。
  Future<List<String>> getReleatedWords(String word) {
    throw UnimplementedError();
  }
}