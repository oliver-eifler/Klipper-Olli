# Linux 
## Nice to Know, copy&paste

### System
- __update__
  ```
  sudo apt-get update
  sudo apt-get upgrade
  ```
- __cleanup__
  ```
  sudo apt-get clean
  sudo apt-get autoclean
  sudo apt autoremove
  ```
- __install midnight commander__
  ```
  sudo apt-get install mc 
  sudo apt-get install gpm 
  ```
- __list package__
  ```
  apt list --installed | grep libatlas
  ```
- __list disk drives__
  ```
  sudo lsblk
  ```
- __show mountpoints__
  ```
  df -h /dev/sda*
  ```
- __diskspace browser__
  ```
  ncdu -x
  ```
- __cleanup locale, manpages, docs__
  ```
  sudo apt-get install localepurge
  ```
  ```
  sudo dpkg-reconfigure localepurge
  ```
### Time
- __time settings__
  ```
  sudo timedatectl
  ```
- __list timezone__
  ```
  timedatectl list-timezones | grep Europe
  ```
- __set timezone__
  ```
  sudo timedatectl set-timezone <time zone>
  ```
- __activate NTP on Armbian__
  ```
  sudo apt remove chrony
  sudo apt-get install systemd-timesyncd
  systemctl status systemd-timesyncd.service
  sudo timedatectl set-ntp true
  sudo timedatectl
  ```
- __activate NTP__
  ```
  sudo timedatectl set-ntp true
  sudo timedatectl
  ```
- __NTP connfiguration__
  ```
  sudo nano /etc/ntp.conf
  ```
- __Armbian (bullseye) 'apt-get update fails with public key errors'__
  ```
  sudo wget https://apt.armbian.com/armbian.key -O key
  sudo gpg --dearmor < key | sudo tee /usr/share/keyrings/armbian.gpg > /dev/null
  sudo chmod go+r /usr/share/keyrings/armbian.gpg
  sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/armbian.gpg] http://apt.armbian.com $(lsb_release -cs) main  $(lsb_release -cs)-utils  $(lsb_release -cs)-desktop" | sudo tee /etc/apt/sources.list.d/armbian.list
  ```

### Zeroconf/bonjour troubleshooting debian 11
- __remove__
  ```
  sudo apt-get remove avahi-daemon
  ```
- __install__
  ```
  sudo apt-get install avahi-daemon
  sudo update-rc.d avahi-daemon defaults
  ```
### Samba Server
- __Install__
  ```
  sudo apt-get install samba samba-common smbclient
  ```
- __Check__
  ```
  sudo service smbd status
  sudo service nmbd status
  ```
- __Restart__
  ```
  sudo service smbd restart
  sudo service nmbd restart
  ```
- __Config__
  ```
  sudo mv /etc/samba/smb.conf /etc/samba/smb.conf_alt
  ```
  ```
  sudo nano /etc/samba/smb.conf
  ```
  base config looks like
  ```
  [global]
  workgroup = OLLI
  security = user
  #encrypt passwords = yes #default
  client min protocol = SMB2
  client max protocol = SMB3

  [NAME]
  comment = ...
  path = /home/user_name
  read only = no
  follow symlinks = yes

  ```
  _Only use /home/user_name share for windows access to ensure working symlinks (i.e. ~/printer_data/config/mainsail) as windows can't follow symlinks outside shared path_


- __Add samba user__
  ```
  sudo smbpasswd -a user_name
  ```

## Klipper 
### serial ports
- __usb-serial ports with symlinks__
  ```
  ls -lR /dev/ | grep -v '\->\s../tty' | grep -v ttyprintk | grep -e 'tty[[:alpha:]]' -e serial
  ```
- __test klipper with serial ports__
  ```
    sudo systemctl stop klipper.service
  ```
  ```
    ~/klipper $ ../klippy-env/bin/python ./klippy/console.py <PORT>
  ```
  ```
    sudo systemctl start klipper.service
  ```

### numpy module issue
- __force numpy 1.25.2__
  ```
  sudo apt install python3-numpy python3-matplotlib libatlas-base-dev
  ~/klippy-env/bin/pip3 install -v numpy==1.25.2 
  ```
- __install openblas lib for numpy0.26.x__
  ```
  sudo apt-get install libopenblas-dev
  ```
- __numpy version__
  ```
  ~/klippy-env/bin/pip3 show numpy
  ```

### python related
- __show klipper python version__
  ```
  ~/klippy-env/bin/python --version
  ```
- __upgrade klipper python__
  ```
  ~/klippy-env/bin/pip install -r https://raw.githubusercontent.com/Klipper3d/klipper/master/scripts/klippy-requirements.txt
  ```
- __upgrade klipper python!!!__
  ```
  ~/klippy-env/bin/pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 ~/klippy-env/bin/pip install --upgrade
  ```
- __upgrade pip__
  ```
  ~/klippy-env/bin/pip install --upgrade pip
  ```
- __upgrade klipper python2 to python3__
  ```
  sudo service klipper stop

  cd ~
  rm -rf klippy-env
  
  virtualenv -p python3 klippy-env

  ~klippy-bin/pip install -r ~/klipper/scripts/klippy-requirements.txt
  ```
- __btn web server__
  ```
  cd ~/klipper/out
  ~/klippy-env/bin/python3 -m http.server
  ```

### Git related
- __ignore local files__
  ```
  nano ~/klipper/.git/info/exclude
  ```

