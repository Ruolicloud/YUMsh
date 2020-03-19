#!/bin/bash
Downurl='https://raw.githubusercontent.com/Ruolicloud/YUMsh/master'
uptime=`curl -sSL https://raw.githubusercontent.com/Ruolicloud/YUMsh/master/yumupdate.txt`
system=`rpm -q centos-release|cut -d- -f3`
function Finish(){
yum clean all
yum makecache
clear
echo "Finish"
echo "If you want to run again"
echo "You can enter:yumsh"
}
#快捷启动
rm -rf $0
wget $Downurl/yum.sh -O /usr/bin/yumsh
chmod -R 777 /usr/bin/yumsh
#备份原YUM
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
clear
echo "Shell update on ${uptime}"
echo "Written by Ruoli"
echo "1 --- Aliyun YUM"
echo "2 --- Wangyi-163 YUM"
echo "3 --- Itzmx YUM"
echo "4 --- Return YUM"
echo "If you want to run again"
echo "You can enter:yumsh"
read -p "Please choose:" yfrom
case $yfrom in
     1)
      wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-${system}.repo
      Finish
      ;;
     2)
      wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS${system}-Base-163.repo
      Finish
      ;;
     3)
      wget -O /etc/yum.repos.d/CentOS-Base.repo http://github.itzmx.com/1265578519/mirrors/master/CentOS/CentOS${system}-Base-itzmx.repo
      Finish
      ;;
     4)
      rm -rf /etc/yum.repos.d/CentOS-Base.repo
      mv /etc/yumrepos.d/CentOS-Base.repo.bak /etc/yum.repos.d/CentOS-Base.repo
      Finish
      ;;
     *)
      echo "None"
      mv /etc/yum.repos.d/CentOS-Base.repo.bak /etc/yum.repos.d/CentOS-Base.repo
      echo "If you want to run again"
      echo "You can enter:yumsh"
      exit
      ;;
esac
