#!/bin/bash
yum -y install wget screen unzip
clear
read -p "输入y继续运行" abc
mkdir -p bds
if [ $abc != "y" ]; then
  exit
fi
bit=`getconf LONG_BIT`
if [ $bit = "32" ]; then
  wget -c http://pkgs.repoforge.org/axel/axel-2.4-1.el5.rf.i386.rpm
  rpm -ivh axel-2.4-1.el5.rf.i386.rpm
elif [ $bit = "64" ]; then
  wget -c http://pkgs.repoforge.org/axel/axel-2.4-1.el5.rf.x86_64.rpm
  rpm -ivh axel-2.4-1.el5.rf.x86_64.rpm
fi
cd bds
axel https://minecraft.azureedge.net/bin-linux/bedrock-server-1.12.0.28.zip
unzip bedrock-server-1.12.0.28.zip
echo "即将启动Screen 在启动后请手动输入LD_LIBRARY_PATH=../bedrock_server"
read -p "输入y以确定你看到以上信息" bcd
if [ $bcd != "y" ]; then
  sleep 20
  echo "脚本超时"
  cd
  rm -rf mcbds
  echo "请重新运行脚本"
  exit
fi
screen -S mcbds
