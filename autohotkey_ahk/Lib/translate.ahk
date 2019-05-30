translateApi(KeyWord:="", api:="google", lang:="zh-cn|auto", paras*)
{
    static apis:="|google|bing|microsoft|youdao|yd_key|go_key|"
        , lans :="auto|af|af-ZA|sq|sq-AL|ar|ar-DZ|ar-BH|ar-EG|ar-IQ|ar-JO|ar-KW|ar-LB|ar-LY|ar-MA|ar-OM|ar-QA|ar-SA|ar-SY|ar-TN|ar-AE|ar-YE|hy|hy-AM|"
            . "az|az-AZ-Cyrl|az-AZ-Latn|eu|eu-ES|be|be-BY|bg|bg-BG|ca|ca-ES|zh-HK|zh-MO|zh-CN|zh-CHS|zh-SG|zh-TW|zh-CHT|hr|hr-HR|cs|cs-CZ|da|da-DK|div|"
            . "div-MV|nl|nl-BE|nl-NL|en|en-AU|en-BZ|en-CA|en-CB|en-IE|en-JM|en-NZ|en-PH|en-ZA|en-TT|en-GB|en-US|en-ZW|et|et-EE|fo|fo-FO|fa|fa-IR|fi|"
            . "fi-FI|fr|fr-BE|fr-CA|fr-FR|fr-LU|fr-MC|fr-CH|gl|gl-ES|ka|ka-GE|de|de-AT|de-DE|de-LI|de-LU|de-CH|el|el-GR|gu|gu-IN|he|he-IL|hi|hi-IN|hu|"
            . "hu-HU|is|is-IS|id|id-ID|it|it-IT|it-CH|ja|ja-JP|kn|kn-IN|kk|kk-KZ|kok|kok-IN|ko|ko-KR|ky|ky-KZ|lv|lv-LV|lt|lt-LT|mk|mk-MK|ms|ms-BN|ms-MY|mr|"
            . "mr-IN|mn|mn-MN|no|nb-NO|nn-NO|pl|pl-PL|pt|pt-BR|pt-PT|pa|pa-IN|ro|ro-RO|ru|ru-RU|sa|sa-IN|sr-SP-Cyrl|sr-SP-Latn|sk|sk-SK|sl|sl-SI|es|es-AR|"
            . "es-BO|es-CL|es-CO|es-CR|es-DO|es-EC|es-SV|es-GT|es-HN|es-MX|es-NI|es-PA|es-PY|es-PE|es-PR|es-ES|es-UY|es-VE|sw|sw-KE|sv|sv-FI|sv-SE|syr|"
            . "syr-SY|ta|ta-IN|tt|tt-RU|te|te-IN|th|th-TH|tr|tr-TR|uk|uk-UA|ur|ur-PK|uz|uz-UZ-Cyrl|uz-UZ-Latn|vi|vi-VN|"
        , reggoogle := "^\[+""(.*?)"","""
        , regyoudao := "^.*?translation"":\[""(.*?)""\],"""
        , regbing   := "^<[^>]+>(.*?)<\/string>$"
        , ls1:="zh-cn", ls:="auto"
    uapi:={}, ulang:={}
    loop, Parse, api, `|
    {
        uapi[A_Index] := A_LoopField
    }
    loop, Parse, lang, `|
    {
        ulang[A_Index] := A_LoopField
    }
    loop, % (ua:=StrLen(uapi[1]))
    {
        api:=(tag:=RegExMatch(apis,"\b(?<!-)" SubStr(uapi[1], 1, ua+1-(i:=a_index))))
            ? SubStr(apis, tag, InStr(apis, "|",, tag)-tag)
            : (i=ua
                ? "google"
                : "")
        if api
            break
    }
    api := api = "microsoft" ? "bing" : api
    if (api="google" && InStr(uapi[1],"cn"))
        uapi[4]:=1
    loop, 2 ;ulang.MaxIndex()
    {
        j:=A_Index
            , ulang[j]:=InStr(lans, "|" ulang[j] "|") ? ulang[j] : (ls%j%? ls%j%: ls)
    }
    start := A_TickCount
        , url := u%api% KeyWord
    if IsFunc("translateApi_" api)
        url := translateApi_%api%(KeyWord, uapi, ulang)
    else
        return
    ;~ sbox(api, url, uapi, ulang)
    WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    WebRequest.Open("GET", url)
    WebRequest.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8")
    WebRequest.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0")
    WebRequest.Send()
    result := WebRequest.ResponseText
    ObjRelease(WebRequest)
    ;~ WebRequest.Close()
    RegExMatch(result, "S)" reg%api%, txt)
    return txt1
}
translateApi_bing(paras*)
{
/*
http://api.microsofttranslator.com/v2/Http.svc/Translate?appId=74FE953EB48E1487E94F4BF9C425B6290FF2DA48&from=" . langfrom . "&to=" . langto . "&text=" . var
*/
    static host1:= "http://api.microsofttranslator.com/v2/Http.svc/Translate?appId=74FE953EB48E1487E94F4BF9C425B6290FF2DA48"
        , KeyWord:=1, apis:=2, lans:=3
        , a_api:=1, a_id:=2, a_key:=3, a_gcn:=4
        , tl:=1, sl:=2
    url := host1
        . "&from=" (paras[lans][sl] = "auto" ? "" : RegExReplace(paras[lans][sl], "S)-.*$"))
        . "&to=" (RegExReplace(paras[lans][tl], "S)-.*$"))
        . "&text=" paras[KeyWord]
    return url
}
translateApi_google(paras*)
{
/*
http://translate.google.cn/translate_a/single?client=at&sl=auto&tl=zh-CN&dt=t&q=
https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=en-gb&dt=t&q=
*/
    static host1:= "https://translate.google.cn/translate_a/single?client=at"
        , host2 := "https://translate.googleapis.com/translate_a/single?client=gtx"
        , KeyWord:=1, apis:=2, lans:=3
        , a_api:=1, a_id:=2, a_key:=3, a_gcn:=4
        , tl:=1, sl:=2
    url := (paras[apis][a_gcn] ? host1 : host2)
        . "&sl=" paras[lans][sl]
        . "&tl=" paras[lans][tl]
        . "&dt=t"
        . "&q=" paras[KeyWord]
    return url
}
translateApi_youdao(paras*)
{
/*
http://fanyi.youdao.com/fanyiapi.do?keyfrom=qqqqqqqq123&key=86514254&type=data&doctype=json&version=1.1&q=
*/
    static host1:= "http://fanyi.youdao.com/fanyiapi.do"
        , KeyWord:=1, apis:=2, lans:=3
        , a_api:=1, a_id:=2, a_key:=3, a_gcn:=4
        , tl:=1, sl:=2
    Sleep, 3000
    return host1
        . "?keyfrom=" (paras[apis][a_id]?paras[apis][a_id]:"0db48448f0101e58")
        . "&key=" (paras[apis][a_key]?paras[apis][a_key]:"8Vja0sAvE7VNtGe0mvsu91xMTfKYu7yy")
        . "&type=data"
        . "&doctype=json"
        . "&version=1.1"
        . "&q=" paras[KeyWord]
}
Uri_Enc(l:="")
{
    static enc:="Encode"
    if IsFunc("Uri_Encode")
        l := Uri_%enc%(l)
    l := RegExReplace(l,"S)""|`n|`r|\,", ". ")
    return l
}