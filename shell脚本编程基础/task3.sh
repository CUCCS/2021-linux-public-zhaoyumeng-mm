#!/usr/bin/env bash
function help {
    echo "-h                 show this Help Document"
    echo "-o                 Statistics of the total number of visits to the source host top 100 and corresponding to each"
    echo "-i                 Count the total number of visits to the source host top 100 IP and the corresponding IP"
    echo "-u                 Statistics of the most frequently accessed URLs top 100"
    echo "-r                 The occurrence times and corresponding percentage of different response status codes were counted"
    echo "-4                 The top 10 URLs corresponding to different 4xx status codes and the total number of occurrences were counted respectively"
    echo "-n                 Given URL output top 100 access source host"
}
function host {
    awk -F "\t" '
    $1!="host"{
        host[$1]++
    }END{
         for(i in host) {
            printf("%s %d\n",i,host[i]);
            } 
    }' web_log.tsv | sort -g -k 2 -r | head -100
}
function ip {
    awk -F "\t" '
    $1!="host"{
        if(match($1, /^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*$/)) {
            host[$1]++;
            }
    }END{
        for(i in host) {
            printf("%s %d\n",i,host[i]);
            } 
    }' web_log.tsv | sort -g -k 2 -r | head -100
}
function url {
    awk -F "\t" '
    $5!="url"{
        url[$5]++
    }END{
         for(i in url) {
            printf("%s %d\n",i,url[i]);
            } 
    }' web_log.tsv | sort -g -k 2 -r | head -100
}
function response {
    awk -F "\t" 'BEGIN{
    total=0;
} 
$6!="response"{
    response[$6]++;
    total++
}END{
    for(i in response) {
            printf("%s %d %f\n",i,response[i],response[i]*100.0/total) ;
            } 
}' web_log.tsv
}
function 4xx {
    awk -F "\t" '
    $6!="response" {
         if($6=="403") code[$5]++;}
    END { 
        for(i in code) {
            printf("%s\t%d\n",i,code[i]);} }
    ' web_log.tsv | sort -g -k 2 -r | head -10
    echo "-------------------------------------"
    awk -F "\t" '
    $6!="response" {
         if($6=="404") code[$5]++;}
    END { 
        for(i in code) {
            printf("%s\t%d\n",i,code[i]);;} }
    ' web_log.tsv | sort -g -k 2 -r | head -10
}
function index {
    awk -F "\t" '
    $5!="url"{
        if($5=="'"$1"'")
        host[$1]++
    }END{
         for(i in host) {
            printf("%s %d\n",i,host[i]);
            } 
    }' web_log.tsv | sort -g -k 2 -r | head -100
}
if [ "$1" != "" ];then #判断是什么操作
    case "$1" in
        "-o")
            host 
            exit 0
            ;;
        "-i")
            ip 
            exit 0
            ;;    
        "-u")
            url
            exit 0
            ;;
        "-r")
            response
            exit 0
            ;;
        "-h")
            help
            exit 0
            ;;
        "-4")
            4xx
            exit 0
            ;;
        "-n")
            index "$2"
            exit 0
            ;;
    esac
fi