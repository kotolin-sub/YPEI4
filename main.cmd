@echo off
rem ��rem�Ə����Ă���Ƃ���͍폜���Ȃ��ł��������I��
rem ��set�R�}���h�̕ϐ��̒��g��lisence�ϐ��̒ǉ��ȊO�ҏW���Ȃ��ł��������I��
set name=�v���O�C����
set description=����
set author=����҂̖��O
set directoryname=�v���O�C���t�H���_�̖��O
rem projectURL�̓v���O�C����URL(zip�t�@�C��)����͂��Ă�������
set projecturl=https://github.com/RainKasa/test/raw/main/plugin.zip
rem ���C�Z���X�t�@�C���̓ǂݍ��݂��������ꍇ�Alicence=false��licence=true�ɂ��āA
rem licenceurl�̒��g��licence�t�@�C��(txt)�̃����N�����Đ擪��rem�������Ă�������
set licence=false
rem set licenceurl=
del /q plugin.zip
rmdir /S /q plugin
echo �v���O�C����:%name%
echo ����:%description%
echo �����:%author%
:RESTART
set /p yn_check="�C���X�g�[�����܂����H"
IF %yn_check:Y=Y%==Y (
echo you selected " y "
) ELSE IF %yn_check:N=N%==N  (
echo you selected " n "
) ELSE (
cls
echo " %yn_check% " �͕s���ȓ��͂ł��B
GOTO RESTART
)

cls
:INPUT_START
ECHO  YMM4�̃C���X�g�[������Ă���t�H���_�[(YukkuriMovieMaker_v4)�̐�΃p�X����͂��Ă��������B
ECHO ��: D:\YukkuriMovieMaker_v4\
SET INPUT_STR=
SET /P INPUT_STR=
 
IF "%INPUT_STR%"=="" GOTO :INPUT_START
 
:INPUT_CONF
ECHO  ���͂�����΃p�X��[%INPUT_STR%]�ł�낵���ł����H
ECHO �iY / N�j
SET CONF_SELECT=
SET /P CONF_SELECT=
 
IF "%CONF_SELECT%"== SET CONF_SELECT=Y
IF /I NOT "%CONF_SELECT%"=="Y"  GOTO :INPUT_START
 
:INPUT_END
rmdir /q %INPUT_STR%/user/plugin/%directoryname%
ECHO �_�E�����[�h���Ă��܂�...
curl %projecturl% -O plugin.zip
ECHO �_�E�����[�h�ł��܂���!
ECHO �𓀂��Ă��܂�...
mkdir temp_plugin
tar -xf plugin.zip
ECHO �𓀂ł��܂���!
ECHO �ړ����Ă��܂�...
mkdir %INPUT_STR%/user/plugin/%directoryname%
move temp_plugin %INPUT_STR%/user/plugin/%directoryname%
cls
ECHO �C���X�g�[���ɐ������܂����B
ECHO ����ŃC���X�g�[���ł��Ȃ������ꍇ�ADiscordID:raink4s4 �ɘA�����Ă��������B
pause