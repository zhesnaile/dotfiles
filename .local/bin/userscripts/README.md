# Userscripts

A collection of personal scripts. Most of them could arguably just be aliases.

* **decodesixtyfour**: decode a string of base64 directly, mainly useful for CTFs

* **dottovpn.sh** and **vpntodot.sh**: scripts to change between two DNS due to past issues with network manager. Intended to avoid DNSLeak when using a VPN.

* **hashmeout.py**: python script to get 4 Hashes out of one file. (md5, SHA1, SHA256, SHA512) 

* **list**\***.sh**: scripts for listing PCI devices reset capabilites, IOMMU and USB goupings.

* **mymd5recursion**: md5sum but recurses into directories, use flag "-o [output-file]" to write to a file.

* **painseeker**: prints all C style comments in a file; I just wanted to have fun with some unreadable regex/perl stuff.

* **pip-update**: generates a list of user installed pip packages, and runs `pip install -U` for each of them.

* **rclam.sh**: nothing special, just saves me from typing a bunch of flags every time I wanna use rclone.

* **sane-unzip**: unzip doesn't extract to a directory by default, this is just a really unnecessary wrapper I like to use. You could just use [unar](https://theunarchiver.com/command-line) instead.

* **scum.sh**: wrapper around unar, if the archive only contains a single file, skip creating a directory, otherwise decompress into a directory

* **squeezeit**: generate a squashfs image out of a directory using really high compression settings ( Uses Zstandard compression).

* **vfio_(de)activate.sh**: switch between two configs to enable or disable [PCI passthrough via OVMF](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF) on archlinux.

* **vidgrab.sh**: For when you need a video from a website and yt-dlp doesn't work, this tends to work for videos that are split among multiple files.
