p="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

el=$1
atno=$el # atomic no.

main() {
  if [[ -z $el ]]
  then
    echo Please provide an element as an argument.
    return
  fi

  # identify input type -> get id
  # if not no.
  if [[ ! $el =~ ^[0-9]+$ ]]
  then
    len=${#el}
    
    # sym | name
    if [[ len -lt 3 ]]
    then
      atno=$($p "select atomic_number from elements where symbol = '$el'")
    else
      atno=$($p "select atomic_number from elements where name = '$el'")
    fi

  fi

  # if invalid atno
  if [[ -z $atno ]]
  then
    echo I could not find that element in the database.
    return
  fi

  # name
  atom=$($p "select name from elements where atomic_number = $atno")

  echo "The element with atomic number $atno is $atom ($($p "select symbol from elements where atomic_number = $atno")). It's a $($p "select type from types where type_id = (select type_id from properties where atomic_number = $atno)"), with a mass of $($p "select atomic_mass from properties where atomic_number = $atno") amu. $atom has a melting point of $($p "select melting_point_celsius from properties where atomic_number = $atno") celsius and a boiling point of $($p "select boiling_point_celsius from properties where atomic_number = $atno") celsius."
}

main
