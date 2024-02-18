# Task Schedular
This is a simple task scheduling script written in Bash. It allows users to schedule tasks and manage them through a configuration file.

## Features:
- Add tasks with specific execution times.
- Remove tasks that are scheduled.
- Utilizes ANSI color codes for improved readability.

## Usage
- Clone the repository to your local machine.
- Make sure you have `at` installed on your system.
- Run the script scheduler.sh from the terminal.
- make task.sh file executable 
```bash
    chmod +x task.sh

```

- run task.sh file
```bash
    ./task.sh
```

1. Follow the on-screen instructions to add or delete tasks.

## Configuration file:
- The tasks are managed using a configuration file named tasks.conf. Each line in the file represents a task in the following format:

```bash
    <execution_time> <task_name> <command_to_execute>

```

- **execution_time**- time you want to schedule task. (use 24 hour format).
- **task_name**- give your task a name
- **command_to_execute**- task you want to execute that might be file or command.

## Requirements:

1. Bash
2. at command (typically available on Unix-like systems)

# Example:
in tasks.conf file write 
`18:32 Task1 echo $(notify-send "presentation" "prepare presentation for tomorrow")`

- output- It will send notification at 18:32