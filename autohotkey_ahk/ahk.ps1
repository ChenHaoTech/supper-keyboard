$compile= "D:\code\AHK\Compiler\Ahk2Exe.exe"
$icon = "D:\code\AHK\autohotkey_study\autohotkey_icon\cool.ico"

$my_ahk_exe = "D:\Program Portable\superkey\superKey.exe"

$my_ahk="D:\code\AHK\autohotkey_study\autohotkey_ahk\superKey.ahk"
$ahk_path = "D:\code\AHK\autohotkey_study\autohotkey_ahk"

tk superKey 
tk autohotkey 

rm $my_ahk_exe
rm D:\code\AHK\autohotkey_study\autohotkey_ahk\*.bak
&$compile /in $my_ahk /out  $my_ahk_exe /icon $icon /CP "65001"
cp "D:\code\AHK\autohotkey_study\autohotkey_ahk\config.ini"  "D:\Program Portable\superkey\" 
sleep 3
ii $my_ahk_exe

function tk
{
	$kill_item = $args[0]+".exe"
	taskkill /f /im $kill_item
}