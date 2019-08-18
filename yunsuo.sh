#!/bin/bash
#安装wget telnet
yum -y install wget telnet
function Ys_menu(){
echo "1.Start Yunsuo"
echo "2.Stop Yunsuo"
echo "3.Status Yunsuo"
echo "4.Restart Yunsuo"
read -p "Your choose" zxc
case $zxc in
    1)
     service yunsuo start
     ;;
    2)
     service yunsuo stop
     ;;
    3)
     service yunsuo status
     ;;
    4)
     service yunsuo restart
     ;;
    *)
     echo "None"
     exit
     ;;
esac
}
function Ys_install(){
rm -rf yunsuo_*
echo "32bit or 64bit"
read -p "1 for 32bit 2 for 64bit" bitn
case $bitn in
    1)
     wget https://download.yunsuo.com.cn/v3/yunsuo_agent_32bit.tar.gz
     tar xvzf yunsuo_agent_32bit.tar.gz
     chmod +x yunsuo_install/install
     yunsuo_install/install
     ;;
    2)
     wget https://download.yunsuo.com.cn/v3/yunsuo_agent_64bit.tar.gz
     tar xvzf yunsuo_agent_64bit.tar.gz
     chmod +x yunsuo_install/install
     yunsuo_install/install
     ;;
esac
read -p "Enter Username:" ysuser
read -p "Enter Passwd" yspass
/usr/local/yunsuo_agent/agent_smart_tool.sh /usr/local/yunsuo_agent/agent_smart_tool.sh -u ${ysuser} -p ${yspass}
}
function First(){
echo "1.Install Yunsuo"
echo "2.Uninstall Yunsuo"
echo "3.Yunsuo Menu"
echo "Enter others to exit"
read -p "Your choose" abc
case $abc in
    1)
     Ys_install
     ;;
    2)
     /usr/local/yunsuo_agent/uninstall
     ;;
    3)
     Ys_menu
     ;;
    *)
     echo "None"
     exit
     ;;
esac
}
First
