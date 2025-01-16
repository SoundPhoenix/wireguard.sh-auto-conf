#welcome screen for the script
echo "               ______
                  .-"      "-.
                 /            \
                |              |
                |,  .-.  .-.  ,|
                | )(__/  \__)( |
                |/     /\     \|
      (@_       (_     ^^     _)
 _     ) \_______\__|IIIIII|__/__________________________
(_)@8@8{}<________|-\IIIIII/-|______WIREGUARD INSTALL____>
       )_/        \          /
      (@           `--------` jgs
      Script made by Tanner Schermerhorn (me@tannerschermerhorn.dev)"


#Check if the user is running the script in Linux
if [ "$(uname)=Linux"]; then
    echo "Linux OS detected"
else
    echo "This script is only for the Linux Operating System"
    exit 1
    fi

#Add wireguard.sh script below here and install curl if not already installed
if curl --version &> /dev/null/; then
    echo "curl is already installed on this machine"
    else 
    sudo apt install curl
read -p "Please press enter to continue with the install."
fi

#Ask user if they want to use wget or curl to install Wireguard
echo "How would you like to install Wireguard?"
echo "1. Use curl"
echo "2. Use wget"
read -p "Please enter the number of your choice: " choice
if [ $choice -eq 1 ]; then
    curl -O https://raw.githubusercontent.com/angristan/wireguard-install/master/wireguard-install.sh
    chmod +x wireguard-install.sh
    ./wireguard-install.sh
elif [ $choice -eq 2 ]; then
    wget https://raw.githubusercontent.com/angristan/wireguard-install/master/wireguard-install.sh
    chmod +x wireguard-install.sh
    ./wireguard-install.sh
else
    echo "Invalid choice. Please enter 1 or 2."
    exit 1
fi

#Check if wireguard is installed
if [ -x "$(command -v wg)" ]; then
    echo "Wireguard has been successfully installed!"
else
    echo "Wireguard has failed to install. Please try again."
    exit 1
    fi

