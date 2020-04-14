#! /bin/sh

NEW_API_PATH=""
OLD_API_PATH=""

for arg in "$@"
do 
    case $arg in
        --new-api=*)
        NEW_API_PATH="${arg#*=}"
        shift
        ;;
        --old-api=*)
        OLD_API_PATH="${arg#*=}"
        shift
        ;;
    esac
done 

RESULT=$(java -jar /swagger-brake.jar --new-api=$NEW_API_PATH --old-api=$OLD_API_PATH)
echo $RESULT
if echo $RESULT | grep -qi "No breaking API changes detected"; then
    exit 0
else 
    exit 1
fi 
