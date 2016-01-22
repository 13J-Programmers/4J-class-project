TOC

- コーディングスタイル
- コーディング方針


コーディングスタイル
=================

HTML
-----

- タブ幅はスペース2つで、ソフトタブを使います。
- CSSやJavaScriptは外部ファイルに置くようにします。

JavaScript
-----------

- タブ幅はスペース4つで、ソフトタブを使います。
- セミコロンは忘れずに付けます（セミコロン自動挿入の阻止）。
- 変数名・関数名は__キャメルケース__、クラス名は__パスカルケース__にします。
- 読みやすさの向上のため、switchとcaseを揃えます（インデントルールの例外）。

~~~ js
switch (variable) {
case expression:
    doSomething();
    break;
default:
    doOtherwise();
}
~~~

- インデントを要求する波括弧は、省略できる場合であっても必ず使います。

~~~ js
// Good
if (expression) {
    doSomething();
}

// Bad
if (expression)
    doSomething();
~~~

- クラスの宣言方法はCoffeeScriptと同じ方法を取ります。詳細は以下

~~~ js
var Person = (function () {
    var _age; // private変数（アンダースコア_から始めます）

    // コンストラクタ
    function Person(name, age) {
        this.name = name; // public変数の初期化
        _age = age;       // private変数の初期化
    }

    // publicメソッド
    Person.prototype.say = function () {
        return "My name is " + this.name;
    };

    Person.prototype.age = function () {
        return "I am " + _age + "years old";
    }

    // privateメソッド（アンダースコア_から始めます）
    Person.prototype._foo = function () {
        // ...
    };

    // 作成したクラスを返す
    return Person;
})();
~~~

- クラスへのコメントはYUIDocの形式を積極的に使います。

~~~ js
/**
 * 動物の振る舞いをするオブジェクトを作成するクラス
 * @class Animal
 */
var Animal = (function() {
    /**
     * Animalオブジェクトの作成
     *
     * @constructor
     * @method Animal
     * @param  {String} name 動物の名前
     */
    function Animal(name) {
        this.name = name;
        this.x = 0;
    }

    /**
     * 動物のx座標を移動する
     *
     * @method move
     * @param  {Number} meters 移動する距離
     * @return {Number} 移動した距離
     */
    Animal.prototype.move = function(meters) {
        alert(this.name + " moved " + meters + "m.");
        this.x += meters;
        return meters;
    };

    return Animal;
})();

var animal = new Animal("dog");
animal.move(10);
~~~

- ECMAScript6のサポート状況はブラウザごとに違いがあるので、今回は使わないことにします。


CoffeeScript
------------

- タブ幅はスペース2つで、ソフトタブを使います。
- `&&` と `||` ではなく `and` と `or` を使います。
- 変数展開のない文字列は、シングルクォート`'single quote'`が好まれます。
- 関数には必ず`()`を書きます。ただし、APIの使用時には必ずしもこのルールに当てはまりません。
- クラスへのコメントはYUIDocの形式を積極的に使います。

~~~ coffee
###*
# 動物の振る舞いをするオブジェクトを作成するクラス
# @class Animal
###
class Animal
  ###*
  # Animalオブジェクトの作成
  #
  # @constructor
  # @method Animal
  # @param  {String} name 動物の名前
  ###
  constructor: (@name) ->
    this.x = 0

  ###*
  # 動物のx座標を移動する
  #
  # @method move
  # @param  {Number} meters 移動する距離
  # @return {Number} 移動した距離
  ###
  move: (meters) ->
    alert @name + " moved #{meters}m."
    this.x += meters
    meters


animal = new Animal('dog')
animal.move(10)
~~~


コーディング方針
==============

技術的な目標とか方針とか

- CoffeeScript
- Three.js
- Underscore.js
- Node.js(直接の開発には用いない)
- [GitHub flow](https://gist.github.com/Gab-km/3705015) の手順で作業する
- Hubot を使って ChatOps な環境を Slack に作る
    - issueを立てる
- プログラムの一部にテストを適用する
    - Mocha
- Push時に Circle CI に自動テストさせる
- ローカルでのいろいろな作業を gulp.js で自動化する
