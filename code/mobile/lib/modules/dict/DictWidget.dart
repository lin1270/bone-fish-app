import 'package:bonefishapp/modules/dict/BaseDict.dart';
import 'package:bonefishapp/modules/dict/DictManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:bonefishapp/common/event_center/EventCenter.dart';
import 'package:bonefishapp/common/event_center/Events.dart';

class DictWidget extends StatefulWidget {
  const DictWidget({super.key, required this.dict});

  final BaseDict dict;

  @override
  State<StatefulWidget> createState() {
    return _DictWidgetState();
  }
}

class _DictWidgetState extends State<DictWidget>
    with AutomaticKeepAliveClientMixin<DictWidget> {
  _DictWidgetState() {
    EventCenter.on(Events.dict_search, _onSearch);
  }

  @override
  bool get wantKeepAlive => true; //返回true,具备保存能力

  final double topHeight = 48;
  String _url = '';
  InAppWebViewController? _webViewController;

  void _onLoveBtnClicked() {}
  void _onDictTitleTaped() {
    print("tabed");
  }

  void _onSearch(value) async {
    BaseDict dict = DictManager.instance().getCurrDict;
    if (dict == widget.dict) {
      DictSearchResult result = await dict.search(value["word"]);
      _url = result.content as String;
      _loadSearchResult();
    }
  }

  void _loadSearchResult() {
    if (_url.isNotEmpty) {
      _webViewController?.loadUrl(urlRequest: URLRequest(url: Uri.parse(_url)));
    }
  }

  void _onWebViewCreated(InAppWebViewController controller) {
    _webViewController = controller;
    _loadSearchResult();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header
        Row(
          children: [
            IconButton(
                onPressed: _onLoveBtnClicked,
                icon: const Icon(Icons.star_border)),
            Expanded(
                flex: 1,
                child: InkWell(
                    onTap: _onDictTitleTaped,
                    child: SizedBox(
                        height: topHeight,
                        child: Stack(fit: StackFit.passthrough, children: [
                          Center(
                              child: Text(widget.dict.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ))),
                          const Positioned(
                              top: 28,
                              left: 0,
                              right: 0,
                              child: Center(child: Icon(Icons.arrow_drop_down)))
                        ])))),
            IconButton(
                onPressed: _onLoveBtnClicked,
                icon: const Icon(
                  Icons.share_outlined,
                  size: 20,
                )),
          ],
        ),

        // dict-webview
        Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Container(
                    decoration: const BoxDecoration(color: Color(0xffdddddd)),
                    child: InAppWebView(
                      initialOptions: InAppWebViewGroupOptions(
                          crossPlatform:
                              InAppWebViewOptions(transparentBackground: true)),
                      onWebViewCreated: _onWebViewCreated,
                    ))))
      ],
    );
  }
}
