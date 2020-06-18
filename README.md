# ポートフォリオ　（LearningManagement）
　　http://pf.awspfsample.net/

## 概要
　勉強の進捗を管理して、モチベーションを維持する。  
　また、フォロワーやコメントをしあうことでお互い高めあっていくようにした。    
　(お試しログイン有り、進捗画面に使い方説明表示ボタン有り)

## 使用技術
　フロント： HTML(Slim),CSS(SCSS),JQuery,Bootstrap  
　バックエンド： Ruby,Rails  
　DB:  PostgreSQL  
　インフラ:  AWS (EC2:nginx.unicorn ,RDS,S3,ElasticIP,Route53,ALB)  
　　（ALBは設定したが読み込みに時間がかかりすぎたため外しています。）  
    
　その他:  Docker,Docker-compose,GitHub  

## 機能
 - ログイン/ログアウト（bootstrap modal)
 - アカウント登録/編集
    - delete_flagでの論理削除
    - 写真の登録
    - 詳細画面
    - フォロー、科目数の表示
 - フォロー機能
    - ユーザー検索
    - 全ユーザー、フォロー者表示
 - コメント機能
    - コメントに対するコメント登録
    - ファイトボタンの実施
 - 進捗画面での科目登録
    - 進捗保存で進んだ分色がつく
    - グリッドシステムによるマスの変動
 - モーダルによる使い方の表示
 - レスポンシブ対応
 - i18nを使ってエラ〜メッセージなどを表示
 - flashを使っての簡易メッセージの表示

## 今後の学習・導入予定技術
　RSpec Circle CI/CD　Ajaxによる使用感の向上