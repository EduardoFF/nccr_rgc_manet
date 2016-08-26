#MYIP=$(/sbin/ifconfig eth0 | sed -n 's/.*inet addr:\([^ ]*\).*/\1/p')

export ROBOTLOCALIPPRE=${ROBOTLOCALIPPRE:="192.168.201"}
sync_time()
{
  echo "Synchronizing robots with machine with IP ${MYIP}"
  IPEND=$1
  ROBOTLOCALIP=${ROBOTLOCALIPPRE}.${IPEND}
  echo "Synchronizing ${1}"
  ssh -t odroid@${ROBOTLOCALIP} 'sudo ntpdate '"${MYIP}"
  if [[ $? != "0" ]]; then
    echo "RUN FAILED FOR ${1}"
  fi
}
MYIP=$1
export MYIP
export -f sync_time
parallel --gnu --jobs 0 sync_time ::: ${@:2}

