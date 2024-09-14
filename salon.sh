#!/bin/bash

psql="psql --username=freecodecamp --dbname=salon --tuples-only -c "

echo -e "\n...  P_Salon  ...\n"

main() {
  if [[ $1 ]]
  then echo -e "\t$1"
  fi

  # show services
  serv=$($psql "select * from services;")
  echo "$serv" | while read service_id bar name
  do
    echo "$service_id) $name"
  done

  echo "Choose:"
  read SERVICE_ID_SELECTED

  sid=$($psql "select service_id from services where service_id = $SERVICE_ID_SELECTED")

  # check service
  if [[ -z $sid ]]
  then 
    main "/\ Not available."
    return
  fi

  echo "Phone No.:"
  read CUSTOMER_PHONE

  # check customer
  name=$($psql "select name from customers where phone = '$CUSTOMER_PHONE'")
  
  # if new entry
  if [[ -z $name ]]
  then
    echo -e "\nWelcome!\n\nname:"
    read CUSTOMER_NAME

    echo "Time:"
    read SERVICE_TIME

    inCust=$($psql "insert into customers (phone, name) values ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")

    custId=$($psql "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
    name=$CUSTOMER_NAME
  
  else
    echo "Time:"
    read SERVICE_TIME

    custId=$($psql "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
  fi
  
  # add appointment
  inApp=$($psql "insert into appointments (customer_id, service_id, time) values ($custId, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # service name
  serv=$($psql "select name from services where service_id = $SERVICE_ID_SELECTED")

  # final message
  echo "I have put you down for a $(echo $serv | sed -E 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -E 's/^ *| *$//g'), $(echo $name | sed -E 's/^ *| *$//g')."
}

main
