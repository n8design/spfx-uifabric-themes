#!/bin/bash

function usage
{
    echo "Usage: $0 [-d | -s] testFolder";
    echo "";
    echo "Options:";
    echo "    -r, --regenerate";
    echo "        in errors cases, regenerate new results";
    echo "    -i, --interactive";
    echo "        in errors cases, ask to show the output differences and to regenerate an output";
    echo "";
    exit 1;
}

function confirm() {
  read -p "  - Do you want to ${1} (Y/n)? " -n 1 -r;
  echo "";
  if [ $REPLY = "q" ];
  then
    exit 1
  fi
  if [[ $REPLY =~ ^[Yy]$ ]];
  then
    return 0;
  fi
  return 1;
}

function green() {
  echo -n "$(tput setab 2; tput setaf 0) $1 $(tput sgr 0)"
}

function red() {
  echo -n "$(tput setab 1; tput setaf 7) $1 $(tput sgr 0)"
}

function available() {
  return $(hash $1 2>/dev/null);
}

function compile() {
  $1 $2 --sourcemap=none;
}

function ready() {
  SCSS_FILE=$1;
  MODE=$2;

  # Is expected result exists
  CSS_FILE=$( echo ${SCSS_FILE%.*}.css);
  if [ ! -f ${CSS_FILE} ];
  then
    if [ ${MODE} == "interactive" ];
    then
       echo "No existing result test for '${SCSS_FILE}'."
    fi;
    if [ ${MODE} == "regenerate" ] || ( [ ${MODE} == "interactive" ] && confirm "generate a new one?" );
    then
      COMMAND="node-sass";
      if available sass;
      then
        COMMAND="sass";
      fi;
      compile "${COMMAND}" "${SCSS_FILE}" > ${CSS_FILE};
      echo -n "${SCSS_FILE}: ";
      green "REGENERATED";
      echo "";
      return 0;
    else
      echo -n "${SCSS_FILE}: ";
      red "MISSED";
      echo "";
      return 1;
    fi;
  fi;
}

function test() {
  COMMAND=$1;
  SCSS_FILE=$2;
  MODE=$3;

  # Compare compiled & expected
  DIFF=$( compile "${COMMAND}" "${SCSS_FILE}" | diff -w -B ${CSS_FILE} - | wc -l);
  echo -n "${SCSS_FILE}: ${COMMAND} -> ";
  if [ $DIFF -eq 0 ];
  then
    green "PASSED";
    echo;
    return 0;
  fi;
  if [ ${MODE} != "regenerate" ];
  then
    red "FAILED";
  fi;

  if [ ${MODE} == "interactive" ] && confirm "see the difference?"
  then
    compile "${COMMAND}" "${SCSS_FILE}" | diff -w -B ${CSS_FILE} -;
  fi;

  if [ ${MODE} == "regenerate" ] || ( [ ${MODE} == "interactive" ] && confirm "override the current result?" );
  then
    compile "${COMMAND}" "${SCSS_FILE}" > ${CSS_FILE};
    green "REGENERATED";
  fi;
  echo;

  if [ ${MODE} == "regenerate" ];
  then
    return 0;
  fi;
  return 1;
}

# Compile script options
MODE="status-only";
OPTS=( $(getopt -o irsh -l interactive,regenerate,status-only,help -- "$@") );
if [ $? -ne 0 ]
then
    usage
fi
for OPT in ${OPTS};
do
  case $OPT in
    -r|--regenerate)
        shift;
        MODE="regenerate";
        ;;
    -s|--status-only)
        shift;
        MODE="status-only";
        ;;
    -i|--interactive)
        shift;
        MODE="interactive";
        ;;
    -h|--help)
        usage;
        ;;
  esac
done;

# Check sass compiler availability
if ! available sass && ! available node-sass;
then
  echo "Neither sass or node-sass compiler found."
  exit 1;
fi;

# Find sass source files in test folder or in parameters
if [ $# -eq 0 ];
then
  SCSS_FOLDER="test";
else
  SCSS_FOLDER=$@;
fi;
SCSS_FILE_LIST=( $(find ${SCSS_FOLDER} -type f | grep ".scss$") );

# Is a test
if [ ${#SCSS_FILE_LIST[@]} -eq 0 ];
then
  echo "No test found: ${SCSS_FOLDER}"
  usage;
fi;
SCSS_FILE_LIST="${SCSS_FILE_LIST[@]}";

TOTAL_TEST=0;
PASSED_TEST=0;
MISSED_TEST=0;

# Foreach source file
for SCSS_FILE in ${SCSS_FILE_LIST};
do
  if ready ${SCSS_FILE} ${MODE};
  then
    if available sass;
    then
      TOTAL_TEST=$(expr ${TOTAL_TEST} + 1);
      if test sass ${SCSS_FILE} ${MODE};
      then
        PASSED_TEST=$(expr ${PASSED_TEST} + 1);
      fi;
    fi;

    if available node-sass;
    then
      TOTAL_TEST=$(expr ${TOTAL_TEST} + 1);
      if test node-sass ${SCSS_FILE} ${MODE};
      then
        PASSED_TEST=$(expr ${PASSED_TEST} + 1);
      fi;
    fi;
  else
    TOTAL_TEST=$(expr ${TOTAL_TEST} + 1);
    MISSED_TEST=$(expr ${MISSED_TEST} + 1);
  fi;
done;

FAILED_TEST=$(expr ${TOTAL_TEST} - ${PASSED_TEST} - ${MISSED_TEST});

echo ;
if [ ${FAILED_TEST} -gt 0 ];
then
  red "${FAILED_TEST} tests failed";
  echo -n " ";
fi;
if [ ${MISSED_TEST} -gt 0 ];
then
  red "${MISSED_TEST} tests missed";
  echo -n " ";
fi;
if [ ${PASSED_TEST} -gt 0 ];
then
  green "${PASSED_TEST} tests passed";
  echo -n " ";
fi;
echo "(${TOTAL_TEST} total)";
echo ;

if [ ${FAILED_TEST} -gt 0 ];
then
  exit 1;
fi;