# python-lib-builder

Pythonで利用するライブラリをビルドするツール

## 概要

Pythonのバージョン、ライブラリを指定して、対応するライブラリをビルドします。

## 動機

AWSのlambda用のPythonのバージョンをあげようとしても、ライブラリがまだ提供されておらず、ライブラリのビルド方法を試行錯誤する必要がありました。

docker環境内でpyenvでPythonをインストールして、pipを利用してライブラリをビルドすることで、ライブラリを探す手間を省き、環境に合ったライブラリをビルドできると考えました。

## ビルド方法

1. ビルド対象の環境に応じてDockerfileを調整
   - 私はAWSのlambda用のライブラリをビルドしたかったので、Amazonlinux:2023をベースにビルドしています。必要があれば対象の環境に合わせて変更してください。
2. requirement.txtを変更
   - 必要なライブラリを追加してください。サンプルではlambdaからpostgresにアクセスするためのライブラリとしてpsycopg2-binaryをビルド対象としています。
3. build.sh を実行
   - Dockerfileのビルド、ライブラリの生成を実行します。ライブラリはpythonディレクトリに生成されます。

GitHub Actionsに組み込むことも可能です。
[サンプルのワークフロー](.github/workflows/sample.yml)が参考になるかもしれません。

## 使用技術一覧

<!-- シールド一覧 -->
<p style="display: inline">
  <img src="https://img.shields.io/badge/-Python-F2C63C.svg?logo=python&style=for-the-badge">
  <img src="https://img.shields.io/badge/-Docker-1488C6.svg?logo=docker&style=for-the-badge">
  <img src="https://img.shields.io/badge/-githubactions-FFFFFF.svg?logo=github-actions&style=for-the-badge">
  <img src="https://img.shields.io/badge/-Amazon%20aws-232F3E.svg?logo=amazon-aws&style=for-the-badge">
</p>
