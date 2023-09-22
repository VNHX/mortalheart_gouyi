
import 'package:mortalheart_gouyi/utils/sp_utils.dart';

///历史搜索记录的KEY
String SEARCHHISTORYKEY = "searchHistory";

class GouyiSearchService {
  ///保存历史搜索记录
  static saveSearchHistory(String searchWords) async {
    List? searchHistoryList =
    await SPUtils.getData(SEARCHHISTORYKEY);
    if (searchHistoryList != null) {
      var isHaveSameData = searchHistoryList.any((element) {
        return element == searchWords;
      });

      /// 判断是否有相同的数据
      if (isHaveSameData) {
        ///有相同的数据，最好是先移除后添加
        // List tempList = [];
        // tempList.add(searchWords);
        searchHistoryList.remove(searchWords);
        searchHistoryList.add(searchWords);
        await SPUtils.setData(SEARCHHISTORYKEY, searchHistoryList);
      } else {
        ///没有相同的
        searchHistoryList.add(searchWords);
        await SPUtils.setData(SEARCHHISTORYKEY, searchHistoryList);
      }
    } else {
      ///没有存过数据
      List tempList = [];
      tempList.add(searchWords);
      await SPUtils.setData(SEARCHHISTORYKEY, tempList);
    }
  }

  ///获取历史搜索记录
  static Future<List> getSearchHistory() async {
    List? searchHistoryList =
    await SPUtils.getData(SEARCHHISTORYKEY);
    return searchHistoryList ?? [];
  }

  ///删除历史搜索记录
  static deleteSearchHistory(String searchWords) async {
    List? searchHistoryList =
    await SPUtils.getData(SEARCHHISTORYKEY);
    if (searchHistoryList != null) {
      searchHistoryList.remove(searchWords);
      await SPUtils.setData(SEARCHHISTORYKEY, searchHistoryList);
    }
  }

  ///清空历史搜索记录
  static removeAllSearchHistory() async {
    await SPUtils.removeData(SEARCHHISTORYKEY);
  }
}
