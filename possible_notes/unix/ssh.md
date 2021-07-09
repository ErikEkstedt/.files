# Unix


## SSH

```bash
sudo ssh-keygen
```

script
```bash
sudo -H -u erik bash -c "ssh-keygen -t rsa -b 4096 -C $email"
sudo -H -u erik bash -c 'eval "$(ssh-agent -s)"'
sudo -H -u erik bash -c 'ssh-add ~/.ssh/id_rsa'
```


## Password


```bash
passwd
```

