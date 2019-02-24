#!/usr/bin/env python

from time import sleep
import random
menuChoice = 0;
choice = "";
DotNames = ["N_D1","N_D2","E_D1","E_D2","S_D1","S_D2","W_D1","W_D2"]
DotFreqs = ["2.405","2.415","2.425","2.420","2.445","2.435","2.430","2.450"]
DotVolts = ["3.53","3.48","2.95","3.04","3.55","3.53","2.91","2.97"]

def isfloat(value):
  try:
    float(value)
    return True
  except:
    return False

def ScanForDots():
    print("Traffic Dot Scanner".center(40, "-") )
    print("-#--"+"Name".center(10, "-")+"Freq".center(10, "-")+"Volt".center(10, "-") )
    #for i in range(0, 8):
    randomRange = range(len(DotNames))
    random.shuffle(randomRange)
    ii = 0
    for i in randomRange:
        sleep((random.triangular(0,1 ) ) )
        print("("+str(ii)+"):"+CreateDot(i) )
        ii+=1

def CreateDot(i):
    output = ""
    output+=DotNames[i].center(10, " ")
    output+=DotFreqs[i].center(10, " ")
    output+=DotVolts[i].center(10, " ")
    return output

def EditDOTfreq():
    print("Traffic Dot Editor".center(40, "-") )
    choice = raw_input("Enter the Traffic DOT name: ")
    if choice in DotNames:
        dotChoice = DotNames.index(choice)
        print("Current Frequency of "+choice+" is: "+DotFreqs[dotChoice])
        desiredFrequency = raw_input("Enter the new frequency: ")
        if(isfloat(desiredFrequency)):
            if float(desiredFrequency) < 2.483 and float(desiredFrequency) > 2.400:
                if desiredFrequency not in DotFreqs:
                    DotFreqs[dotChoice] = desiredFrequency
                    print("Successfully set "+choice+" frequency to "+DotFreqs[dotChoice])
                else:
                    print("Another DOT is already on this frequency")
            else:
                print("Frequency is invalid!")
        else:
            print("Not a number")
    else:
        print("DOT name not found")

def EditDOTname():
    print("Traffic Dot Editor".center(40, "-") )
    choice = raw_input("Enter the Traffic DOT name: ")
    if choice in DotNames:
        dotChoice = DotNames.index(choice)
        desiredName = raw_input("Enter the new name: ")
        DotNames[dotChoice] = desiredName
        print("DOT is now named "+DotNames[dotChoice])  
    else:
        print("DOT name not found")

def RebootDot():
    print("Traffic Dot Editor".center(40, "-") )
    choice = raw_input("Enter the Traffic DOT name: ")
    if choice in DotNames:
        dotChoice = DotNames.index(choice)
        print("Rebooting "+DotNames[dotChoice])
        sleep((random.triangular(2,4 ) ) )
        print("Reboot for "+DotNames[dotChoice]+" Has completed")
        sleep(1)
    else:
        print("DOT name not found")   
    
while menuChoice == 0:
    print("Traffic Dot Controller".center(40, "-") )
    print("(1) Scan for Traffic DOTS")
    print("(2) Edit DOT Frequency")
    print("(3) Edit DOT name")
    print("(4) Reboot DOT")
    print("(5) EXIT")
    choice = raw_input("Enter the choice number (1-5) ")
    if(choice == "1"):
        ScanForDots();
    if(choice == "2"):
        EditDOTfreq();
    if(choice == "3"):
        EditDOTname();
    if(choice == "4"):
         RebootDot();
    if(choice == "5"):
        print("----------------------------------------")
        print("PROGRAM CLOSED")
        print("----------------------------------------")
        menuChoice = 1;
    if((DotFreqs[0]=="2.425" or DotFreqs[0]=="2.420" or DotFreqs[0]=="2.430" or DotFreqs[0]=="2.450")
    and(DotFreqs[1]=="2.425" or DotFreqs[1]=="2.420" or DotFreqs[1]=="2.430" or DotFreqs[1]=="2.450")
    and(DotFreqs[4]=="2.425" or DotFreqs[4]=="2.420" or DotFreqs[4]=="2.430" or DotFreqs[4]=="2.450")
    and(DotFreqs[5]=="2.425" or DotFreqs[5]=="2.420" or DotFreqs[5]=="2.430" or DotFreqs[5]=="2.450")
    and(DotFreqs[2]=="2.415" or DotFreqs[2]=="2.405" or DotFreqs[2]=="2.445" or DotFreqs[2]=="2.435")
    and(DotFreqs[3]=="2.415" or DotFreqs[3]=="2.405" or DotFreqs[3]=="2.445" or DotFreqs[3]=="2.435")
    and(DotFreqs[6]=="2.415" or DotFreqs[6]=="2.405" or DotFreqs[6]=="2.445" or DotFreqs[6]=="2.435")
    and(DotFreqs[7]=="2.415" or DotFreqs[7]=="2.405" or DotFreqs[7]=="2.445" or DotFreqs[7]=="2.435") ):
        print("MCA-BC12D29D")
        menuChoice = 1;
        

DotNames = ["N_D1","N_D2","E_D1","E_D2","S_D1","S_D2","W_D1","W_D2"]
DotFreqs = ["2.405","2.415","2.425","2.420","2.445","2.435","2.430","2.450"]
DotVolts = ["3.53","3.48","2.95","3.04","3.55","3.53","2.91","2.97"]


















