#!/bin/bash
echo "Installing please wait..."
cp wireguard-logging.service /etc/systemd/system/wireguard-logging.service


cp wireguard-logging.sh /etc/wireguard/
cp rotate_wireguard_logs.sh /usr/local/bin/rotate_wireguard_logs.sh
sleep 5

chmod +x /usr/local/bin/rotate_wireguard_logs.sh
chmod +x /etc/wireguard/wireguard-logging.sh
systemctl enable wireguard-logging.service
systemctl start wireguard-logging.service
sudo su
(crontab -l ; echo "0 0 * * * /usr/local/bin/rotate_wireguard_logs.sh") 2>&1 | grep -v "no crontab" | sort | uniq | crontab -
echo "Installation Complete !"
echo "Please run ./create_client.sh to create new clients "
echo "Log files are located at /var/log/wireguard/"
