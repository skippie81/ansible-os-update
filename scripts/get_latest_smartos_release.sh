#!/usr/bin/env bash

URL=$1

if [[ $URL == '' ]]
then
  URL='https://pkgsrc.joyent.com/packages/SmartOS/'
fi

RELEASE=$(curl $URL | egrep '20[0-9]{2}Q[0-9]{1}' | tail -1 | awk -F '[<>]' '{print $3}' | tr -d '/')

printf "$RELEASE"