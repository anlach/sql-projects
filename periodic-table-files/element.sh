#/bin/bash

db="psql --username=freecodecamp --dbname=periodic_table -A -t -c "

if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]] # is a number
  then
    ATOMIC_NUMBER=$($db "select atomic_number from elements where atomic_number=$1")
  elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]] # is a symbol
  then
    ATOMIC_NUMBER=$($db "select atomic_number from elements where symbol='$1'")
  else
    ATOMIC_NUMBER=$($db "select atomic_number from elements where name='$1'")
  fi
  if [[ $ATOMIC_NUMBER =~ ^[0-9]+$ ]]
  then
    IFS="|" read SYMBOL NAME <<< $($db \
      "select symbol, name from elements where atomic_number=$ATOMIC_NUMBER")
    IFS="|" read TYPE MASS MELT BOIL <<< $($db \
      "select type, atomic_mass, melting_point_celsius, boiling_point_celsius \
        from properties join types using(type_id) where atomic_number=$ATOMIC_NUMBER")
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL)." \
      "It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of" \
      "$MELT celsius and a boiling point of $BOIL celsius."
  else
    echo I could not find that element in the database.
  fi
else
  echo Please provide an element as an argument.
fi