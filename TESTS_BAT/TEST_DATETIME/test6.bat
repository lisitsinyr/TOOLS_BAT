@echo off
rem � ���஡���� �ਭ��� �⢥�, � �� ࠡ�⠥� �����쭮 ���.
rem � ᮦ������, �ଠ� �६��� � ��� �룫廊� ��� H:MM:SS.CS,
rem � �ய�饭�� 0 ᯥ।� ��뢠� �஡���� � ᨭ⠪��᪨� �������� �� 10 ���.
rem �⮡� �८������ �� �९���⢨�, � ⠪�� ࠧ���� ᨭ⠪��᪨�
rem ������ ����設�⢠ ���� �ଠ⮢ ��஢��� �६���,
rem � �ਤ㬠� ��� ������ ��楤���, �����, ��宦�, ࠡ�⠥� �����쭮 ���.

:ParseTime
rem The format of %%TIME%% is H:MM:SS.CS or (HH:MM:SS,CS) for example 0:01:23.45 or 23:59:59,99
FOR /F "tokens=1,2,3,4 delims=:.," %%a IN ("%1") DO SET /A "%2=(%%a * 360000) + (%%b * 6000) + (%%c * 100) + %%d"
GOTO :EOF

rem ���⭮� �ᮡ�������� �⮩ ��楤��� ���� �, �� �� ��।���
rem ��ப� time � ����⢥ ��ࢮ�� ��ࠬ��� � ��� ��६����� �।�,
rem � ���ன �� ��� 㪠���� �६� (� ᠭ�ᥪ㭤��) � ����⢥ ��ண� ��ࠬ���.

rem ���ਬ��:

CALL :ParseTime %START_TIME% START_CS
CALL :ParseTime %TIME% END_CS
SET /A DURATION=%END_CS% - %START_CS%

