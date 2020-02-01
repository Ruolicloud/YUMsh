#!/bin/bash
#定制脚本
head="\033[32m"
foot="\033[0m"
clear
system=`rpm -q centos-release|cut -d- -f3`
bit=`rpm -q centos-release|cut -d. -f6`
echo -e "$head欢迎使用墨点一下VPS专用脚本$foot"
echo -e "$head感谢购买本互联产品$foot"
echo -e "$head====================$foot"
echo -e "系统版本为:Centos"${system}
echo -e "系统位数为:"${bit}
echo -e "$head1.WEB环境集合$foot"
echo -e "$head2.YUM更换$foot"
echo -e "$head====================$foot"
read -p "选择：" ch
case $ch in
	1)
		WEB
		;;
	2)
		mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
		wget -O /etc/yum.repos.d/CentOS-Base.repo http://github.itzmx.com/1265578519/mirrors/master/CentOS/CentOS${system}-Base-itzmx.repo
		yun clean all
		yum makecache
		;;
esac
function WEB(){
echo -e "$head1.Kangle环境搭建(默认为点点脚本kangle.pw)$foot"
echo -e "$head2.宝塔环境搭建(请确保为Centos7.x)$foot"
read -p "选择：" cho
case $cho in
	1)
		wget kangle.pw/install
		sh install
		rm -rf install
		;;
	2)
		if [[ $system != "6" ]]; then
			echo -e "$headCentos版本错误 请使用Centos6安装Kangle$foot"
			exit
		fi
		wget -O install http://kangle.pw/install
		sh install
		;;
esac
}
