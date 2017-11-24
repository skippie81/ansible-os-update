#!/usr/bin/env bash

URL=$1

if [[ $URL == '' ]]
then
  URL='https://pkgsrc.joyent.com/packages/SmartOS/'
fi

if ( type curl 1> /dev/null 2>&1 )
then
  GET='curl -s'
elif ( type wget 1> /dev/null 2>&1 )
then
  GET='wget -qO-'
else
  exit 1
fi

RELEASE=$($GET -s $URL | egrep '20[0-9]{2}Q[0-9]{1}' | tail -1 | awk -F '[<>]' '{print $3}' | tr -d '/')

printf "$RELEASE"