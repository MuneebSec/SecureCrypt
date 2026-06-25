#!/bin/bash
# SecureCrypt Global Installer

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
NC=$(tput sgr0)

# Check if run as root
if [ "$EUID" -ne 0 ]; then
    echo "${RED}Error: Please run this installer with sudo!${NC}"
    echo "Usage: sudo ./install.sh"
    exit 1
fi

# Check if crypt.sh exists in the current folder
if [ ! -f "crypt" ]; then
    echo "${RED}Error: crypt.sh not found in this directory!${NC}"
    exit 1
fi

echo "${YELLOW}Configuring permissions...${NC}"
chmod +x crypt

echo "${YELLOW}Installing SecureCrypt to /usr/local/bin/crypt ...${NC}"
# Copying and renaming to 'crypt' so user can just type 'crypt' instead of 'crypt.sh'
cp crypt /usr/local/bin/crypt

if [ $? -eq 0 ]; then
    chmod +x /usr/local/bin/crypt
    echo "${GREEN}======================================================${NC}"
    echo "${GREEN}  Installation Successful!${NC}"
    echo "${GREEN}======================================================${NC}"
    echo "You can now run the tool from ANYWHERE using the command:"
    echo "  ${YELLOW}crypt -h${NC}"
else
    echo "${RED}Installation failed. Please check system permissions.${NC}"
    exit 1
fi
