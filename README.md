# 健保卡網路服務元件 for Arch Linux

修改自 https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/mEventesting.htm 之 Linux(Ubuntu) 版本

* 把需要的東西放到對的地方
* 裝上對的東西
* 使用 systemd
* 把不需要的東西清掉

## 免責聲明

* 僅在 `5.5.8-arch1-1` 測試可用，不保證能在你的裝置上運作
* 僅修改 Install/Uninstall script 與 Service Unit，其餘程式皆來自官方，不保證能在你的裝置上運作

## 安裝

```
$ git clone https://github.com/kaiiiz/mLNHIICC_Setup.ArchLinux.git
$ sudo ./Install
```

## 使用

```
$ sudo systemctl start NHIICC
```

## 檢驗

沒有錯誤應該會在 7777 port 開啟 websocket

```
$ sudo netstat -tlnp
...
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
...
tcp        0      0 0.0.0.0:7777            0.0.0.0:*               LISTEN      46811/mLNHIICC
```

使用瀏覽器開啟 `file:///usr/local/share/NHIICC/html/ESample.html`

![](https://i.imgur.com/9k6KBan.png)

其餘問題排除參照 [健保卡元件_Linux(Ubuntu)安裝手冊.pdf](https://cloudicweb.nhi.gov.tw/cloudic/system/SMC/Document/%E5%81%A5%E4%BF%9D%E5%8D%A1%E5%85%83%E4%BB%B6_Linux(Ubuntu)%E5%AE%89%E8%A3%9D%E6%89%8B%E5%86%8A.pdf)

## 解除安裝

```
$ sudo ./UnInstall
```

## Caveat

Debug 時，注意 `iccert.nhi.gov.tw` 這個 domain name，他指向的地方是 `127.0.0.1`，請參照 `/etc/hosts` 設定

e.g. [eMask 口罩預購系統](https://emask.taiwan.gov.tw/msk/index.jsp) - 健保卡

![](https://i.imgur.com/pIppw74.png)
