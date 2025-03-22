# This scripts enables the setting in VirtualBox --> System --> Processor --> "Nested VT-x/AMD-V"

# Run this script in Windows Command Prompt
echo START

echo $(pwd)
echo $PWD

# Path: C:\Program Files\Oracle\VirtualBox>

# First passed argument
echo $1

echo END


# TODO:
#   - cd from the current directory into C:\Program Files\Oracle\VirtualBox
#   - VBoxManage modifyvm "VM-name-here" --nested-hw-virt on     -->      VBoxManage modifyvm "$1" --nested-hw-virt on

# VBoxManage modifyvm "new-vm4" --nested-hw-virt on