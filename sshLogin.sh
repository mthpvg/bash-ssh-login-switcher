#!/bin/bash

SSH_LOGINS=(
  username1@server1
  username2@server2
  username3@server3
)

prompt="Please select a login:"
PS3="$prompt "

select LOGIN in "${SSH_LOGINS[@]}" "ABORT" ; do
    if (( REPLY == 1 + ${#SSH_LOGINS[@]} )) ; then
        exit

    elif (( REPLY > 0 && REPLY <= ${#SSH_LOGINS[@]} )) ; then
        break

    else
        echo "Invalid LOGINion. Try another one."
    fi
done

ssh $LOGIN
