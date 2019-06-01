; #Include, ./Lib/translate.ahk
; MsgBox % translateApi("theme like lyou","youdao")
#SingleInstance, force
#esc::
Reload
return
#t::
msgbox , % h_translate("hello")
; ListVars
return

h_translate(word){
; 获得unix时间戳 
Time := A_NowUTC
EnvSub, UnixTime, 19700101000000, Seconds
; 从ini文件中读取appkey和秘钥
IniRead, appkey, %A_scriptDir%/config/config.ini, youdao, appkey ;, 0db48448f0101e58
IniRead, secretKey, %A_scriptDir%/config/config.ini, youdao, secretKey ;, 8Vja0sAvE7VNtGe0mvsu91xMTfKYu7yy
; TODO 判断word的长度计算input
; input的计算方式为：input=q前10个字符 + q长度 + q后十个字符（当q长度大于20）或 input=q字符串（当q长度小于等于20）
input := word
; TODO 随机数字可能不好用
Random, salt
;sign= sha256(应用ID+input+salt+当前UTC时间戳+密钥)
signStrl := appeky . input . salt . UnixTime . secretKey
sign := SHA256(signStrl)

; 封装 json
json_str =
(
{
	"q":%word%, 
    "from":"auto", 
    "to":"auto", 
    "appkey": %appkey%, 
    "salt":%salt%, 
    "sign":%sign%, 
    "signType":"v3", 
    "curTime":%UnixTime%
}
)
Clipboard := json_str
; msgbox %json_str%
; 调用参数参考: https://ai.youdao.com/docs/doc-trans-api.s#p04
; 不要音频
url := "https://openapi.youdao.com/api?q=" . word 
	. "&from=auto&to=auto&appkey=" . appkey 
	. "&salt=" . salt 
	. "&sign=" . sign 
	. "&signType=v3" 
	. "&curtime=" . UnixTime
Clipboard := url
; 使用json语法
; url := "https://openapi.youdao.com/api?data=" . json_str
ListVars
return URLDownloadToVar(url)
}

;=======|	url存入var	|============================================
URLDownloadToVar(url){
	hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
	hObject.Open("GET",url)
	hObject.Send()
	return hObject.ResponseText
}

; SHA256 ============================================================================
SHA256(string, encoding = "utf-8")
{
    return CalcStringHash(string, 0x800c, encoding)
}
 
; CalcAddrHash ======================================================================
CalcAddrHash(addr, length, algid, byref hash = 0, byref hashlength = 0)
{
    static h := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "A", "B", "C", "D", "E", "F"]
    static b := h.minIndex()
    o := ""
    if (DllCall("advapi32\CryptAcquireContext", "Ptr*", hProv, "Ptr", 0, "Ptr", 0, "UInt", 24, "UInt", 0xF0000000))
    {
        if (DllCall("advapi32\CryptCreateHash", "Ptr", hProv, "UInt", algid, "UInt", 0, "UInt", 0, "Ptr*", hHash))
        {
            if (DllCall("advapi32\CryptHashData", "Ptr", hHash, "Ptr", addr, "UInt", length, "UInt", 0))
            {
                if (DllCall("advapi32\CryptGetHashParam", "Ptr", hHash, "UInt", 2, "Ptr", 0, "UInt*", hashlength, "UInt", 0))
                {
                    VarSetCapacity(hash, hashlength, 0)
                    if (DllCall("advapi32\CryptGetHashParam", "Ptr", hHash, "UInt", 2, "Ptr", &hash, "UInt*", hashlength, "UInt", 0))
                    {
                        loop, % hashlength
                        {
                            v := NumGet(hash, A_Index - 1, "UChar")
                            o .= h[(v >> 4) + b] h[(v & 0xf) + b]
                        }
                    }
                }
            }
            DllCall("advapi32\CryptDestroyHash", "Ptr", hHash)
        }
        DllCall("advapi32\CryPtreleaseContext", "Ptr", hProv, "UInt", 0)
    }
    return o
}
 
; CalcStringHash ====================================================================
CalcStringHash(string, algid, encoding = "utf-8", byref hash = 0, byref hashlength = 0)
{
    chrlength := (encoding = "cp1200" || encoding = "utf-16") ? 2 : 1
    length := (StrPut(string, encoding) - 1) * chrlength
    VarSetCapacity(data, length, 0)
    StrPut(string, &data, floor(length / chrlength), encoding)
    return CalcAddrHash(&data, length, algid, hash, hashlength)
}