#!/bin/bash
hostname=$(hostname)
hostname=${hostname::-2}

function imInSwarm(){
  name=$1
  #verifico se sono presente nell'elenco dei nodi dello swarm
  docker node ls --format "{{.Hostname}}" | grep $name > /dev/null
  echo $?
}

#Sono il leader? se non c'è lo eleggo
if [ $(hostname) == "manager01" ]; then
  echo "vorrei essere leader"
  iminswarm=$(imInSwarm "manager01")
  if [[ $iminswarm != 0 ]]; then
    echo "non sono manager, lo divento"
    ip_addr=$(hostname -I | awk '{print $2}')
    docker swarm init --listen-addr ${ip_addr}:2377 --advertise-addr ${ip_addr}:2377 | grep SWM | sed 's/^[ \t]*//g' >  /cache/docker_join_worker.sh
    docker swarm join-token manager | grep SWM | sed 's/^[ \t]*//g' >  /cache/docker_join_manager.sh
  else
    echo "lo sono già"
  fi
else
  # sono candidabile? se si mi candido
  if [ $hostname == "manager" ]; then
    iminswarm=$(imInSwarm $(hostname))
    if [[ $iminswarm != 0 ]]; then
        echo "mi aggrego ai boss"
        source /cache/docker_join_manager.sh
    else
        echo "sono già in lista, sarà re"
    fi
  fi
  if [ $hostname == "worker" ]; then
    status=$(docker info --format '{{.Swarm.LocalNodeState}}')
    if [[ $status != "active" ]]; then
        echo "divento ape operaia"   
        source /cache/docker_join_worker.sh
    else
        echo "ho già un lavoro"
    fi
  fi
fi