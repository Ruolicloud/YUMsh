#!/bin/bash
Downurl='https://gitee.com/RuoliCloud/YUMsh/raw/master'
uptime=$(curl -sSL https://gitee.com/RuoliCloud/YUMsh/raw/master/yumupdate.txt)
# system=$(cut /etc/redhat-release -b 22) 获取系统版本号 似乎已经失效
function Finish() {
  yum clean all
  yum makecache
  clear
  echo "Finish"
  echo "If you want to run again"
  echo "You can enter:yumsh"
  exit
}
function Aliyunchange () {
  case "${system}" in
    6)
      wget -O /etc/yum.repos.d/Centos-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-6.10.repo
    ;;
    7)
      wget -O /etc/yum.repos.d/Centos-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
    ;;
    8)
      wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo
      wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-archive-8.repo
    ;;
    *)
      echo "None for Aliyun"
    ;;
  esac
  Finish
}
function Wangyichange () {
  case "${system}" in
    6)
      wget -O /etc/yum.repos.d/Centos-Base.repo http://mirrors.163.com/.help/CentOS6-Base-163.repo
    ;;
    7)
      wget -O /etc/yum.repos.d/Centos-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
    ;;
    *)
      echo "None for Wangyi "
    ;;
  esac
  Finish
}
function Returnchange () {
  rm -rf /etc/yum.repos.d/CentOS-Base.repo
  mv /etc/yumrepos.d/CentOS-Base.repo.bak /etc/yum.repos.d/CentOS-Base.repo
  Finish
}
#快捷启动
rm -rf "$0"
wget $Downurl/"$0" -O /bin/yumsh
chmod -R 777 /bin/yumsh
#备份原YUM
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
#备份原Epel源
mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.bak
#删除多余Repo源
rm -rf /etc/yum.repos.d/*.repo
clear
echo "Shell updated on ${uptime}"
echo "Written by Ruoli"
echo "1 --- Aliyun YUM && Epel"
echo "2 --- Wangyi-163 YUM"
echo "3 --- Return YUM"
echo "If you want to run again"
echo "You can enter:yumsh"
read -p "Please choose:" yfrom
echo "Please enter system version number"
echo "Example Centos8 : you should enter 8"
echo "Centos9 : you should enter 9"
echo "Now bash only run on 8/9"
read -p "enter: " system
case $yfrom in
1)
  Aliyunchange
  ;;
2)
  Wangyichange
  ;;
3)
  Returnchange
  ;;
*)
  echo "None"
  mv /etc/yum.repos.d/CentOS-Base.repo.bak /etc/yum.repos.d/CentOS-Base.repo
  echo "If you want to run again"
  echo "You can enter:yumsh"
  exit
  ;;
esac
