
'''
// ===============================
// AUTHOR           :        Ighor Tavares (@sum_b0dy)
// PURPOSE          :        30DaysSecurity Project
// DAY              :        DAY - 5
// SPECIAL NOTES    :        Feel free to use this script. Give me a shout-out if you do so :P (if you feel nice of course)
// ===============================

'''
import requests
import sys
import hashlib

def check_file(input_file):

    print("*"*30)
    print("Scanning File...")
    print("*"*30)
    url = 'https://www.virustotal.com/vtapi/v2/file/report'

    params = {'apikey': '<VIRUS TOTAL PUBLIC API HERE>', 'resource': input_file}

    response = requests.get(url, params=params)

    results = response.json()

    #Results for userside

    
    print("Total Scans {}".format(results['total']))
    print("Total Positives {}".format(results['positives']))

    if (results['total'] > 0):
        print("Summary: This indicates, {} Anti-virus detected this file as a virus/malware and it can be harmful".format(results['positives']))
    elif (results['total'] == 0):
        print("Summary: No Anti-virus software reported this file as possible threat.")
    else:
        print("no-value")

    avs = results['scans'].items()

    #print all AVs that reported positive
    print("="*30,"POSITIVE AVS","="*30)
    print("{:22}| {:20}".format("ANTI-VIRUS", "REPORT"))
    print("-"*46)
    for k,v in avs:
        if v['detected'] == True:
            
            print(" {:20} | {:20}".format(k,v['result']))



if __name__=="__main__":

    if (len(sys.argv) < 2):
        print("USAGE: {}  <file>".format(sys.argv[0]))
        sys.exit()

    in_file = sys.argv[1]
    file_hashed = hashlib.md5(open(in_file,'rb').read()).hexdigest()

    check_file(file_hashed)



    
