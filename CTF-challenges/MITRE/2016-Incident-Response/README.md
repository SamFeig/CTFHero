# 2016 Incident Response

This repo contains all of the information needed to solve the 4 challenges from the incident response categories.

## Challenge 1: PCAP Examination

### Description:

This challenge is the first of five scenario-based exercises falling under the following intrusion scenario:

1. One morning before the daily IT team meeting, Joseph Adams inadvertently installs malware posing as a software update onto his corporate Windows VM.  The malware beacons out to a Linux machine outside the corporate network and the waiting attacker uses Joe&#39;s Windows 7 VM as a pivot point to reach the rest of the internal, corporate network.
2. The attacker locates a Linux-based file server and uses credentials that Joe had stored in an unencrypted plaintext file to log in to the file server.
3. The attacker locates a Truecrypt file on the file server, exfiltrates the file, and replaces the original file with a second file that he/she has uploaded.
4. When Joe returns from his morning meeting, he notices the attacker is still connected to his VM.  He immediately logs in to the hypervisor, suspends the VMs, and retains the volatile memory (raw/DD) and virtual hard disk (VMDK) files from the affected machines for forensic analysis.
5. Later that afternoon, the attacker contacts the company&#39;s CIO Office and offers up the original file and password for ransom.
6. The corporate CIO would like the internal IR Team to investigate whether the exfiltrated Truecrypt file can be recovered without having to pay the ransom.

### Summary for White Cell:

For this challenge, competing teams will have to examine a PCAP file that was collected from the Workstation VM LAN&#39;s virtual network sensor.  The challenge flag will be the SHA-1 hash of the exfiltrated Truecrypt file.  Further, there is a clue to the password for the LUKS partition used in challenge #3/4 embedded in the PCAP (xkcd #936) and a clue to the intruder&#39;s identity (xkcd #1337).

