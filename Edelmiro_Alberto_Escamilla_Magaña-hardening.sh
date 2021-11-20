#! /bin/bash

hostnamectl

if (hostnamectl | grep "centos")
then
	echo ".....................Sistema CentOS detectado...........................
	
	"
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
		echo "installed Verification:


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

else
	echo "....................................Sistema ubuntu detectado..............................................."
	if (apt list installed clamav)
	then
		echo "Reinstall programa clamav"
		sudo apt-get autoremove clamav
		sudo apt-get install clamav
		echo "............................

		"
		whereis clamav
	
	else
		echo "Install program clamav"
		sudo apt-get install clamav
		echo "............................

		"
		whereis clamav
	fi
	
fi

#Check software available to update
if (hostnamectl | grep "centos")
then
	echo "
	

		"
	echo "............................. Availables centos updates .................................."
	sudo yum check-update
	echo "....................................................................................


		............................Updating... ..........................................."
	sudo yum update
else
	echo "
	

		"
	echo "............................. Availables ubuntu updates .................................."
	sudo apt list-upgradable
	echo "....................................................................................


		............................Updating... ..........................................."
	sudo apt-get update
fi
