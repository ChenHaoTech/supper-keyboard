#Include, ./Lib/JSON.ahk
#Include, ./Lib/utility.ahk

#t:: 
; Send, ^{c}
if (ClipboarNotNull() == 0)
{
    hToolTip(" no data input")
    return
}
tmp := Clipboard
data := tranlate(Clipboard) ;使用金山翻译
; data := tranlateSimple(Clipboard)
ToolTip, %data%
return

; 使用qq翻译
tranlateSimple(word){
    IniRead, string, ./config.ini, qqTranslate, string     
    url := string . word
    json_str := URLDownloadToVar(url)
    data := json(json_str, "data")
    return data
}
; JSON 解析
json(ByRef js, s, v = "") {
	j = %js%
	Loop, Parse, s, .
	{
		p = 2
		RegExMatch(A_LoopField, "([+\-]?)([^[]+)(?:\[(\d+)\])?", q), q3 := q3 ? q3 : 0
		Loop {
			If (!p := RegExMatch(j, "(""|')([^\1]+?)\1\s*:\s*((""|')?[^\4]*?\4|(\{(?:[^{}]*+|(?5))*\})|[+\-]?\d+(?:\.\d*)?|true|false|null?)\s*(?:,|$|\})", x, p))
				Return
			Else If (-1 == q3 -= x2 == q2 or q2 == "*") {
				j = %x3%
				z += p + StrLen(x2) - 2
				Break
			}
			Else p += StrLen(x)
		}
	}

    z-=StrLen(x)
    If (v !="" ) {
     NewStr := RegExReplace(x, x3 , v)
    js := RegExReplace(js, x , NewStr,"",1,z)
  }

	Return, x3 == "false" ? 0 : x3 == "true" ? 1 : x3 == "null" or x3 == "nul" ? "" : SubStr(x3, 1, 1) == "" ? SubStr(x3, 2, -1) : x3
}

;=======|      使用金山词霸 |============================================
tranlate(word){
    ; URL示例:
    ; http://dict-co.iciba.com/api/dictionary.php?type=json&w=go&key=062DBC6EB9F93872E382D0BEA6C95AA7
    IniRead, secretKey, ./config.ini, jinshan, key 
    IniRead, string, ./config.ini, jinshan, string     
    url := string . word . "&key=" . secretKey
    ; json_str := "(" . URLDownloadToVar(url) . ")" ; 是否要加 ;
    json_str := URLDownloadToVar(url)
    json := JSON.Load(json_str) ; 获得json对象
    ; data := json.symbols[1]
    data := json.is_CRI
    data := json.symbols[0].ph_en
    MsgBox %json_str%
    MsgBox,  %data% 
    ListVars
    return data
}
;=======|	url存入var	|============================================
URLDownloadToVar(url){
	hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
	hObject.Open("GET",url)
	hObject.Send()
	return hObject.ResponseText
}
