#welcome screen for the script
echo "
      ##############################################################
      #                 Wireguard Install Script!                  #
      #                                                            #
      #      This script will install Wireguard along with port    #
      #       Forwarding and IP Tables for your linux Machine.     #
      #                                                            #
      ##############################################################
      "
#Press enter to continue with script
read -p "Please press enter to continue." 

#Check if the user is running the script for debian systems
if [ -f /etc/debian_version ]; then
    echo "You are running a Debian based system."
else
    echo "This script is only for Debian based systems. Please run this script on a Debian based system."
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

#Ask user if they want to enable port forwarding and if so what port
read -p "Would you like to enable port forwarding? (Y/N):" choice
if [ $choice -eq Y ]; then
    echo "To enable port forwarding Please go to the directory /etc/
    and run nano sysctl.conf and read the instructions."
elif [ $choice -eq N ]; then
    echo "OK!"
else 
    echo "Invalid choice. Please enter Y or N"
    exit 1
fi

#Ask user what ip they would like to use for the ip tables 
read -p "What IP would you like to use for the IP tables? (X.X.X.X)" ip 
if [ $ip -eq X.X.X.X ]; then
    echo "Please enter a valid IP address."
    exit 1
else
    echo "OK!"
fi

