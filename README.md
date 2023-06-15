# LOmenu とは
食材をスマホで管理し、家にある食材を使った献立のレシピを提案するスマホアプリ

### デモ動画
[![Lomenu Demo](https://github-production-user-asset-6210df.s3.amazonaws.com/103909922/246010855-751d504a-2fa5-4983-8a0c-9b1c257a865b.png)](https://youtu.be/NBHPX35-V9Y)

## 開発目的
### 食材の破棄を無くす 
 日々生活する中で食材の期限を切らせてしまい、捨ててしますことがありました。その問題を解決するために、食材を効率的に消費し食材廃棄をなくすこ事を目的とし開発して行きました。

### いつもの献立決めを楽に 
 何を作ろうかと悩んだり、献立決めに時間がかかってしまう問題を解決するため。
### 家の食材をいつでも確認可能に
 スーパーなどの食材の買い出しなど、いつでも家にある食材の在庫ををしり、無駄に食材を購入することを防ぐ


## 機能一覧
- 食材記録機能
- レシピ作成機能
- 献立レシピ提案機能
- Login機能

### 食材記録機能
家にある食材の個数を食材に個別についているカウンタで入力し、スマホに保存されるようになっています。
食材のカウンタはカテゴリ別に配置されており、探しやすいようにしています。

### 献立レシピ提案機能
レシピに使う食材とスマホの食材のデータを参照して、引っかかったレシピを表示します。
提案されるレシピは、カテゴリ別に配置されており、探しやすようにしています。

### レシピ作成機能
ユーザが考案したレシピをレシピ記入フォームで記入しデータベースに保存されるようになっています。
作成したレシピは他のユーザにも共有されるため、自分が考えたオリジナルレシピが他の人が作ってくれるようになります。

### Login機能
ユーザがsignin・login・logoutすることができます。


## 開発環境
- アプリ開発　flutter(Dart)
- データベース　firebase
- コード管理　Github
- アイコンデザイン　Illustrator・Photoshop


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
