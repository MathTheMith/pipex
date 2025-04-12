/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marvin <marvin@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/30 13:55:38 by marvin            #+#    #+#             */
/*   Updated: 2025/04/12 14:23:28 by marvin           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

void	child_process(char **argv, char **envp, int *fd)
{
	int	filein;

	filein = open(argv[1], O_RDONLY);
	if (filein == -1)
		handle_fork_error(fd);
	if (dup2(fd[1], STDOUT_FILENO) == -1 || dup2(filein, STDIN_FILENO) == -1)
	{
		close(filein);
		handle_fork_error(fd);
	}
	close(filein);
	close(fd[0]);
	close(fd[1]);
	execute(argv[2], envp);
}

void	parent_process(char **argv, char **envp, int *fd)
{
	int	fileout;

	fileout = open(argv[4], O_WRONLY | O_CREAT | O_TRUNC, 0644);
	if (fileout == -1)
		handle_fork_error(fd);
	if (dup2(fd[0], STDIN_FILENO) == -1 || dup2(fileout, STDOUT_FILENO) == -1)
	{
		close(fileout);
		handle_fork_error(fd);
	}
	close(fileout);
	close(fd[0]);
	close(fd[1]);
	execute(argv[3], envp);
}

void	handle_fork_error(int *fd)
{
	if (fd[0] != -1)
		close(fd[0]);
	if (fd[1] != -1)
		close(fd[1]);
	perror("Error");
	exit(EXIT_FAILURE);
}

int	execute_pipex(char **argv, char **envp, int *fd)
{
	pid_t	pid1;
	pid_t	pid2;
	int		status;

	pid1 = fork();
	if (pid1 == -1)
		handle_fork_error(fd);
	if (pid1 == 0)
		child_process(argv, envp, fd);
	pid2 = fork();
	if (pid2 == -1)
		handle_fork_error(fd);
	if (pid2 == 0)
		parent_process(argv, envp, fd);
	close(fd[0]);
	close(fd[1]);
	waitpid(pid1, &status, 0);
	waitpid(pid2, &status, 0);
	if (WIFEXITED(status))
		return (WEXITSTATUS(status));
	return (1);
}

int	main(int argc, char **argv, char **envp)
{
	int	fd[2];

	if (argc != 5)
	{
		ft_putstr_fd("Error: Bad arguments\n", 2);
		ft_putstr_fd("Ex: ./pipex <file1> <cmd1> <cmd2> <file2>\n", 1);
		return (1);
	}
	if (pipe(fd) == -1)
		handle_fork_error(fd);
	return (execute_pipex(argv, envp, fd));
}
