# dotfiles

## 使いかた

```bash
bash 02_setup.sh
```

## コマンド集

### vim

#### 編集系

- `i`: insert
- `a`: Append　カーソルの1つうしろからinsert
- `A`: 行末から入力
- `o`: 後ろに行を追加し、insert
- `O`: 前に行を追加し、insert
- `cc`: 行の要素をすべて消してinsert
- `r`: カーソルの位置の文字を置き換え、norma;l
- `s`: カーソルの位置の文字を削除しinsert
- `x`: カーソルの位置の文字を削除したままnormal
- `yy`: をコピペ

#### 移動系

h, j, k, lはそれぞれ左、下、上、右

- w: 次の単語の先頭
- b: 前の単語の先頭
- e: 単語の最後

w, b, eはハイフン、カンマ、句読点などを単語の区切りとみるが、W, B, Eは空白のみ単語の区切りとみなす。

- 0: 行先頭
- $: 行末

`/`で後ろ、`?`で前を検索。nは次、Nは後ろ。

`m`でマーク

- `文字: マーク位置まで
- '文字: マーク位置の先頭

- `fa`: aという文字まで飛ぶ
- `gg`: ファイル先頭
- `GG`: ファイル末尾

#### 組み合わせ

- `c10w`: 10単語削除し、insert
- `c$`: 行末まで削除し、insert
- `c'a`: マークした行まで削除し、insert
- `ci"`: ""の中を削除し、insert

dでも同じ

#### その他

- `.`: normal→insert→normal としたとき、insert時に行った操作を再現する

- `=`: インデントを揃える

### tmux

- Prefix key: Ctrl + q

#### 画面

- 縦分割: -
- 横分割: |

移動はvimの矢印（hjkl）

リサイズはvimの矢印キーの大文字

- 削除: x
- 時計の表示: t

## 参考

- https://github.com/fkubota/dotfiles
  fkubotaさんのdotfiles
- https://qiita.com/nmrmsys/items/03f97f5eabec18a3a18b
  tmuxの操作
- https://qiita.com/tasaki-i3/items/49ebad1dca20c669ad25
  vimの基本操作