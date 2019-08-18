#!/bin/bash
function Finish(){
yum clean all
yum makecache
clear
echo "It's finish"
}
function First(){
clear
system=`rpm -q centos-release|cut -d- -f3`
#备份原YUM
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
echo "Which do you want to get?"
echo "1.Ali YUM"
echo "2.163 YUM"
echo "3.Itzmx YUM"
echo "4.Reduction YUM"
echo "or enter others to exit"
read -p "Please choose:" yfrom
case $yfrom in
     1)
      wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-${system}.repo
      ;;
     2)
      wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS${system}-Base-163.repo
      ;;
     3)
      wget -O /etc/yum.repos.d/CentOS-Base.repo http://github.itzmx.com/1265578519/mirrors/master/CentOS/CentOS${system}-Base-itzmx.repo
      ;;
     4)
      rm -rf /etc/yum.repos.d/CentOS-Base.repo /bin/yumsh-log
      mv /etc/yum.repos.d/CentOS-Base.repo.bak /etc/yum.repos.d/CentOS-Base.repo
      ;;
     *)
      echo "None"
      mv /etc/yum.repos.d/CentOS-Base.repo.bak /etc/yum.repos.d/CentOS-Base.repo
      exit
      ;;
esac
Finish
}
First