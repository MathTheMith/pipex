/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mvachon <mvachon@student.42lyon.fr>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/30 13:55:41 by marvin            #+#    #+#             */
/*   Updated: 2025/04/02 09:22:04 by mvachon          ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

char	*absolute_path(char *cmd)
{
	if (cmd[0] == '/' || (cmd[0] == '.' && cmd[1] == '/'))
	{
		if (access(cmd, F_OK | X_OK) == 0)
			return (ft_strdup(cmd));
		ft_putstr_fd("Error: Command not found \n", 2);
	}
	return (NULL);
}

char	*look_for_path(char *cmd, char **paths)
{
	char	*path;
	char	*part_path;
	int		i;

	i = 0;
	while (paths[i])
	{
		part_path = ft_strjoin(paths[i], "/");
		if (!part_path)
			return (free_paths(paths), NULL);
		path = ft_strjoin(part_path, cmd);
		free(part_path);
		if (!path)
			return (free_paths(paths), NULL);
		if (access(path, F_OK | X_OK) == 0)
			return (free_paths(paths), path);
		free(path);
		i++;
	}
	free_paths(paths);
	return (NULL);
}

char	*find_path(char *cmd, char **envp)
{
	char	**paths;
	char	*abs_path;

	abs_path = absolute_path(cmd);
	if (abs_path)
		return (abs_path);
	while (*envp && !ft_strnstr(*envp, "PATH=", 5))
		envp++;
	if (!*envp)
		return (NULL);
	paths = ft_split(*envp + 5, ':');
	if (!paths)
		return (NULL);
	return (look_for_path(cmd, paths));
}

void	execute(char *argv, char **envp)
{
	char	**cmd;
	char	*path;

	if (!argv || !*argv)
	{
		ft_putstr_fd("Error: Empty command\n", 2);
		exit(1);
	}
	cmd = ft_split(argv, ' ');
	if (!cmd || !cmd[0])
	{
		ft_putstr_fd("Error: Invalid command\n", 2);
		free_paths(cmd);
		exit(1);
	}
	path = find_path(cmd[0], envp);
	if (path)
		execve(path, cmd, envp);
	ft_putstr_fd("Error: Command not found: ", 2);
	ft_putstr_fd(cmd[0], 2);
	ft_putstr_fd("\n", 2);
	free_paths(cmd);
	exit(127);
}
