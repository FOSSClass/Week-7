#! /bin/bash

cd ~
echo "NOW WE'LL CREATE A UNIT NAMED test1.target AND test2.target WITH DEPENDENCY"
echo "ON test1.target."
touch test1.target
touch test2.target
echo "[Unit]" >> test1.target
echo "Description=test 1" >> test1.target
echo "[Unit]" >> test2.target
echo "Description=test 2" >> test2.target
echo "Wants=test1.target" >> test2.target
sudo mv test?.target /etc/systemd/system/
systemctl status test1.target test2.target
echo "THEY'RE HERE, BUT NOT ACTIVE. WE'LL ACTIVATE test2.target AND VERIFY THEY ARE"
echo "BOTH ACTIVE."
echo "PRESS ENTER"
read

# Activating JUST test2, but thanks to the dependency, test1 gets activated as well:
systemctl start test2.target

systemctl status test1.target test2.target
echo "THERE'RE ACTIVE NOW. WE'LL FINISH THE PROCESS, DE-ACTIVATE THEM AND DELETE THEM."
echo "PRESS ENTER"
read
systemctl stop test1.target test2.target
systemctl disable test1.target test2.target
cd /etc/systemd/system/
sudo rm test1.target test2.target
cd ~
echo "THAT'S IT. THANK YOU."

