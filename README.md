# dotfiles-Ubuntu

Ubuntu セットアップ用 dotfiles。

## 新しいマシンへのセットアップ

ターミナルに以下を貼り付けて実行してください。  
途中でパスワードや確認を求められたら適宜答えてください。

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Tobiuo1022/dotfiles-Ubuntu/refs/heads/main/init.sh)"
```

## セットアップの流れ

`init.sh` が以下を順番に実行します。

1. apt update / upgrade
2. SSH 鍵の生成 → GitHub への公開鍵登録を案内
3. このリポジトリを `~/dotfiles-Ubuntu` へ clone
4. `task/setting.sh` — GNOME 設定、ファイアウォール、Git の初期設定
5. `task/install.sh` — パッケージ・ツールのインストール
6. `task/link.sh`    — dotfiles をホームへシンボリックリンク

## インストールされるもの

| ツール | 用途 |
|--------|------|
| neovim | エディタ |
| fzf | ファジーファインダー |
| asdf | バージョンマネージャ |
| Node.js 24.12.0 | JavaScript ランタイム |
| markmap-cli | Markdown マインドマップ |
| claude-code | Claude CLI (AI コーディング) |
| Docker | コンテナ |
| powertop | 電力最適化 |

## Google Drive マウント（任意）

`google-drive-ocamlfuse` を手動でセットアップしてください。

```bash
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt install google-drive-ocamlfuse
mkdir -p ~/gdrive
google-drive-ocamlfuse ~/gdrive/
```

## バックアップ

`task/link.sh` 実行時、既存の dotfiles は `~/.dotfiles_backup/<timestamp>/` に退避されます。
