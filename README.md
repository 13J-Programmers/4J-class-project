
4J-class-project
================

[![Circle CI](https://circleci.com/gh/13J-Programmers/4J-class-project.svg?style=shield&circle-token=2a94d13b8aebecfcff2b83ed3db40b67c24345bc)](https://circleci.com/gh/13J-Programmers/4J-class-project)
[![Code Climate](https://codeclimate.com/github/13J-Programmers/4J-class-project/badges/gpa.svg)](https://codeclimate.com/github/13J-Programmers/4J-class-project)

<!-- [js-game](http://13j-programmers.github.io/4J-class-project/) -->


Feature
-------

- ブラウザ上で遊べる
- オブジェクトの傾きを手で操作し、障害物を避けながら進む前後スクロールなゲーム


TODO
-----

### General

プロジェクト全体に関するTODO

- [x] JS,CoffeeScriptの共存方法を解決
    - 開発環境をNode.js前提にして、ES6+BabelでJavaScriptを使用する

### Game

展示本体に関するTODO

- [ ] ゲーム名の決定
- [ ] 三次元モデルの作成
    - または代替となるオブジェクトの描画の検討
- [ ] 操作
    - [ ] キーボードによる操作
    - [ ] LeapMotionによる操作
- [x] プログラムの設計

### Environment

開発環境に関するTODO

- [ ] circleCIからの自動デプロイ
- [ ] hubotからGithub関連の操作を行う
    - merge
    - issue


Development
-----------

文化祭クラス企画展示用のゲーム

### Draft

- [ideas](https://github.com/13J-Programmers/4J-class-project/blob/master/doc/ideas.md)
- [design](https://github.com/13J-Programmers/4J-class-project/blob/master/doc/design.md)

### Design

- [THREE.js](http://threejs.org/)（JavaScriptライブラリ）を用いたWebGLによる3Dレンダリング
- Node.js でサーバーサイドの処理を行う
- Heroku 上で動作する（[TODO: デプロイ先のURL](https://www.heroku.com/)）
- [GitHub flow](https://gist.github.com/Gab-km/3705015) の手順で作業する
- Push時に Circle CI に自動でテストとデプロイをさせる

### Environment

- [Git](https://git-scm.com/)（バージョン管理ツール）
- [Node.js](https://nodejs.org/en/)（ネットワークアプリケーションを構築するためのプラットフォーム）
- ゲーム側で使うNode.jsパッケージ
    - [Babel](https://babeljs.io/)（ES6 => ES5 への変換）
    - [Mocha](https://mochajs.org/) (test framework)
- サーバ側で使うNode.jsパッケージ
    - [Express](http://expressjs.com/) (web framework)
    - [Jade](http://jadelang.net/) (template language for writing HTML)

### Build

performed an operation check on Node.js v5.6.0 and npm v3.7.0

installing all dependencies

    npm install

starting server (default is on [localhost:3000](http://localhost:3000))

    npm start

build source code

    npm run build
    npm run build:watch  # To compile a file every time that you change it

if you want to run `npm run build:watch` on background,

    npm run build:watch &>/dev/null &  # run on background

### Doc

- [policy](https://github.com/13J-Programmers/4J-class-project/blob/master/doc/policy.md)
- [use-issue](https://github.com/13J-Programmers/4J-class-project/blob/master/doc/use-issue.md)


Contributing
------------

1. Fork it ( https://github.com/13J-Programmers/4J-class-project )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

Contact us
----------

If you have any questions, please ask us ([issues](https://github.com/13J-Programmers/4J-class-project/issues), slack)
