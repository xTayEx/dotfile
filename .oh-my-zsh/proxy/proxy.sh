# 获得hostIP
export hostIP=`grep -oP  "(\d+\.)+(\d+)" /etc/resolv.conf`
# 获得端口号=>这需要后台启动powershell，如果在意速度问题，建议直接设定成定值，以后少改动端口就行
export hostPort=`(powershell.exe Get-ItemProperty -Path "Registry::HKCU\Software\Microsoft\Windows\CurrentVersion\'Internet Settings'") | tail -n 13 | grep -oP '\d{4}'`
# 替换配置文件里设置代理那一行
sudo sed -i "115c http $hostIP $hostPort" /etc/proxychains.conf
