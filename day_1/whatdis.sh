#! /bin/bash


#colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'


#check conditional
if [ $# -ne 1 ] ; then
    echo "USAGE $0 <file>" >&2
    exit 1 
fi

#checking dependencies
echo ""
check_binwalk=$(command -v binwalasdk)
if [ -z $check_binwalk ] ; then 
    echo -e "[${RED}-${NC}] ${RED}Binwalk${NC}"
    echo -e "Please, install binwalk"

    exit 1
fi

#get initial info

echo ""
file_type=$(file $1 | cut -d " " -f 2,3) 


echo "=====FILE TYPE====="
echo -e "${GREEN} $file_type ${NC} "

echo ""
echo "===== STRINGS ======"

get_string=$( strings $1 | grep -e "ctf" -e "CTF" -e "flag" -e "FLAG")

if [ -z "$get_string" ] ; then
    echo -e "${RED}No interesting strings found${NC}"
fi 
echo  -e "${GREEN} $get_string ${NC}"


echo "===== HEADERS ====="
echo -e ${GREEN}
xxd $1 | head -n 3
echo -e ${NC}
echo ""
echo "===== SNEAKY PEAK ====="

echo -e ${GREEN}
binwalk $1
echo -e ${RED}





