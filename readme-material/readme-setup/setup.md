# Setup notes


- Setup guide for VirtualBox on Windows

- Note that all of the project's scripts are adjusted to work on Linux OS

## Virtual Machine

1. Settings --> Region Language --> Enlgish (Canada)
2. Biderectional + Guest.iso
3. su + apt install sudo + usermod -aG sudo {user-name}   --> Restart VM
4. Download Vscode, open terminal, cd /Downloads, sudo dpkg -i {file-name}.deb
5. Install Docker: Run docker-install.sh


## Shell scripts

Give execution permissions:
    - chmod +x /path/to/yourscript.sh (The chmod, or change mode, command allows an administrator to set or modify a file's permissions)

Run script:
    - ./yourscript.sh