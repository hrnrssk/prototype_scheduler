# README

## Prototype Scheduler

### 概要
    チームメンバーが作業者と装置の予定を考慮しながら試作品の予定を組めます

### コンセプト
    スケジュール調整の手間が省けます

### バージョン
    Ruby 2.6.5    Rails 5.2.4

### 使用予定技術
  * devise: ログイン認証
  * ransack: 試作品検索
  * AWS: ウェブサーバー

### 機能一覧
* サインイン画面
    * 氏名、メールアドレス、パスワードを登録してサインインします

* ログイン画面
    * ログイン機能があります

* トップ画面
    * 新規試作品を登録するボタン。
	* 試作品一覧（注文番号、得意先、品名、納期、工程終了予定日、猶予日数）
	* 注文番号と得意先名で試作品を検索できます

* 試作品情報登録・編集画面
    * 得意先、品名、注文番号、納期の登録と編集ができます

* 試作品スケジュール画面
	* 工程フローを順番に登録。各工程は装置と作業担当者と所要時間と開始予定と終了予定を登録します
	* 工程を選択するとその工程を担当可能な作業者名がセレクトボックスに表示されます
    * 工程を選択するとその工程に紐づく装置のスケジュールが表示されます
    * 作業者を選択するとその人の個人スケジュールが表示されます
	* 工程の追加や工程の内容を編集できます
	* 工程実績を入力できます（終了日時）

* 装置一覧画面
    * 装置一覧が確認できます

* 新規装置登録画面
    * 新規装置を登録できます（装置名称、コメント）
    
* 既存装置編集画面
    * 既存装置を編集できます（装置名称、コメント）

* 工程一覧画面
    * 工程一覧が確認できます

* 新規工程登録画面
    * 新規工程を登録できます（工程名称、装置名称）

* 既存工程編集画面
    * 既存工程を編集できます（工程名称、装置名称）

* ウェブサーバー
    * AWSを利用します

### カタログ設計
https://docs.google.com/spreadsheets/d/1bp1BmEXKilqHE6iHaoCNJ2_QqSBPjn5JrWpSlK03K_w/edit#gid=0

### テーブル定義
https://docs.google.com/spreadsheets/d/1bp1BmEXKilqHE6iHaoCNJ2_QqSBPjn5JrWpSlK03K_w/edit#gid=0

### 画面遷移図
https://docs.google.com/spreadsheets/d/1bp1BmEXKilqHE6iHaoCNJ2_QqSBPjn5JrWpSlK03K_w/edit#gid=0

### 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1bp1BmEXKilqHE6iHaoCNJ2_QqSBPjn5JrWpSlK03K_w/edit#gid=0
