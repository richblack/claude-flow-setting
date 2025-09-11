# 使用 Claude Flow 的需求

## Pain Points

Claude Code 很會開發，但有些問題：

- 不會先研究，有時候開發的程式抓錯方向；
- 會簡單計劃，但不會詳細計劃；
- 不會主動測試；
- 每次中斷，例如當機或今天工作結束，下次開啓記憶要重新恢復；
- 默默地開發，需要人類介入時不會發聲，一直停着。

## Requirements

我的工作方式如下：

1. 有新專案需要用 Claude 開發，我會開專案檔案夾，再在下面建立 rfp/，把高層需求文件放在這裡
2. Claude Code/ [Claude Flow](https://github.com/ruvnet/claude-flow) 會閱讀及記憶 rfp/ 內的文件，緊抓專案的宗旨
3. 開發前會先做計劃，甚至進行研究，例如我在開發 RemNote 專案時，因為社群資料不多，它在沒有仔細研究 API Docs 下開發，錯誤百出，甚至用錯了 API，後來一一跟它討論才慢慢調整回來，Claude Flow 的 SPARC 模式可以解決這問題
4. 會用語音通知，並且在當機或重啓時再度回覆語音能力，這用我自己開發的 [claude-code-voice](https://github.com/richblack/Claude-Code-Voice.git) 可以解決，整合使用 GitHub 設置的方法
5. 我希望它會記憶過程，斷點後不要忘光，Claude Flow 用 SQLite 記憶，可以解決
6. 一般會在 Mac 開發

我需要的 Quick Stsrt Guide：

* 成立新專案時，例如開新檔案夾 documents/new_project/ 如何啓動，設定一切，滿足工作方式需求。
* 正常工作模式
  * 工作結束時，如何把目前狀態寫入記憶？
  * 回復工作時，需要如何叫出前一次狀態？
* 無預警重啓或當機
  * 如何重啓它們叫回狀態？
* 其他必要操作，例如暫停、恢復... 等必要知道最簡易的。

## 目前狀態

- Claude Flow 已全域安裝，Claude Code 也安裝了
- 先前 Claude 開發了不少的腳本、說明文件，但隨着更新寫了新文件、新腳本，檢查這些文件腳本是否已經過時，修正。
- 原本我把自己開發的 claude-code-voice 放在檔案夾，但已經公開到 GitHub，使用方式可以直接串 GitHub？
- 如果在這個計劃中寫的方法，未來會用在別的計劃，我開新檔案夾時可以自動做這些設定嗎？而不是手動複製？
