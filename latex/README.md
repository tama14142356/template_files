# latex
texに関するテンプレートファイル群

## template_platex
platexで動くテンプレート  
前提となるスタイルファイルは[Latex_stylefile](https://github.com/tama14142356/Latex_stylefile)内にあります。

## 想定エディタ
### vscode 
#### 準備
- 拡張機能[latex-workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)のインストール
- Linuxの場合、以下を実行  
参考：[
Beautify error on macOS Sierra: Can't locate YAML/Tiny.pm
](https://github.com/Glavin001/atom-beautify/issues/1792)

```
sudo apt update
sudo apt upgrade -y
sudo cpan Unicode::GCString
sudo cpan App::cpanminus
sudo cpan YAML::Tiny
sudo perl -MCPAN -e 'install "File::HomeDir"'
```

#### 使い方
1. 各テンプレートファイルが入っているディレクトリをルートとしてvscodeを開く
1. 保存すれば、自動でコンパイルが始まります。
1. pdf表示は`ctrl+alt+v`で表示されます。

### その他のエディタ
#### 準備
`.vscode`ディレクトリは不要ですので、邪魔であれば削除しても構いません。
#### 使い方
1. 各テンプレートファイルが入っているディレクトリ(.latexmkrcが存在する階層)に移動
1. `latexmk <filename>`で基本的にコンパイルできます。  
lualatexを使う場合は、オプション`-lualatex`をつけて実行してください。
1. pdfはbuildディレクトリ内にあるので、手動で表示できます。 
