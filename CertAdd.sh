#!/bin/bash

### Script installs root.cert.pem to certificate trust store of applications using NSS
### (e.g. Firefox, Thunderbird, Chromium)
### Mozilla uses cert8, Chromium and Chrome use cert9

###
### Requirement: apt install libnss3-tools
###


###
### CA file to install (CUSTOMIZE!)
###

certfile="./cert/NHIRootCA.crt"
certname="NHI Self Root CA"
certfile2="./cert/NHIServerCert.crt"
certname2="NHI Self Sign Server"

#     echo  ${certfile} "," '"'${certname}'"';
###
### For cert8 (legacy - DBM)
###

for certDB in $(find ~/ -name "cert8.db")
do
     echo  ${certDB};
    certdir=$(dirname ${certDB});
    sudo certutil -A -n "${certname}" -t "TCu,Cu,Tu" -i ${certfile} -d dbm:${certdir}
    sudo certutil -A -n "${certname2}" -t "P,," -i ${certfile2} -d dbm:${certdir}
done


###
### For cert9 (SQL)
###

for certDB in $(find ~/ -name "cert9.db")
do
#     echo  ${certDB};
    certdir=$(dirname ${certDB});
     echo ${certdir} "," ${certfile} "," "${certname}";
    sudo certutil -A -n "${certname}" -t "TCu,Cu,Tu" -i ${certfile} -d sql:${certdir}
    sudo certutil -A -n "${certname2}" -t "P,," -i ${certfile2} -d sql:${certdir}
done

