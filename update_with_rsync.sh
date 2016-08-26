IP=$1
rsync -avz . --exclude=setup/endnoded.conf --exclude=src --exclude=setup/manetd.conf  odroid@${IP}:nccr_rgc_manet/
