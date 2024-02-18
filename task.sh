#!/bin/bash

# Configuration file
tasks_file="tasks.conf"
source ansi.sh

# Function to schedule tasks
schedule_tasks() {
    while read -r task_line; do
        execution_time=$(echo "$task_line" | awk '{print $1}')
        task_name=$(echo "$task_line" | awk '{print $2}')
        command_to_execute=$(echo "$task_line" | awk '{$1=""; $2=""; print}')

      

       
        echo "$command_to_execute" | at "$execution_time" 2>/dev/null

        if [ $? -eq 0 ]; then
            echo "Scheduled task '$task_name' at $execution_time"
        else
            echo "Failed to schedule task '$task_name' at $execution_time"
        fi
    done < "$tasks_file"
}


main() {
    # Check if configuration file exists
    if [ ! -f "$tasks_file" ]; then
        echo "Tasks configuration file $tasks_file not found."
        exit 1
    fi

   
    schedule_tasks
}

# Function to remove tasks
remove_tasks() {
    while true; do
    echo "Tasks to remove:"
    atq

    read -p "Enter task ID to remove (or leave blank to exit): " task_id


    if [ -z $task_id ];then
        echo "Exiting task removal."
        break
    fi

    if atq | grep -q "^$task_id"; then
            at -r "$task_id" 2>/dev/null
            echo "Task $task_id removed."
        else
            echo "Task $task_id not found."
        fi
    done
}



echo -e "##### $RED Task Schedular $RESET #####"
echo -e " $GREEN 1 $RESET for adding tasks"
echo -e " $GREEN 2 $RESET for deleting tasks"

read -p "enter::" option

if [ $option -eq 1 ];then
    main
elif [ $option -eq 2 ];then
    remove_tasks
else
    echo "please choose correct option"
    exit 1
fi
