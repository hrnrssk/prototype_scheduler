# README

## Prototype Scheduler

### 概要
    チームメンバーが作業者と装置の予定を考慮しながら試作品の予定を組めます

### コンセプト
    予定組みに柔軟性が必要な【試作品】の生産スケジュールが作れます

### バージョン
    Ruby 2.5.4 Rails 5.2.4

### 機能一覧
* サインイン画面
    * 氏名、メールアドレス、作業可能な装置、パスワードを登録してサインインします

* ログイン画面
    * ログイン機能があります

* トップ画面
    * 注文番号を入力して試作品情報登録ボタン、注文番号を入力して工程立案ボタン、
    * 試作品進捗ボタン、マイページボタン、新規工程登録ボタンを押して画面遷移します
	* 試作品一覧（得意先、品名、注文番号、納期、工程終了予定日、猶予日数）
	* 注文番号と得意先名で試作品を検索できます

* 試作品情報登録・編集画面
    * 得意先、品名、注文番号、納期の登録と編集ができます

* 工程立案登録・編集画面（試作品進捗画面）
    * 注文番号を編集できます
	* 工程フローを順番に登録。各工程は装置と作業担当者と所要時間と開始予定と終了予定を登録
	* スケジュール表示ボタンを押すとその工程の装置とエンジニアのスケジュールが表示され、
    * 両方の予定が同時に確認できます
	* 工程の追加や工程の内容を編集できます
	* 工程実績を入力できます（終了日時）

* 新規装置登録画面
    * 新規装置を登録できます（装置名称、コメント）
    

* 既存装置編集画面
    * 既存装置を編集できます（装置名称、コメント）。既存装置の呼び出し

* 新規工程登録画面
    * 新規工程を登録できます（工程名称、装置名称、作業可能者名）

* 既存工程編集画面
    * 既存工程を編集できます（工程名称、装置名称、作業可能者名）。既存工程の呼び出し

* ウェブサーバー
    * AWSを利用します

### カタログ設計
https://docs.google.com/spreadsheets/d/1bp1BmEXKilqHE6iHaoCNJ2_QqSBPjn5JrWpSlK03K_w/edit#gid=0

### テーブル定義
https://docs.google.com/spreadsheets/d/1bp1BmEXKilqHE6iHaoCNJ2_QqSBPjn5JrWpSlK03K_w/edit#gid=0

### 画面遷移図
https://cacoo.com/diagrams/AvzKM7N6yGzLTW0K/94C25?reload_rt=1606440743783_0

### 画面ワイヤーフレーム
https://cacoo.com/diagrams/AvzKM7N6yGzLTW0K/94C25?reload_rt=1606440743783_0

### 使用予定Gem
  * devise
  * ransack
