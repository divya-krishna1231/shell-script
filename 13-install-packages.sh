#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33mm"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [$1 -ne 0]
    then
      echo -e "$2 ... $R FAILED $N"
    else
      echo -e "$2 ... $G success $N" 
    fi   
}

if [ $ID -ne 0 ]
then
   echo  -e "$R ERROR:: please run this script with root access $N"
     exit 1
else
     echo "yoy are root user"
fi

#echo "All arguments passed : $@ "

for package in $@

do
    yum list installed $package &>> $LOGFILE
    if [ $? -ne 0 ] 
    then 
       yum install $package -y
       VALIDATE $? "Installation of $package"
    else
       echo -e " $Package is already installed.. $Y SKIPPING $N"
    fi

done        



