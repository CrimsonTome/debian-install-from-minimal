# Debian install from minimal

> Post-install script(s) for Debian 

## System requirements

- Install Debian from the base [netinstall](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso)
- The only thing you will need to deviate from is to uncheck the desktop environment selection when prompted  
- The rest will be installed via the script hopefully

## Development

- edit `post-install.sh`

## Running

- `sudo sh post-install.sh`
or 
- `chmod +x post-install.sh`
  - `sudo ./post-install.sh`

## License

debian-install-from-minimal is released under the WTFNMFPL-1.0 License. The full license text is included in the [LICENSE](LICENSE) file in this repository. Tldr legal have a [great summary](https://tldrlegal.com/license/do-what-the-fuck-you-want-to-but-it's-not-my-fault-public-license-v1-(wtfnmfpl-1.0)) of the license if you're interested.