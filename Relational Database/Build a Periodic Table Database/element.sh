#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --no-align -tc"

GET_DETAILS() {
  if [[ -n $(echo $1 | grep [0-9]) ]]
  then
    DETAILS=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")
    if [[ -n $DETAILS ]]
    then 
      FORMATTED_DETAILS=$(echo $DETAILS | sed 's/|/ /g')
      echo $FORMATTED_DETAILS | while IFS=' ' read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
      do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    else
      echo I could not find that element in the database.
    fi
  
  elif [[ -n $(echo $1 | grep -i [a-z]) && $(echo $1 | wc -m) -lt 4 ]]
  then
    DETAILS=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1'")
    if [[ -n $DETAILS ]]
    then 
      FORMATTED_DETAILS=$(echo $DETAILS | sed 's/|/ /g')
      echo $FORMATTED_DETAILS | while IFS=' ' read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
      do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    else
      echo I could not find that element in the database.
    fi
  
  elif [[ -n $(echo $1 | grep -i [a-z]) && $(echo $1 | wc -m) -gt 3 ]]
  then
    DETAILS=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$1'")
    if [[ -n $DETAILS ]]
    then 
      FORMATTED_DETAILS=$(echo $DETAILS | sed 's/|/ /g')
      echo $FORMATTED_DETAILS | while IFS=' ' read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
      do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    else
      echo I could not find that element in the database.
    fi
  
  else
    echo I could not find that element in the database.
  fi
}

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  INPUT=$1
  GET_DETAILS $INPUT
fi
