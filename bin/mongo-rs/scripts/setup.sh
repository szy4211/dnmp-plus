#!/bin/bash

mongo1=`getent hosts mongo-rs-1 | awk '{ print $1 }'`
mongo2=`getent hosts mongo-rs-2 | awk '{ print $1 }'`
mongo3=`getent hosts mongo-rs-3 | awk '{ print $1 }'`

port=${PORT:-27017}

echo "Waiting for startup.."
until mongo --host ${mongo1}:${port} --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 1
done


echo
echo "Started.."



setRs()
{
  mongo --host ${mongo1}:${port} <<EOF
     var cfg = {
        "_id": ${RS},
        "protocolVersion": 1,
        "members": [
            {
              "_id": 0,
              "host": "${mongo1}:${port}",
              "priority": 9
            },
            {
              "_id": 1,
              "host": "${mongo2}:${port}"
            },
            {
              "_id": 2,
              "host": "${mongo3}:${port}"
            }
        ]
    };

    rs.initiate(cfg, {"force": true });
    rs.reconfig(cfg, {"force": true });
EOF
}

while true; do
  $(mongo --host ${mongo1}:${port} --eval 'quit(rs.status().ok ? 0 : 2)' &>/dev/null)
  if [ $? -eq 0 ]; then
    echo "Sucess"
    exit 0
  fi

  setRs &>/dev/null || (printf "." && sleep 2)

done
