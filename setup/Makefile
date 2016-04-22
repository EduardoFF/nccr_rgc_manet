prefix=/usr/local

    install: setup_manet setup_wlan manetd setup_wlan_iw addressbook manetd.conf manetd_upstart
	install -m 0755 setup_manet   $(prefix)/bin
	install -m 0755 setup_wlan    $(prefix)/bin
	install -m 0755 setup_wlan_iw $(prefix)/bin
	install -m 0755 manetd $(prefix)/bin
	install -m 0755 manetd_upstart /etc/init.d/manetd
	install -d $(prefix)/share/nccr_manet
	install -m 0644 addressbook   $(prefix)/share/nccr_manet/
	install -m 0644 manetd.conf $(prefix)/share/nccr_manet/
	update-rc.d manetd defaults
    .PHONY: install
