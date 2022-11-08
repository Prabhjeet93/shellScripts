#!/bin/bash

url=$1

if [ ! -d "$url" ];then
	mkdir $url
fi

if [ ! -d "$url/recon" ];then
	mkdir $url/recon
fi


echo "###################################################################"
echo " "

echo "Finding the Subdomains for the $url" 
echo " "

echo "###################################################################"

assetfinder $url > $url/recon/asset.txt
cat $url/recon/asset.txt | grep $1 > $url/recon/finalasset.txt
rm $url/recon/asset.txt


echo "###################################################################"
echo " "

echo "Bye bye bye bye bye We are done." 
echo " "

echo "###################################################################"

echo "###################################################################"
echo " "

echo "AMASS       Finding the Subdomains for the $url" 
echo " "

echo "###################################################################"

#amass enum -d $url > $url/recon/f.txt
#sort -u $url/recon/f.txt >> $url/recon.finalasset.txt
#rm $url/recon/f.txt


echo "###################################################################"
echo " "

echo "Running httprobe to check ALive domains $url" 
echo " "

echo "###################################################################"

cat $url/recon/finalasset.txt | sort -u | httprobe -s -p https:443 | sed 's/https\?:\/\///' | tr -d ':443' >> $url/recon/Alive.txt
