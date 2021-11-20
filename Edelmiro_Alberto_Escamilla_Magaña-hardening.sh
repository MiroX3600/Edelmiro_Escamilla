#! /bin/bash

#sudo yum update

#Ejemplo: Instalar y desinstalar programa{
#if (yum list -q installed tcpdump);
#then
#	sudo yum remove tcpdump
#	sudo yum install tcpdump -y
#	echo "Se ha removido tcpdump"
#else
#	sudo yum install tcpdump -y
#fi
#}

echo "....................SO version ........................................
								"
cat /etc/*release
echo "
	......................................................................"

##epel-release
#Ver: 		sudo yum list -q installed epel-release
#Instalar:	sudo yum -y install epel-release
#Limpiar:	sudo yum clean all
#Remover:	sudo yum remove epel-release

##clamav
#Ver:		sudo yum list -q installed clamav
#Instalar:	sudo yum -y install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd
#Remover:	sudo yum remove clamav

#Instalar programa requerido para clamav.
if (yum list -q installed epel-release)
then
	echo "
	!!!!!!!!!!!!!!!	
	Epel-release requeriment installed.
	!!!!!!!!!!!!!!!"
	#sudo yum clean all
else
	sudo yum -y install epel-release
	sudo yum clean all
	echo "the required program for clamav was installed"
	echo "install Verification:


	"
	sudo yum list -q installed epel-release
fi

#Instalar y desinstalar programa clamav.
if (yum list -q installed clamav)
then
	sudo yum remove clamav
	sudo yum -y install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd
	echo "clamav for CentOS 7 was reinstalled"
	echo "...................................................................
	installed program verification:

	"
	sudo yum list -q installed clamav
	echo "...................................................................."
else
	sudo yum -y install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd
	echo "Clamav for CentOS 7 was installed"
	echo "...................................................................
	installed program verification:

	"
	sudo yum list -q installed clamav
	echo "........................................................................"
fi

#Check software available to update
echo "
	

	"
echo "............................. Availables updates .................................."
sudo yum check-update
echo "....................................................................................


	............................Updating... ..........................................."
sudo yum update

