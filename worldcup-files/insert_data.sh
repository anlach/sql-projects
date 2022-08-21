#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo -e $($PSQL "truncate table games, teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # echo $YEAR $ROUND $WINNER $OPPONENT 
  if [[ $YEAR != year ]]
  then 
    RESULT=$($PSQL "insert into teams(name) values('$WINNER')")
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'");
    RESULT=$($PSQL "insert into teams(name) values('$OPPONENT')")
    LOSER_ID=$($PSQL "select team_id from teams where name='$OPPONENT'");
    RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_ID, $LOSER_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    echo $RESULT;
  fi
done