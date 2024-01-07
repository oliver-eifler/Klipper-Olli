# Linux 
## Nice to Know, copy&paste

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

### btn web server
```
cd ~/klipper/out
~/klippy-env/bin/python3 -m http.server
```
