#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
PSQLX="psql --username=freecodecamp --dbname=salon --tuples-only --no-align -c"
echo -e "\n~~~~ vdnry's Salon ~~~~\n"
echo -e "Welcome! How may I assist you today?\n"
SERVICES=$($PSQL "SELECT * FROM services")

BOOKING() {
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQLX "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI can't find a record for this phone number. What is your name?"
    read CUSTOMER_NAME
    INSERT_NAME=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  echo -e "\nWhat time should I book your $1, $CUSTOMER_NAME?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
  APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $2, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $1 at $SERVICE_TIME, $CUSTOMER_NAME."
}

INPUT() {
  read SERVICE_ID_SELECTED
  SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_SELECTED ]]
  then
    MENU "I'm sorry, but I couldn't find that service. Can you try again?"
  else
    BOOKING $SERVICE_SELECTED $SERVICE_ID_SELECTED
  fi
}

MENU() {
if [[ $1 ]]
then
echo -e "\n$1"
fi
echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
INPUT
}

MENU