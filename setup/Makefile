prefix=/usr/local
.PHONY: install install_manet install_endnoded udev_U3 udev_C1

install_manet : setup_manet setup_wlan manetd setup_wlan_iw addressbook default.routes manetd.conf manetd_upstart 
	install -d /logs/
	install -m 0755 setup_manet   $(prefix)/bin
	install -m 0755 setup_wlan    $(prefix)/bin
	install -m 0755 setup_wlan_iw $(prefix)/bin
	install -m 0755 manetd $(prefix)/bin
	install -m 0755 manetd_upstart /etc/init.d/manetd
	install -d $(prefix)/share/nccr_manet
	install -m 0644 manetd.conf $(prefix)/share/nccr_manet/
	install -m 0644 default.routes $(prefix)/share/nccr_manet/
	update-rc.d manetd defaults
	update-rc.d manetd enable

install_endnoded : addressbook endnoded endnoded_upstart endnoded.conf
	install -d $(prefix)/share/nccr_manet
	install -m 0755 endnoded $(prefix)/bin
	install -m 0755 endnoded_upstart /etc/init.d/endnoded
	install -m 0644 endnoded.conf $(prefix)/share/nccr_manet/
	install -m 0644 addressbook   $(prefix)/share/nccr_manet/
	update-rc.d endnoded defaults
	update-rc.d endnoded enable

uninstall_endnoded: 
	update-rc.d -f endnoded remove

install: install_manet install_endnoded


udev_U3 : udev/U3/xbee.rules
	install -m 0755 udev/U3/xbee.rules /etc/udev/rules.d/
	udevadm control --reload-rules

udev_C1: udev/C1/xbee.rules
	install -m 0755 udev/C1/xbee.rules /etc/udev/rules.d/
	udevadm control --reload-rules


