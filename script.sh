
echo -e "\033[44m###Enable Password Authentication ###\033[m"

# Backup the original SSH configuration file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Use sed to replace the line containing "PasswordAuthentication no" with "PasswordAuthentication yes"
sudo sed -i 's/#\?PasswordAuthentication\s*\(no\|yes\)/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Restart the SSH service to apply the changes
sudo service ssh restart

# Custom Shell Prompt
echo -e "\033[44m### Making Custom Shell Prompt ###\033[m"

cat <<EOF>>  /home/$USER/.bashrc

BRACKET_COLOR="\[\033[38;5;35m\]"
CLOCK_COLOR="\[\033[38;5;35m\]"
JOB_COLOR="\[\033[38;5;33m\]"
PATH_COLOR="\[\033[38;5;33m\]"
LINE_BOTTOM="\342\224\200"
LINE_BOTTOM_CORNER="\342\224\224"
LINE_COLOR="\[\033[38;5;248m\]"
LINE_STRAIGHT="\342\224\200"
LINE_UPPER_CORNER="\342\224\214"
END_CHARACTER="|"

tty -s && export PS1="$LINE_COLOR$LINE_UPPER_CORNER$LINE_STRAIGHT$LINE_STRAIGHT$BRACKET_COLOR[$CLOCK_COLOR\t$BRACKET_COLOR]$LINE_COLOR$LINE_STRAIGHT$BRACKET_COLOR[$JOB_COLOR\j$BRACKET_COLOR]$LINE_COLOR$LINE_STRAIGHT$BRACKET_COLOR[\H:\]$PATH_COLOR\w$BRACKET_COLOR]\n$LINE_COLOR$LINE_BOTTOM_CORNER$LINE_STRAIGHT$LINE_BOTTOM$END_CHARACTER\[$(tput sgr0)\] "

EOF

echo -e "\033[44m### Updating and upgrading softwares and kernels ###\033[m"

# Updating repos and upgrading all softwares and kernels

sudo apt update && sudo apt upgrade -y

echo -e "\033[44m### Installing Qemu Guest Agent ###\033[m"

# Installing Qemu Guest Agent

sudo apt install qemu-guest-agent -y

sudo systemctl enable --now qemu-guest-aagent.service

bash


