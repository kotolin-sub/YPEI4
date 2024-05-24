@echo off
rem ※remと書いてあるところは削除しないでください！※
rem ※setコマンドの変数の中身とlisence変数の追加以外編集しないでください！※
set name=プラグイン名
set description=説明
set author=制作者の名前
set directoryname=プラグインフォルダの名前
rem projectURLはプラグインのURL(zipファイル)を入力してください
set projecturl=https://github.com/RainKasa/test/raw/main/plugin.zip
rem ライセンスファイルの読み込みもしたい場合、licence=falseをlicence=trueにして、
rem licenceurlの中身にlicenceファイル(txt)のリンクを入れて先頭のremを消してください
set licence=false
rem set licenceurl=
del /q plugin.zip
rmdir /S /q plugin
echo プラグイン名:%name%
echo 説明:%description%
echo 制作者:%author%
:RESTART
set /p yn_check="インストールしますか？"
IF %yn_check:Y=Y%==Y (
echo you selected " y "
) ELSE IF %yn_check:N=N%==N  (
echo you selected " n "
) ELSE (
cls
echo " %yn_check% " は不正な入力です。
GOTO RESTART
)

cls
:INPUT_START
ECHO  YMM4のインストールされているフォルダー(YukkuriMovieMaker_v4)の絶対パスを入力してください。
ECHO 例: D:\YukkuriMovieMaker_v4\
SET INPUT_STR=
SET /P INPUT_STR=
 
IF "%INPUT_STR%"=="" GOTO :INPUT_START
 
:INPUT_CONF
ECHO  入力した絶対パスは[%INPUT_STR%]でよろしいですか？
ECHO （Y / N）
SET CONF_SELECT=
SET /P CONF_SELECT=
 
IF "%CONF_SELECT%"== SET CONF_SELECT=Y
IF /I NOT "%CONF_SELECT%"=="Y"  GOTO :INPUT_START
 
:INPUT_END
rmdir /q %INPUT_STR%/user/plugin/%directoryname%
ECHO ダウンロードしています...
curl %projecturl% -O plugin.zip
ECHO ダウンロードできました!
ECHO 解凍しています...
mkdir temp_plugin
tar -xf plugin.zip
ECHO 解凍できました!
ECHO 移動しています...
mkdir %INPUT_STR%/user/plugin/%directoryname%
move temp_plugin %INPUT_STR%/user/plugin/%directoryname%
cls
ECHO インストールに成功しました。
ECHO これでインストールできなかった場合、DiscordID:raink4s4 に連絡してください。
pause