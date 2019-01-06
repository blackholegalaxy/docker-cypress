#! /bin/bash

attempt_counter=0
max_attempts=20

until ping -c 1 "$1"; do
    if (( attempt_counter == max_attempts )); then
      echo "Max attempts reached"
      exit 1
    fi

    printf '.'
    (( ++attempt_counter ))
    sleep 5
done