File(s) Provided: [challenge1.pcap](https://drive.google.com/file/d/0B48Lv30KB1seSGQzc0ptT2w2SGc/view?usp=sharing)

### Suggested Tools/Solution Methods:

Use Wireshark to manually trace the TCP flows and extract the relevant files.

Option B: Use a Network Forensics Analysis Tool (NFAT), such as NetworkMiner, to visualize the hosts and the associated network flows, and then use it to carve out files from the PCAP file.  NOTE:  NetworkMiner requires the installation of Mono if running on Linux.

### Solution:

1. **I.**** Challenge Flag – This is the flag for the current challenge (i.e. challenge #1/5):**
  1. **a.** The challenge flag is the SHA-1 hash value of the extracted Truecrypt volume (filename: **pictures.zip** ).  NOTE: There are two files named **pictures.zip** —the second file is the file uploaded by the intruder.
  1. **b.** To find the challenge flag:
    1. **i.** Install Wireshark v2.x.  NOTE: This solution was created using Wireshark v2.02 on Ubuntu Desktop 16.04LTS (via **sudo apt-get install wireshark** ).
    2. **ii.** Load **challenge1.pcap** into Wireshark.
    3. **iii.** Use the display filter **tcp.port == 20 || tcp.port == 21** to display only the file transfers using FTP and FTP-DATA ports.
    1. **iv.** Select the first FTP-DATA packet whose length is 1514 (Frame #17995), right-click and select **Follow -&gt; TCP Stream**.  NOTE: The result should be a stream 4194kB in length and comprise 2907 client packets.
    2. **v.** Select **Raw** from the dropdown labeled &#39; **Show data as**&#39;, click **Save As…** , then save the file as **truecrypt.tc**.
    1. **vi.** Use a hashing application with SHA-1 support to determine the hash value of **truecrypt.tc.  ** NOTE: In this solution, the standard Linux **shasum** utility was used.

1. **II.**** Challenge XREF: None.**
2. **III.**** Identity Flag Components: None.**
3. **IV.**** Notes**
  1. **a.** The PCAP contains traffic to/from xkcd.com that contains clues.
    1. **i.** [http://xkcd.com/936/](http://xkcd.com/936/) is a reference to the CorrectHorseBatteryStaple password comic.  This is an indirect clue to the password used in Challenge #3.
    2. **ii.** [http://xkcd.com/1337/](http://xkcd.com/1337/) is a reference to the movie _Hackers_; the identity of the intruder is Dade Murphy, aka Zero Cool.
  2. **b.** While not necessary for any challenge within the scenario, the FTP stream contains the red herring password **thefilesareinthecomputer** , which is the password for the **fs\_admin** account on the Linux server.

## Challenge 2: Windows Volatile Memory Analysis

### Description:

This challenge is the second of five scenario-based exercises falling under the following intrusion scenario:

1. One morning before the daily IT team meeting, Joseph Adams inadvertently installs malware posing as a software update onto his corporate Windows VM.  The malware beacons out to a Linux machine outside the corporate network and the waiting attacker uses Joe&#39;s Windows 7 VM as a pivot point to reach the rest of the internal, corporate network.
2. The attacker locates a Linux-based file server and uses credentials that Joe had stored in an unencrypted plaintext file to log in to the file server.
3. The attacker locates a Truecrypt file on the file server, exfiltrates the file, and replaces the original file with a second file that he/she has uploaded.
4. When Joe returns from his morning meeting, he notices the attacker is still connected to his VM.  He immediately logs in to the hypervisor, suspends the VMs, and retains the volatile memory (raw/DD) and virtual hard disk (VMDK) files from the affected machines for forensic analysis.
5. Later that afternoon, the attacker contacts the company&#39;s CIO Office and offers up the original file and password for ransom.
6. The corporate CIO would like the internal IR Team to investigate whether the exfiltrated Truecrypt file can be recovered without having to pay the ransom.

### Summary for White Cell:

For this challenge, competing teams will have to examine the volatile memory image of the Windows VM that was used as the pivot point for the intrusion.  Examination of the in-memory Windows Registry will give evidence of the malware that was used during the intrusion (the challenge flag is the SHA-1 hash of the file name for the malware&#39;s persistence mechanism).  Further, the password of the logged in user (Joseph Adams) will match the password for the LUKS partition used in Challenge #3/4 of the intrusion scenario, and a portion of the scenario&#39;s identity flag is echoed in a cmd.exe window.

File(s) Provided: [challenge2.dd](https://drive.google.com/file/d/0B48Lv30KB1seREd2OUtSQ0RLZU0/view?usp=sharing)

### External Resources:

Volatility Framework 2.5: www.volatilityfoundation.org/#!releases/component\_71401

### Suggested Tools/Solution Methods:

Use the Volatility Framework.

### Solution:

1. **I.**** Challenge Flag – This is the flag for the current challenge (i.e. challenge #2/4).**
  1. The challenge flag is the SHA-1 hash value of the random Windows Registry Key containing the persistence mechanism for the implant callback.  The challenge flag is:

1.
  1. To find the challenge flag:
    1. **i.** Download the Volatility Framework v2.5 from the main repository.  NOTE: This solution was performed on Ubuntu Desktop 16.04LTS.
    2. **ii.** Using the **Win7SP1x86** profile, retrieve the address locations for the in-memory Registry hives.  At the command line, issue the command **&quot;vol.py --profile=Win7SP1x86 -f challenge2.dd hivelist&quot;** without the double quotes.

1.
  1.
    1. **iii.** Now, using the offset for Joseph Adams&#39;s **NTUSER.DAT** hive, retrieve the subkeys in the **CurrentVersion\Run** key.  At the command line, issue the command **&quot;vol.py --profile=Win7SP1x86 -f challenge2.dd printkey 0x931489c8 -K &#39;Software\Microsoft\Windows\CurrentVersion\Run&#39; &quot;** without the double quotes (the single quotes surrounding the Registry key name must be included).  The solution to this challenge is the name of the subkey, &#39;exWaMEoIW&#39;.

1.
  1.
    1. **i.** Use a hashing algorithm with SHA-1 support to determine the hash value of &#39;exWaMEoIW&#39;.  NOTE:  In this solution, the standard Linux **shasum** utility was used.  At the command line, execute the command **&quot;echo -n &#39;exWaMEoIW&#39; | shasum -a 1&quot;** without the double quotes.

1. **II.**** Challenge XREF: Challenge #3/5**
  1. **a.** The password for the LUKS-encrypted partitions in Challenge #3 is contained in the Windows volatile memory image.  Using the **mimikatz** plugin for the Volatility Framework, execute the command **&quot;vol.py --plugins={DIRECTORY CONTAINING MIMIKATZ PLUGIN} --profile=WinSP1x86 -f challenge2.dd mimikatz&quot;** without the double quotes.  The password for Joseph Adams is listed as **Correct!HorseBatteryStaple**.

1. **III.**** Identity Flag Components: 1/4 – value = &quot;None&quot;**
  1. **a.** The first of 4 pieces of the identity flag is contained in the Windows volatile memory image.  Using the **consoles** plugin for the Volatility Framework, execute the command **&quot;vol.py --profile=Win7SP1x86 -f challenge2.dd consoles&quot;** without the double quotes.  Embedded within the output is the echoed message &quot;there are NONE like me!&quot;  The word &quot;NONE&quot; represents the first piece of the identity flag.

## Challenge 3: Linux Deadbox Examination

### Description:

This challenge is the third of five scenario-based exercises falling under the following intrusion scenario:

1. One morning before the daily IT team meeting, Joseph Adams inadvertently installs malware posing as a software update onto his corporate Windows VM.  The malware beacons out to a Linux machine outside the corporate network and the waiting attacker uses Joe&#39;s Windows 7 VM as a pivot point to reach the rest of the internal, corporate network.
2. The attacker locates a Linux-based file server and uses credentials that Joe had stored in an unencrypted plaintext file to log in to the file server.
3. The attacker locates a Truecrypt file on the file server, exfiltrates the file, and replaces the original file with a second file that he/she has uploaded.
4. When Joe returns from his morning meeting, he notices the attacker is still connected to his VM.  He immediately logs in to the hypervisor, suspends the VMs, and retains the volatile memory (raw/DD) and virtual hard disk (VMDK) files from the affected machines for forensic analysis.
5. Later that afternoon, the attacker contacts the company&#39;s CIO Office and offers up the original file and password for ransom.
6. The corporate CIO would like the internal IR Team to investigate whether the exfiltrated Truecrypt file can be recovered without having to pay the ransom.

### Summary for White Cell:

For this challenge, competing teams will have to examine the hard disk images of a Linux virtual machine (VMDK format) for evidence of the intrusion.  The hard disk image files are all encrypted with LUKS using the same password as the user logged on to the Windows VM (Joseph Adams) from challenge #2.  The flag for this challenge is the SHA-1 hash of the employee database file.  Further, the overwritten Truecrypt file contains the second portion of the user&#39;s identity flag.

NOTE: The files necessary to build the Volatility Framework profile for challenge #4/4 (i.e. the System.map file and the module.dwarf file) will be found within the file system of this exercise.

File(s) Provided: [challenge3-boot.dd , challenge3-home.dd](https://drive.google.com/file/d/0B48Lv30KB1seMVNaVHlsbU12NU0/view?usp=sharing)

### External Resources:

Access to a Linux repository might be necessary to retrieve the **cryptsetup** package.

### Suggested Tools/Solution Methods:

Use the Linux utilities **fdisk**, **losetup**, and **mount** to manipulate the raw disk image.  Use the **cryptsetup** utility unlock the LUKS partition within the **challenge3.-home.dd** file.

Use the **mimikatz** plugin for the Volatility Framework to retrieve the password from the Windows volatile memory image given in challenge #2.

NOTE: This solution was performed entirely using Ubuntu 16.04LTS with LUKS and LVM support pre-installed.  Other Linux distributions might require these packages to be installed separately.

### Solution:

1. **I.**** Challenge Flag – This is the flag for the current challenge (i.e. challenge #3/4).**
  1. **a.** The challenge flag is the SHA-1 hash value of the **employee\_database.db** file stored in the **/home/fs\_admin/database** directory.  The challenge flag is:
1. **b.** To find the challenge flag:
1. **i.** Determine the partition offset of the encrypted **/home** partition within the **challenge3-home.dd** file.  Execute the command &quot; **fdisk -l -u ./challenge3-home.dd**&quot; without the double quotes.  NOTE: The cluster size is 512 bytes and the cluster offset of the only partition is 2048, indicating a byte offset of 1048576B (512bytes/cluster \* 2048 clusters).
1. **ii.** Mount the partition as a loopback device using the **losetup** utility.  Execute the command &quot; **sudo losetup -o 1048576 /dev/loop0 challenge3-home.dd**&quot; without the double quotes.
1. **iii.** Unlock the LUKS partition with the **cryptsetup** utility.  Execute the command &quot; **sudo cryptsetup luksOpen /dev/loop0 imgroot**&quot; without the double quotes.
1. **iv.** The user will now be prompted for the LUKS password, which was obtained from challenge #2 and hinted at in challenge #1.  REFER to the **XREF** section for instructions on obtaining the password.
2. **v.** Mount the partition manually using the **mount** utility or through the file explorer GUI.  For manual execution, execute the command &quot; **mount -t ext4 /dev/mapper/imgroot {user-defined mount point}**&quot; without the double quotes and with a valid directory designated as a mount point.
3. **vi.** Navigate to the **/fs\_admin/database** directory and execute the command &quot; **shasum -a 1 employee\_database.db**&quot; without the double quotes to retrieve the flag.
1. **II.**** Challenge XREF: #2/5**
  1. **a.** The password for the LUKS-encrypted partitions in Challenge #3 is contained in the Windows volatile memory image.  Using the **mimikatz** plugin for the Volatility Framework, execute the command **&quot;vol.py --plugins={DIRECTORY CONTAINING MIMIKATZ PLUGIN} --profile=WinSP1x86 -f challenge2.dd mimikatz&quot;** without the double quotes.  The password for Joseph Adams is listed as **Correct!HorseBatteryStaple**.
1. **III.**** Challenge XREF: #4/5**
  1. **a.** The files required to build a Linux profile for use in the Volatility Framework ( **System.map** and **module.dwarf** ) are present in the dd image files provided with challenge #3.
1. **i.** The System.map file (long filename:   **System.map-4.4.0-36-generic** ) is located in the **/boot** directory, which is contained in the **challenge3-boot.dd** file.  The file can be extracted by mounting the dd file as follows:
1. **1.** From the directory containing the challenge files, execute the command &quot; **fdisk -l -u challenge3-boot.dd**&quot; without the double quotes.  NOTE: The cluster size is 512 bytes and the cluster offset of the only partition is 2048, indicating a byte offset of 1048576B (512bytes/cluster \* 2048 clusters).
1. **2.** From the directory containing the challenge files, execute the command &quot; **sudo losetup -o 1048576 /dev/loop1 challenge3-boot.dd**&quot; without the double quotes.
1. **3.** Mount the partition manually using the **mount** utility or through the file explorer GUI.  For manual execution, execute the command &quot; **mount -t ext4 /dev/loop1 {user-defined mount point}**&quot; without the double quotes and with a valid directory designated as a mount point.
2. **4.** Extract the **System.map-4.4.0-36-generic** file from the mounted partition.
2. **IV.**** Identity Flag Components: 2/4 – value: &quot;COLD&quot;**
  1. **a.** The second of 4 pieces of the identity flag is contained in the LUKS encrypted partition.  From the **fs\_admin/database** directory, execute the command &quot; **cat pictures.zip**&quot; without the double quotes.  The output is the echoed message &quot;you are ice COLD!&quot;  The word &quot;COLD&quot; represents the second piece of the identity flag.
1. **V.**** NOTES**
  1. **a.** Within challenges 1 and 2 are hints to the LUKS password, if the challenge teams have issues with the Volatility Framework&#39;s **mimikatz** plugin.
    1. **i.** The PCAP file from challenge 1 contains links to, and image files from, http://xkcd.com/936/, which calls out the password **&quot;CorrectHorseBatteryStaple&quot;.**
    2. **ii.** Using the Volatility Framework&#39;s **iehistory** plugin on the Windows volatile memory image from challenge #2 will reveal that http://xkcd.com/936/ was visited as well.

## Challenge 4: Linux Volatile Memory Analysis

### Description:

This challenge is the fourth of five scenario-based exercises falling under the following intrusion scenario:

1. One morning before the daily IT team meeting, Joseph Adams inadvertently installs malware posing as a software update onto his corporate Windows VM.  The malware beacons out to a Linux machine outside the corporate network and the waiting attacker uses Joe&#39;s Windows 7 VM as a pivot point to reach the rest of the internal, corporate network.
2. The attacker locates a Linux-based file server and uses credentials that Joe had stored in an unencrypted plaintext file to log in to the file server.
3. The attacker locates a Truecrypt file on the file server, exfiltrates the file, and replaces the original file with a second file that he/she has uploaded.
4. When Joe returns from his morning meeting, he notices the attacker is still connected to his VM.  He immediately logs in to the hypervisor, suspends the VMs, and retains the volatile memory (raw/DD) and virtual hard disk (VMDK) files from the affected machines for forensic analysis.
5. Later that afternoon, the attacker contacts the company&#39;s CIO Office and offers up the original file and password for ransom.
6. The corporate CIO would like the internal IR Team to investigate whether the exfiltrated Truecrypt file can be recovered without having to pay the ransom.

### Summary for White Cell:

For this challenge, competing teams will have to recover the password for the exfiltrated Truecrypt file from a volatile memory dump (RAW DD image converted from VMEM).  Because the suggested solution will involve using the Volatility Framework, the challenge teams will have to build a Volatility profile for the particular Linux distribution/kernel; this necessitates pulling the necessary files (the System.map and the module.dwarf files) to build the profile from the Linux hard disk images from challenge #3.  The flag for this challenge is the SHA-1 hash of the employee tax database, which is contained in the Truecrypt volume.  Further, the Truecrypt file contains the last clue to the identity of the intruder in the form of an image file.

File(s) provided: [challenge4.dd](https://drive.google.com/file/d/0B48Lv30KB1seeE1BeG16SUtfRms/view?usp=sharing)

### External Resources:

Truecrypt 7.1a ( [https://www.grc.com/misc/truecrypt/truecrypt.htm](https://www.grc.com/misc/truecrypt/truecrypt.htm)).  For the purposes of this exercise, the x64 command line version was used with Ubuntu 16.04LTS.

### Suggested Tools/Solution Methods:

Use the Volatility Framework to examine the Linux volatile memory image.

Use the password found in volatile memory in conjunction with Truecrypt 7.1a to recover the flag from the Truecrypt file extracted from challenge #1.

### Solution:

1. **I.**** Challenge Flag – This is the flag for the current challenge (i.e. challenge #4/5).**
  1. **a.** The challenge flag is the SHA-1 hash value of the **employee\_tax\_database.db** file stored in the Truecrypt file originally exfiltrated as &quot; **pictures.zip**&quot;.  The challenge flag is:

  1. **b.** To find the challenge flag:
    1. **i.** Build the Linux profile for the Volatility Framework by creating a zip file containing the **module.dwarf** and the **System.map-4.4.0-36-generic** files, which can be found in the dd images from Challenge #3.  To create the zip file from the command line, navigate to the directory containing the extracted files and execute the command &quot; **zip linux-server.zip module.dwarf System.map-4.4.0-36-generic**&quot; without the double quotes.  NOTE: Instructions on extracting the two files is given in the **XREF** section of this document.
1. **ii.** Place the **linux-server.zip** file in the **volatility/plugins/overlays/linux** directory found under the **volatility/** installation directory.  NOTE: &quot;volatility&quot; is repeated twice in a row in the path.
1. **1.** To confirm the profile has been created successfully, execute the command &quot; **python vol.py --info**&quot; from the root of the **volatility** directory and check for the presence of the Linux profile.
1. **iii.** Using the **Linuxlinux-serverx64** profile, view the bash history for the logged on user session by executing the command &quot; **python vol.py --profile=Linuxlinux-serverx64 -f challenge4.dd linux\_bash**&quot; without the double quotes.  The password is given as **HackTheGibson!**
1. **iv.** Mount the Truecrypt file recovered in challenge #1 by executing the command &quot; **truecrypt -t truecrypt.tc ./mount**&quot; without the double quotes.  NOTE: This command assumes that **mount** is an available directory to use as a mount point within the same directory as the Truecrypt file.
1. **v.** Navigate to the mounted directory and execute the command &quot; **shasum -a 1 employee\_tax\_database.db**&quot; without the double quotes to retrieve the flag.
1. **II.**** Challenge XREF: #3/5**
1. **a.** The files required to build a Linux profile for use in the Volatility Framework ( **System.map** and **module.dwarf** ) are present in the dd image files provided with challenge #3.
1. **i.** The System.map file (long filename:   **System.map-4.4.0-36-generic** ) is located in the **/boot** directory, which is contained in the **challenge3-boot.dd** file.  The file can be extracted by mounting the dd file as follows:
1. **1.** From the directory containing the challenge files, execute the command &quot; **fdisk -l -u challenge3-boot.dd**&quot; without the double quotes.  NOTE: The cluster size is 512 bytes and the cluster offset of the only partition is 2048, indicating a byte offset of 1048576B (512bytes/cluster \* 2048 clusters).
1. **2.** From the directory containing the challenge files, execute the command &quot; **sudo losetup -o 1048576 /dev/loop1 challenge3-boot.dd**&quot; without the double quotes.
1. **3.** Mount the partition manually using the **mount** utility or through the file explorer GUI.  For manual execution, execute the command &quot; **mount -t ext4 /dev/loop1 {user-defined mount point}**&quot; without the double quotes and with a valid directory designated as a mount point.
2. **4.** Extract the **System.map-4.4.0-36-generic** file from the mounted partition.
2. **III.**** Identity Flag Components: 3/4 – value: &quot;CRASH&quot;**

The third of 4 pieces of the identity flag is contained in the **CO.jpg** file within the Truecrypt file.  Once the Truecrypt file is mounted, the image file can be opened to reveal that &quot;CRASH&quot; is the third value to the identity flag.

**NOTES**
**a.** The **linux\_truecryptpassphrase** plugin that is distributed with the Volatility Framework will not effectively retrieve the Truecrypt password from the Linux memory image.  In order to mitigate the incompatibility, the bash history was deliberately seeded with the Truecrypt volume&#39;s password.
