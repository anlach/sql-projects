#!/bin/bash

db="psql --username=freecodecamp --dbname=salon -t -A -c"

mainMenu () {
  if [[ $1 ]]
  then
    echo -e "$1"
  fi
  echo -e "\nWelcome to my salon!\n\nChoose a service:\n"
  SERVICES=$($db "select * from services")
  echo "$SERVICES" | while IFS="|" read id name
  do
    echo $id\) $name
  done
  echo ""
  read SERVICE_ID_SELECTED
  serv_id=$($db "select service_id from services where service_id='$SERVICE_ID_SELECTED'")
  if [[ -z $serv_id ]]
  then
    mainMenu "\nThat's not a valid option. Try again."
  else
    serv_name=$($db "select name from services where service_id='$serv_id'")
    echo -e "\nAlright. What is your phone number?"
    read CUSTOMER_PHONE
    cust_id=$($db "select customer_id from customers where phone='$CUSTOMER_PHONE'")
    if [[ ! $cust_id =~ ^[0-9]+$ ]]
    then
      echo -e "\nOh! You must be new. What's your name?"
      read CUSTOMER_NAME
      result=$($db "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      cust_id=$($db "select customer_id from customers where phone='$CUSTOMER_PHONE'")
    fi

    name=$($db "select name from customers where phone='$CUSTOMER_PHONE'")
    echo -e "\nHi, $name! When would you like to schedule an appointment for?"
    read SERVICE_TIME
    result=$($db "insert into appointments(customer_id, service_id, time) values($cust_id, $serv_id, '$SERVICE_TIME')")
    echo -e "\nI have put you down for a $serv_name at $SERVICE_TIME, $name."
  fi

}

mainMenu
