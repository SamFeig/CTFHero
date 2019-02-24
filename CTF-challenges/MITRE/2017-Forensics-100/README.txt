created 4 virtual hard disks in virtualbox
 ran: mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3 /dev/sdb /dev/sdc /dev/sdd --spare-devices=1 /dev/sde
 which put all the disks into raid 5
 mounted the disk with GParted
 Copied save.png onto the raided drive.

 Give disks 1, 3 and 4 to the competitors. They can solve it with only 3 of the 4. I tested it without drive 5.
 To reassemble wth 3 drives run:
 mdadm --create --assume-clean --level=5 --raid-devices=4 --size=19456 /dev/md0 /dev/sdb /dev/sdc /dev/sdd
 with the 3 disks as sdb, sdc, and sdd.
	
 mount the new disk and the file should be available. 

 MCA-flag is: MCA{RA1D3rs_0f_the_L0sT_bits}


