prefix=/usr/local

    install: setup_manet setup_wlan setup_wlan_iw addressbook
	install -m 0755 setup_manet   $(prefix)/bin
	install -m 0755 setup_wlan    $(prefix)/bin
	install -m 0755 setup_wlan_iw $(prefix)/bin
	install -d $(prefix)/share/nccr_manet
	install -m 0644 addressbook   $(prefix)/share/nccr_manet/

    .PHONY: install
