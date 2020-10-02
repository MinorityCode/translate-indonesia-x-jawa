#! /bin/bash
#####################################################
#			      Translate Indonesia x Jawa		 #
#	  Thanks To https://mongosilakan.net for the API #
#	           Copyright 2018 - NTB 4 World    	     #
#	     IG : @minoritycode_ -  FB : Muhammad Fadlan #
#####################################################
# LOG UPDATE :
# id-ID&to=jv-NG jv-NG&to=id-ID
# beta v1.0 : nothing (First Edition)
# update v1.5 : add input : ./file.sh word
# update v2.0 : add input  : echo -n "Masukkan kata : "
# Last update 03/10/2018 - 21:22
# update v2.0 : add input without +
# echo "jika ingin terjemahkan kalimat, spasi diganti dengan + (ex : Kamu+cantik)"
echo -n "Bahasa Indonesia to Jawa? [Y,n] : "
read input
if [[ $input == "Y" || $input == "y" ]]; then
    echo -n "Masukkan kata yang ingin di terjemahkan : "
	read teks
	curl=`curl -s "http://mongosilakan.net/api/v1/translate/translate" -H 'Origin: https://mongosilakan.net' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: application/json, text/plain, */*' -H 'Referer: https://mongosilakan.net/' -H 'Cookie: __utma=19314980.49552927.1537517823.1537517823.1537517823.1; __utmz=19314980.1537517823.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); _ga=GA1.2.49552927.1537517823; _gid=GA1.2.1324146535.1537517823; G_ENABLED_IDPS=google; PHPSESSID=ptu2n18q0fggfbefc7c80vv342; _gat=1' -H 'Connection: keep-alive' --data "from=id-ID&source=$teks&to=jv-NG" --compressed`
	# echo $curl
	grab=$( echo "$curl" | awk -F 'basic":"' {'print $2'} | cut -d '"' -f1)
	footer="[MinorityCode_ - Indonesia & Java translate]"
  if [[ $grab > 0 ]]; then
    printf "$teks => $grab | $footer.\n"
fi
else
    echo -n "lebokake tembung sing pengen di terjemahake : "
	read teks
	curl=`curl -s "http://mongosilakan.net/api/v1/translate/translate" -H 'Origin: https://mongosilakan.net' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: application/json, text/plain, */*' -H 'Referer: https://mongosilakan.net/' -H 'Cookie: __utma=19314980.49552927.1537517823.1537517823.1537517823.1; __utmz=19314980.1537517823.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); _ga=GA1.2.49552927.1537517823; _gid=GA1.2.1324146535.1537517823; G_ENABLED_IDPS=google; PHPSESSID=ptu2n18q0fggfbefc7c80vv342; _gat=1' -H 'Connection: keep-alive' --data "from=jv-NG&source=$teks&to=id-ID" --compressed`
	grab=$( echo "$curl" | awk -F 'basic":"' {'print $2'} | cut -d '"' )
	footer="[MinorityCode_ - Indonesia & Java translate]"
  if [[ $grab > 0 ]]; then
    printf "$teks => $grab | $footer.\n"
fi
fi
