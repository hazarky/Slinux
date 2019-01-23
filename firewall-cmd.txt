//Written by Kordell Hutchins
//Date written: 1/22/19
 Here is a TLDR guide to firewall-cmd or firewalld(version 0.5.3).
firewall-cmd is a dynamic Unix based firewall that uses zone-based principles.

It is important that if you are setting rules that you want to be non-volatile for your firewall, you must type "--permanent" after the command "firewall-cmd" in order for
the rules to be permanent without having your rules being wiped once the
firewall reloads.
#
# Zones from least to most trusted
#

drop
block
public
external
internal
dmz
work
home
trusted

#To start Firewall-cmd type:
sudo systemctl start firewalld
#To stop Firewall-cmd, type:
sudo systemctl stop firewalld
#To restart firewall-cmd without cutting connections type:
sudo firewall-cmd --reload
#To restart firewall-cmd and cut connections, type:
sudo firewall-cmd --completely-reload

#
# ZONES
#
#To list all zones, type:
sudo firewall-cmd --list-all-zones
#To set a particular zone as default, type:
sudo firewall-cmd --set-default-zone=[zone]

#
# PANIC
#
#In situations that you need to block everything, type:
sudo firewall-cmd --panic-on
#to turn it off, type:
sudo firewall-cmd --panic-off
#to see the status of the panic mode, type:
sudo firewall-cmd --query-panic
**You can also simplify commands for  multiple ports or services by putting the
"{}" symbols around them. (i.e. --add-port={123/tcp,456/udp,...}**
#
# SERVICES
#
#To list the current services on the default zone, type:
sudo firewall-cmd --list-services
#to list services on a particular zone, type:
sudo firewall-cmd --zone=[zone name] --list-services
#To add a service to a particular zone, type:
sudo firewall-cmd --zone=[zone name] --add-service=[service name]
#To remove a service to a particular zone, type:
sudo firewall-cmd --zone=[zone name] --remove-service=[service name]
#
# PORTS
#
#To add a port to a particular zone, type:
sudo firewall-cmd --zone=[zone name] --add-port=[port #/tcp or udp]
#to remove a port ot a particular zone, type:
sudo firewall-cmd --zone=[zone name] --remove-port=[port #/tcp or udp]
#To forward traffic from one port to another to a specific address, type:
sudo firewall-cmd -add-forward-port=port=[the port # you want to listen to]:proto=[tcp or udp]:toport=[the port that you want the traffic redirected to]:toaddr=[ip address]
**for add a particular range of ports to the zone, just type in the first digit
of the range and the last digit of the range. Then separate them with the dash
symbol.(i.e. --add-port={120-125/tcp}**
#
# RICH RULES
#
#To list all current rich rules, type:
sudo firewall-cmd --list-rich-rules
#To see if a particular rich rule has been added to the zone, type:
sudo firewall-cmd --zone=[zone name] --query-rich-rule='[rule family="[ipv4 or ipv6]" source address="[source address]"  [accept, drop, or reject]]'
#To add a particular rich rule, type:
sudo firewall-cmd --zone=[zone name] --add-rich-rule='[rule family="[ipv4 or ipv6]" source address="[source address]"  [accept, drop, or reject]]'
#To remove a particular rich rule, type:
sudo firewall-cmd --zone=[zone name] --remove-rich-rule='[rule family="[ipv4 or ipv6]" source address="[source address]"  [accept, drop, or reject]]'
#
# INTERFACES
#
#To list all available interfaces on the default zone, type:
sudo firewall-cmd --list-interfaces
#To list all available interfaces on a particular zone, type:
sudo firewall-cmd --zone=[zone name] --list-interfaces
#To add a interface on a particular zone, type:
sudo firewall-cmd --zone=[zone name] --add-interface=[interface name]
#To remove a interface on a particular zone, type:
sudo firewall-cmd --zone=[zone name] --remove-interface=[interface name]
#To get the zone of a particular interface, type:
sudo firewall-cmd --get-zone-of-interface [interface name]
#To change an interface of a particular zone, type:
sudo firewall-cmd --zone=[zone name] --change-interface=[interface name]
#
# CUSTOM
#

Additional things you can do with Firewalld is add/edit  services, helpers, icmptypes, and zones by changing some of the contents inside the folder "/etc/firewalld". One of the most quickest ways is by using the copy command,"cp",  from the folder "/usr/lib/firewalld" to the particular subfolder of choice in "/etc/firewalld".
(i.e. cp /usr/lib/firewalld/services/mysql.xml /etc/firewalld/services)
