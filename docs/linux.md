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
- __list package__
  ```
  apt list --installed | grep libatlas
  ```
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

### klipper numpy module issue
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

### Klipper python
- __upgrade pip__
  ```
  ~/klippy-env/bin/pip install --upgrade pip
  ```

### btn web server
```
cd ~/klipper/out
~/klippy-env/bin/python3 -m http.server
```
### Git
- __ignore local files__
  ```
  nano ~/klipper/.git/info/exclude
  ```

