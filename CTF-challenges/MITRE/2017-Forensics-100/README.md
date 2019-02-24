# Advanced File Recovery

## How to Run
1. setup a linux VM and get the hard disk files onto it
the challenge was created using run: `mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3 /dev/sdb /dev/sdc /dev/sdd --spare-devices=1 /dev/sde` which put all the disks into raid 5

## How to Solve given 3 out of 4 disks

 1. run:  `mdadm --create --assume-clean --level=5 --raid-devices=4 --size=19456 /dev/md0 /dev/sdb /dev/sdc /dev/sdd` to make a raid 5 array assuming you don't use disk 5
 1. this assumes too that the 3 disks are sdb, sdc, and sdd.
 1. mount the new disk and the file should be available. 

# Flag

 MCA-flag is: MCA{RA1D3rs_0f_the_L0sT_bits}


