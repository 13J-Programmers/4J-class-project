# 構想

## 内容

- JS(主に[three.js](http://threejs.org/))とLEAP MOTION(および専用コントローラ)によるゲーム
	* オブジェクトの傾きを手で操作し、障害物を避けながら進む前後スクロール
	
## 課題
- 子供から大人まで、または親子で遊べるゲームになるか
- コンセプトの策定
- グラフィック

## 機器
- ゲームをホストするサーバ
- LEAP　MOTION
- 代替コントローラ(要自作?)

#その他の構想

* 来場者の携帯端末からアクセスし、利用できるサービス
	- ポイントを回ってもらう謎解き
	- 屋台情報など

* LEAP MOTION を使う場合
	- [Angry Birds](https://ja.wikipedia.org/wiki/Angry_Birds) のようなゲーム
		- パチンコを使って鳥を飛ばし、建物にいる豚たちを潰していく（アクション）パズルゲーム
		- パチンコに挟んだ弾を、握って放す手の動きはLEAPで実現可能
		- 背後にあるストーリーの構成次第では面白くなるかも
	- 2Dビリヤード
		- 宇宙空間3Dビリヤード：[Cueb](https://apps.leapmotion.com/apps/cueb/osx) を2D化したビリヤード
		- 物理法則は全部Unityに任せられるという点と、使用する形は球がメインになるので、楽かもしれない
	- [Flappy Rocked](https://apps.leapmotion.com/apps/flappy-rocket/osx) のようなゲーム
		- 手をパタパタさせて飛び、パイプを避けて、高得点を目指すアクションゲーム
		- 複雑な手の動きがないので、集中力さえあれば誰でも遊べるはず
	- くぐってグライダー（仮名） -> ほぼ上記構想
		- グライダーの傾きを手でコントロールして、次々と迫ってくる障害物や壁をすり抜けていくアクションゲーム


## 使用機器案

- Unity
	- ゲーム作りを楽にするフレームワーク
	- 使用言語はC#で確定
- LeapMotion
	- 手元のジェスチャでパソコンを操作するためのセンサ
	- 新しいゲームでもこれを使いたい
- ゲーム用コントローラ
	- 操作性が不評だったEcorisのための、代替コントローラ
		- ゲームコントローラーでも触ったことのない人は難しい?
	- ジョイスティックを使うかも
	- Arduinoマイコン等を用いて、Unityと連携する
- Server
	- 来場者の携帯端末で利用出来るサービスを提供するためのサーバ（さくら）
	- 使用言語は問わない
	- 場合によってはTwitterAPIを使うかも?
- Siv3D(http://play-siv3d.hateblo.jp/)
	- C++用のゲームライブラリ
	- 「おさむーぶ」はこれで作られた(対抗しても面白いかも)
	- Unityよりも難しいが、悪い意味のUnityっぽさが抜けるかも
	- Leapmotion,Kinectも使える
- mbed
	- オンライン上で開発でき(OSを問わない)、C++で書けるため非常に扱いやすいマイコン。
	- 1つ80円で購入できる型番もあり、非常にリーズナブル。
	- おそらくUnity等とも連携できるはず。
	- 連携できなくても、インタフェースとして充分に活用できる。
