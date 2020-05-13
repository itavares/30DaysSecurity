#!/bin/bash



#===============================
#AUTHOR           :        Ighor Tavares (@sum_b0dy)
#PURPOSE          :        30DaysSecurity Project
#DAY              :        DAY - 3
#SPECIAL NOTES    :        Feel free to use this script. Give me a shout-out if you do so :P (if you feel nice of course)
#===============================

#give option menu
# 1 - encryp folder
# 2 - decrypt folder

# read -p "enter a folder: " -e path

# echo $path

enc_folder() {

read -p "Enter Folder to be Encrypted: " -e path
echo "Enter password: "
read -s pass

echo "Encrypting....."
tar -czvf ${path}.tar.gz $path

openssl enc -aes-256-cbc  -pbkdf2 -iter 20000 -in ${path}.tar.gz -out ${path}.dat -k $pass

rm -r $path 
rm ${path}.tar.gz
echo "Encryption done"
sleep 2

}

dec_folder() {
    read -p "Enter encrypted file (.dat): " -e path
    echo "Enter Password: "
    read -s pass

    folder_dec=$(echo $path | cut -d '.' -f1)
    echo "Decrypting..."
    openssl enc -d -aes-256-cbc -pbkdf2 -iter 20000 -in ${path} -out ${folder_dec}.tar.gz
    
    echo "Decryption done"
    sleep 2
}

show_menu() {

    clear
    echo "------------------"
    echo "  S E C - D I R"
    echo "------------------"
    echo "1. Encrypt Folder"
    echo "2. Decrypt Folder"
    echo "3. Exit"
}

read_options() {

    local choice
    read -p"Enter choice [1-3] " choice

    case $choice in
        1) enc_folder ;;
        2) dec_folder ;;
        3) exit 0;;
        *) echo -e "Error..." && sleep 1
    esac
}

#caches ctrl+c etc
trap '' SIGINT SIGQUIT SIGTSTP

while true 
do
    show_menu
    read_options
done