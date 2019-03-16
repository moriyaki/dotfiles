# dotfiles

もりゃきのうんこどっとふぁいる。参考にしてはいけない。

## 考え方

「どこで」「なにを」使うか、そこを意識するなら、dotfilesにそのままファイルを放り込むのは筋が悪く感じた。

## 使い方

そもそもgitが入ってなくて入れられないほど厳しい環境を想定していないので
```
git clone https://github.com/moriyaki/dotfiles
bash dotfiles/dots.sh
```

## 追加時ファイル命名規則

- 共通で使うものは . を _ にする(例：.vimrc → _vimrc)
- WSL.\* 言わずとしれたWindows Subsystem for Linux用
- MINGW.\* 今でも必要としてる人いるんじゃないかなmsys2用
- Linux.\* 開発する人ならこれだよねLinux用
- Darwi.\* Applチョット好きじゃないので n が切れてるけど、使わないけどMac用：未検証

## 当dotfilesの免責

ファイル破損など一切の責任は利用者に帰するものとします。
