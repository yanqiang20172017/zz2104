#!bin/bash  
  
PRONUM=10                # 进程个数  
  
tmpfile="$$.fifo"        # 临时生成管道文件  
mkfifo $tmpfile  
exec 6<>$tmpfile  
rm $tmpfile  
  
for(( i=0; i<$PRONUM; i++ ))  
do  
        echo "init."  
done >&6  
  
for(( i = 0; i < ${count}; i++ ))  
do  
        read line  
        #echo $line  
        {  
                commands  
                echo "line${i} finished."  
        } >&6 &  
done <&6  
  
wait  
