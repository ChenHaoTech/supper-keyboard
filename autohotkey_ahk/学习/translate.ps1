curl.exe -H "Content-Type: application/json" -X POST --data '{
	"q":"hello",
    "from":"auto",
    "to":"auto",
    "appkey": "0db48448f0101e58",
    "salt":"1539723811",
    "sign":"855F91708C45653747E2D19944092AF152A61B75B1AF70C327041B24E3CF7800",
    "signType":"v3",
    "curTime":"1558872685"
}'https://openapi.youdao.com/api > ./学习/log.html
