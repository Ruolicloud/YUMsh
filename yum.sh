#!/bin/bash
#快捷运行 + 自动更新脚本
wget https://raw.githubusercontent.com/Ruolicloud/sh/master/yum.sh -O /bin/yumsh
chmod -R 777 /bin/yumsh
rm -rf $0
function Finish(){
yum clean all
yum makecache
clear
echo "It's finish"
echo "If you want to run again"
echo "You can enter:yumsh"
}
clear
uptime=`curl -sSL https://raw.githubusercontent.com/Ruolicloud/sh/master/yumupdate.txt`
system=`rpm -q centos-release|cut -d- -f3`
#备份原YUM
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
echo "Shell update on ${uptime}"
echo "Written by Ruoli"
yfrom=$1
case $yfrom in
     -a)
      wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-${system}.repo
      Finish
      ;;
     -w)
      wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS${system}-Base-163.repo
      Finish
      ;;
     -i)
      wget -O /etc/yum.repos.d/CentOS-Base.repo http://github.itzmx.com/1265578519/mirrors/master/CentOS/CentOS${system}-Base-itzmx.repo
      Finish
      ;;
     -r)
      rm -rf /etc/yum.repos.d/CentOS-Base.repo /bin/yumsh-log
      mv /etc/yumrepos.d/CentOS-Base.repo.bak /etc/yum.repos.d/CentOS-Base.repo
      Finish
      ;;
     *)
      echo "None"
      mv /etc/yum.repos.d/CentOS-Base.repo.bak /etc/yum.repos.d/CentOS-Base.repo
      echo "$0:usage: [-a]|[-w]|[-i]|[-r]"
      echo "[-a] --- Aliyun YUM"
      echo "[-w] --- Wangyi-163 YUM"
      echo "[-i] --- Itzmx YUM"
      echo "[-r] --- Return YUM"
      echo "If you want to run again"
      echo "You can enter:yumsh [-a/w/i/r/h]"
      exit
      ;;
esac
