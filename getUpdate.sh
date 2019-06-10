dingyueAdd="https://jiyou.us/modules/servers/V2raySocks/osubscribe.php?sid=11550&token=NpE2FMfy77BL"
rm dingyueAll.base64
rm dingyueServers
rm serversVmess*

doTouchJson()
{
	#in=serverVmessaa.config
	address=`jq ".add" $1`
	uuid=`jq ".id" $1`
	port=`jq ".port|tonumber" $1`
	cfgfile=`jq ".ps|tostring" $1`
	echo "Point:$cfgfile address:$address id:$uuid port:$port"
	#jq 'setpath(["address"];$add) v2ray.config
	jq 'setpath(["outbounds",0,"settings","vnext",0,"address"];'$address')' v2ray.config > $cfgfile.json
	jq 'setpath(["outbounds",0,"settings","vnext",0,"port"];'$port')' v2ray.config > $cfgfile.json
	jq 'setpath(["outbounds",0,"settings","vnext",0,"users",0,"id"];'$uuid')' v2ray.config > $cfgfile.json
}
touch dingyueAll.base64
curl -l $dingyueAdd -o  dingyueAll.base64
touch dingyueServers
base64 -d dingyueAll.base64 >>dingyueServers
#cat dingyueServers
split -l 1 dingyueServers serversVmess
if [ -a serversVmessaa ];then
    sed -i "s/vmess:\/\///g" serversVmessaa
	base64 -d serversVmessaa >serverVmessaa.config
	doTouchJson "serverVmessaa.config"
else
   echo "serverssVmessaa not exit"
fi
if [ -a serversVmessab ];then
    sed -i "s/vmess:\/\///g" serversVmessab
	base64 -d serversVmessab >serverVmessab.config
	doTouchJson "serverVmessab.config"
fi
if [ -a serversVmessac ];then
    sed -i "s/vmess:\/\///g" serversVmessac
	base64 -d serversVmessac >serverVmessac.config
	doTouchJson "serverVmessac.config"
fi
if [ -a serversVmessad ];then
    sed -i "s/vmess:\/\///g" serversVmessad
	base64 -d serversVmessad >serverVmessad.config
	doTouchJson "serverVmessad.config"
fi
