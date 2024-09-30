# Qemu / KVM / Virt Manager

```bash
sudo pacman -S virt-manager qemu vde2 ebtables iptables-nft nftables dnsmasq bridge-utils ovmf swtpm
```


### Edit the lib-virt configuration file

```ini

```

start and enable the libvirt service

```bash
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
```

Add your user to the libvirt group

```bash
sudo usermod -aG libvirt $(whoami)
```

Edit the qemu configuration file

```bash
sudo nano /etc/libvirt/qemu.conf
``


