#!/bin/bash


if [ ! -f /var/XDM ]; then
	git clone https://github.com/lad1337/XDM.git /var/XDM;
	chown -R abc:abc /var/XDM
else
	cd /var/XDM
	git checkout
fi
