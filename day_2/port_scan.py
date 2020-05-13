
'''
// ===============================
// AUTHOR           :        Ighor Tavares (@sum_b0dy)
// PURPOSE          :        30DaysSecurity Project
// DAY              :        DAY - 2
// SPECIAL NOTES    :        Feel free to use this script. Give me a shout-out if you do so :P (if you feel nice of course)
// ===============================

'''
import socket
import sys
import subprocess
from datetime import datetime


# clear shell
subprocess.call('clear',shell=True)

# create selection menu

def runScanner(host,port):

    targetIP = socket.gethostbyname(host)

    print("-"*60)
    print("Scanning target host: {}".format(targetServer))
    print("-"*60)

    get_time = datetime.now()
    #range of ports

    try:
        for port in range(1,port):
            mysock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            result = mysock.connect_ex((targetIP,port))

            if result == 0:
                print("Port {}:  OPEN".format(port))
            mysock.close()

    except KeyboardInterrupt:
        print("\nYou pressed CTRL+C")
        sys.exit()

    except socket.gaierror:
        print("Hostname not resolved... Exiting....")
        sys.exit()

    except socket.error:
        print("Failed connect to the server")
        sys.exit()

    get2_time = datetime.now()
    f_time = get2_time - get_time

    print("Scanning done :{}".format(f_time))



print("""
    (1) - Normal Scan
    (2) - Range Scan
    (3) - One Port Scan
""")


get_ans = input("Select: ")

if get_ans == "1":
    targetServer = input("Enter host: ")
    runScanner(targetServer, 1025)
elif get_ans == "2":
    continue
    


