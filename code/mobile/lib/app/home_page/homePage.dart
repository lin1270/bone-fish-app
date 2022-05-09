import 'package:bone_fish_app/common/ui/components/BasePage.dart';
import 'package:bone_fish_app/modules/dict/DictSwiperWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _bottomHeight = 50;

  void onMainMenuBtnClicked() {

  }

  void onQuickHistoryBtnClicked() {

  }

  void onPreHistoryBtnClicked() {

  }

  void onNextHistoryBtnClicked() {

  }

  void onSearch(String value) {
    print('..va $value');
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: SafeArea(
        child: Stack(
          children: [
            // dict
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: _bottomHeight,
              child: const DictSwiperWidget(),
            ),
            
            // operation bar
            Positioned(
              bottom: 0,
              height: _bottomHeight,
              left:0,
              right: 0,
              child: Row(
                children: [
                  IconButton(
                    onPressed: onMainMenuBtnClicked,
                    icon: const Icon(Icons.menu)
                  ),

                  IconButton(
                    onPressed: onQuickHistoryBtnClicked,
                    icon: const Icon(Icons.history)
                  ),

                  IconButton(
                    onPressed: onPreHistoryBtnClicked,
                    icon: const Icon(Icons.arrow_back_ios)
                  ),

                  IconButton(
                    onPressed: onNextHistoryBtnClicked,
                    icon: const Icon(Icons.arrow_forward_ios)
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 10, 6),
                      child: TextField(
                        onSubmitted: onSearch,
                        textInputAction: TextInputAction.search,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          hintText: '搜尋內容',
                          prefixIcon: Icon(Icons.search)
                        ),
                      )
                    ),
                  )
                  
                ],
              ))

            // quick history
            // hot
            // ... more
          ],
        )
      ),
    );
  }
}
