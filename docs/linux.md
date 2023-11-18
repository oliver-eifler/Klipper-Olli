### Linux 
## Nice to Know and copy&paste

### updating
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
~/klippy-env/bin/pip install -v numpy==1.25.2 
```
