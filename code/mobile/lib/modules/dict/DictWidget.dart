import 'package:bonefishapp/modules/dict/BaseDict.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DictWidget extends StatefulWidget {
  const DictWidget({super.key, required this.dict});

  final BaseDict dict;

  @override
  State<StatefulWidget> createState() {
    return _DictWidgetState();
  }
}

class _DictWidgetState extends State<DictWidget> {
  _DictWidgetState() {
    // todo:
    // event_center處理搜尋事件
  }

  final double topHeight = 50;
  String _url = '';

  void _onLoveBtnClicked() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header
        Row(
          children: [
            IconButton(
                onPressed: _onLoveBtnClicked, icon: const Icon(Icons.favorite)),
            Expanded(
                flex: 1,
                child: Stack(fit: StackFit.passthrough, children: [
                  Text(widget.dict.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        backgroundColor: Colors.red,
                      )),
                ])),
            IconButton(
                onPressed: _onLoveBtnClicked, icon: const Icon(Icons.share)),
          ],
        ),

        // dict-webview
        Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: WebView(
                  backgroundColor: Colors.red,
                  initialUrl: _url,
                )))
      ],
    );
  }
}
