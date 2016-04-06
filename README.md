# raspberry-pi-chef
Chef recipes for the raspberry pi

To setup your raspberry pi, follow this instructions:

http://everydaytinker.com/raspberry-pi/installing-chef-client-on-a-raspberry-pi-2-model-b/

On the raspberry run
```
sudo apt-get install rsync
```

On the chef workstation
update the node file nodes/10.11.101.220.json with the ip of your pi
run
```
gem install knife-solo
knife configure -r . --defaults

knife solo cook pi@[ip_of_your_pi]
knife solo cook pi@10.11.101.220 # for example
```

# references

https://github.com/pedrocarrico/raspberrypi_cookbook
https://matschaffer.github.io/knife-solo/