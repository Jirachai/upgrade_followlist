for i in $(cat packages.txt);do apt upgrade -y --only-upgrade $i; done
#for i in $(cat packages.txt);do echo $i; done
#sudo apt upgrade $(cat packages.txt) --only-upgrade
#cat packages.txt | xargs sudo apt upgrade --only-upgrade
