#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

/* Function prototype for infinite_while. */
int infinite_while(void);

/*
* Main function to create 5 child processes that become zombie processes.
* The parent process then enters an infinite loop.
*/
int main(void)
{
pid_t pid;  /* Variable for process ID from fork. */
int i;

for (i = 0; i < 5; ++i)
{
pid = fork(); /* Create a new child process. */

if (pid > 0)
{
/* Parent process prints the PID of the child process. */
printf("Zombie process created, PID: %d\n", pid);
}
else if (pid == 0)
{
/* Child process exits to become a zombie. */
exit(0);
}
else
{
/* If fork fails, report error and exit. */
perror("fork failed");
exit(EXIT_FAILURE);
}
}

/* Parent process enters an infinite loop after creating children. */
infinite_while();
return (0); /* Return statement in parentheses. */
}

/*
* Function for an infinite loop to prevent the parent process from terminating.
*/
int infinite_while(void)
{
while (1)
{
sleep(1); /* Sleep to reduce CPU usage. */
}
return (0); /* Return statement in parentheses. */
}
