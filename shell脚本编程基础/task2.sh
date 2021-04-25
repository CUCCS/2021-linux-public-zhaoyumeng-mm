#!/usr/bin/env bash
function help {

    echo "-r                 Count the number and percentage of worldcupplayerinfo in different age ranges (under 20 years of age, 20-30 years of age, over 30 years of age)"
    echo "-p                 Count the number and percentage of worldcupplayerinfo in different field positions"
    echo "-n                 Who is the player with the longest name? Who is the player with the shortest name? "
    echo "-a                 Who is the oldest player? Who is the youngest player? "
    echo "-h                 show this Help Document"
}
function comRange {
    #awk数据流处理工具 使用-F来设置定界符（默认为空格）\t表示一个制表符
    awk -F "\t" 'BEGIN{ 
        young=0;middle=0;old=0;total=0;} 
        $6!="Age"
        {    
        if($6<20) young++;
        else if($6<=30 && $6>=20) middle++;
        else old++;
        total = total + 1;
        }
        END{
        printf("under 20 years of age: %d %f%%\n",young,young*100.0/total);
        printf("20-30 years of age: %d %f%%\n",middle,middle*100.0/total);
        printf("over 30 years of age: %d %f%%\n",old,old*100.0/total);
        }' worldcupplayerinfo.tsv
}
function position {
    awk -F "\t" 'BEGIN{
        Goalie=0;Defender=0;Midfielder=0;Forward=0;total=0;}
        $5!="Position"{
            if($5=="Goalie") {Goalie++;}
        else if($5=="Midfielder"){Midfielder++;}
        else if($5=="Defender"){Defender++;}
        else if($5=="Forward"){Forward++;}
        total = total+1;
    }END{       
        printf("Goalie: %d %f%%\n",Goalie,Goalie*100.0/total);
        printf("Defender: %d %f%%\n",Defender,Defender*100.0/total);
        printf("Midfielder: %d %f%%\n",Midfielder,Midfielder*100.0/total);
        printf("Forward: %d %f\n%%",Forward,Forward*100.0/total);
    }' worldcupplayerinfo.tsv
}
function name {
    awk -F "\t" 'BEGIN{
        short=10000;long=0} 
        $9!="Player"{
        l=length($9);
        name[$9]=l;
        if(l>long) long = l;
        if(l<short) short=l;
    }END{
        for(i in name) {
                if(name[i]==long) printf("The longest name is %s\n", i);
                if(name[i]==short) printf("The shortest name is %s\n", i);               
    }
    }' worldcupplayerinfo.tsv
}
function age {
    awk -F "\t" 'BEGIN{
        small=10000;big=0
    } 
    $6!="Age"{
        name[$9]=$6
        if($6>big) big=$6
        if($6<small) small=$6
    }END{
        for (i in name){
        if(name[i]==big) printf("the biggest age is %d,his name is %s\n",big,i);
        if(name[i]==small) printf("the smallest age is %d,his name is %s\n",small,i)}
    }' worldcupplayerinfo.tsv
}
if [ "$1" != "" ];then #判断是什么操作
    case "$1" in
        "-r")
            comRange 
            exit 0
            ;;
        "-p")
            position 
            exit 0
            ;;    
        "-n")
            name
            exit 0
            ;;
        "-a")
            age
            exit 0
            ;;
        "-h")
            help
            exit 0
            ;;
    esac
fi