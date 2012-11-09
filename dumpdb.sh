#!/bin/bash
DBNAME=<databasename>
DUMP=${DBNAME}.sql
DUMP_TEMP=${DBNAME}_temp.sql
DBHOST=<databasehost>
DBUSER=<databaseuser>

# automatically export dump when executed
if [ "$1" == "" ]; then
    mysqldump -p -h $DBHOST -u $DBUSER $DBNAME  > $DUMP_TEMP 

    if [ $? -ne 0 ]; then
        echo dump failed
        rm $DUMP_TEMP
    else 
        if [ -f $DUMP ];then
            echo dump succeed, replace ${DUMP}? [y/n]
            read REPLACE

            if [ "$REPLACE" == "y" ]; then
                mv $DUMP_TEMP $DUMP			
            else 
                rm $DUMP_TEMP
            fi
        fi
    fi
fi

# or import dump when asked for
if [ "$1" == "import" ]; then
    if [ -f $DUMP ]; then
        echo import ${DUMP}? [y/n]
        read IMPORT

        if [ "$IMPORT" == "y" ]; then
            mysql -p -h $DBHOST -u $DBUSER --default_character_set utf8 --database=$DBNAME < $DUMP
            if [ $? -eq 0 ]; then
                echo import succeed
            fi
        fi
    else
        echo unable to find dump $DUMP
    fi
fi
