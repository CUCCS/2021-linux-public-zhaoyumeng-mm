#!/usr/bin/env bash
function help {

    echo "-q Q               compress jepg/jpg/JPG/JPEG(Q is the quality)"    #压缩
    echo "-r R               resize jpeg/png/svg(R is the rate)"
    echo "-w font_size       add your water mark"
    echo "-p text            add prefix for png/jpeg/jpg/svg/bmp"
    echo "-s text            add subfix for png/jpeg/jpg/svg/bmp"
    echo "-t                 convert png/svg to jpg"
    echo "-h                 give this help"
}
compress () {
        for filename in *; do
                fname=$(basename "$filename")   #获取没有路径的文件名
                ex="${fname##*.}" #从提取的不带路径的完整文件名中提取不带名称的文件扩展名
                if [ -f $filename ] &&  [ $ex = 'jpg' ] || [ $ex = 'jpeg' ] || [ $ex = 'JPG' ] || [ $ex = 'JPEG' ] ;then   # -f filename 如果 filename为常规文件，则为真  
                        echo $filename
                        convert ${filename} -quality "$1" "${filename}" #压缩
                        echo "${filename} is compressed successfully!"
                fi
        done
}

resize () {
        for filename in *; do
                fname=$(basename "$filename")   #获取没有路径的文件名
                ex="${fname##*.}" #从提取的不带路径的完整文件名中提取不带名称的文件扩展名
                if [ -f $filename ] &&  [ $ex = 'jpg' ] || [ $ex = 'jpeg' ] || [ $ex = 'JPG' ] || [ $ex = 'JPEG' ] || [ $ex = png ] || [ $ex = svg ];then   # -f filename 如果 filename为常规文件，则为真  
                        echo $filename
                        convert ${filename} -resize "$1" "${filename}" 
                        echo "${filename} is resized successfully!"
                fi
        done
}

watermark () {
        for filename in *; do
                fname=$(basename "$filename")   #获取没有路径的文件名
                ex="${fname##*.}" #从提取的不带路径的完整文件名中提取不带名称的文件扩展名
                if [ -f $filename ] &&  [ $ex = 'jpg' ] || [ $ex = 'jpeg' ] || [ $ex = 'JPG' ] || [ $ex = 'JPEG' ] || [ $ex = png ] || [ $ex = svg ];then   # -f filename 如果 filename为常规文件，则为真  
                        echo $filename
                        convert ${filename} -fill black -pointsize $1 -font helvetica -draw 'text 10,80 "zym" ' "${filename}" #在图像的10,80 位置采用全黑Helvetica字体写 
                        echo "${filename} is watermarked successfully!"
                fi
        done
}
Prefix () {
        for filename in *; do
                fname=$(basename "$filename")   #获取没有路径的文件名
                ex="${fname##*.}" #从提取的不带路径的完整文件名中提取不带名称的文件扩展名
                if [ -f $filename ] &&  [ $ex = 'jpg' ] || [ $ex = 'jpeg' ] || [ $ex = 'JPG' ] || [ $ex = 'JPEG' ] || [ $ex = png ] || [ $ex = svg ];then   # -f filename 如果 filename为常规文件，则为真  
                        echo $filename
                         mv "${filename}" "$1""${filename}"
                        echo "${filename} is prefixed successfully!"
                fi
        done
}
suffix () {
        for fulfilename in *; do
                filename=$(basename "$fulfilename")   #获取没有路径的文件名
                # echo $fname
                ex="${filename##*.}" #从提取的不带路径的完整文件名中提取不带名称的文件扩展名
                if [ -f $fulfilename ] &&  [ $ex = 'jpg' ] || [ $ex = 'jpeg' ] || [ $ex = 'JPG' ] || [ $ex = 'JPEG' ] || [ $ex = png ] || [ $ex = svg ];then   # -f filename 如果 filename为常规文件，则为真  
                        echo $fulfilename
                        fname="${filename%.*}"    #没有扩展名的文件名
                        newname=$fname$1"."$ex
                         mv "${fulfilename}" "${newname}"
                        echo "${fulfilename} is suffixed successfully!"
                fi
        done
}
function tras2jpg {
    for fulfilename in *; do
                filename=$(basename "$fulfilename")   #获取没有路径的文件名
                # echo $fname
                ex="${filename##*.}" #从提取的不带路径的完整文件名中提取不带名称的文件扩展名
                if [ -f $fulfilename ] && [ $ex = png ] || [ $ex = svg ];then   # -f filename 如果 filename为常规文件，则为真  
                        echo $fulfilename
                        fname="${filename%.*}"    #没有扩展名的文件名
                        newname=$fname".jpg"
                        convert "${fulfilename}" "${newname}"
                        echo "${fulfilename} is successful!"
                fi
        done
}

if [ "$1" != "" ];then #判断是什么操作
    case "$1" in
        "-q")
            compress "$2"
            exit 0
            ;;
        "-r")
            resize "$2"
            exit 0
            ;;
        "-w")
            watermark "$2" "$3"
            exit 0
            ;;
        "-p")
            Prefix "$2"
            exit 0
            ;;
        "-s")
            suffix "$2"
            exit 0
            ;;
        "-t")
            tras2jpg
            exit 0
            ;;
        "-h")
            help
            exit 0
            ;;
    esac
fi
