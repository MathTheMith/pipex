#include "pipex.h"

void	free_paths(char **paths)
{
	int	i;

	if (!paths)
		return ;
	i = 0;
	while (paths[i])
	{
		free(paths[i]);
		i++;
	}
	free(paths);
}

char	*find_path(char *cmd, char **envp)
{
	char	**paths;
	char	*path;
	int		i;
	char	*part_path;

	i = 0;
	while (envp[i] && !ft_strnstr(envp[i], "PATH", 4))
		i++;
	if (!envp[i])
		return (NULL);
	paths = ft_split(envp[i] + 5, ':');
	i = -1;
	while (paths[++i])
	{
		part_path = ft_strjoin(paths[i], "/");
		path = ft_strjoin(part_path, cmd);
		free(part_path);
		if (!access(path, F_OK | X_OK))
			return (free_paths(paths), path);
		free(path);
	}
	free_paths(paths);
	return (NULL);
}

void	error(void)
{
	perror("Error");
	exit(EXIT_FAILURE);
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
		return (free_paths(cmd), ft_putstr_fd("Error: Invalid command\n", 2), exit(1));
	path = find_path(cmd[0], envp);
	if (!path)
	{
		ft_putstr_fd("Error: Command not found: ", 2);
		ft_putstr_fd(cmd[0], 2);
		ft_putstr_fd("\n", 2);
		free_paths(cmd);
		exit(127);
	}
	if (execve(path, cmd, envp) == -1)
		error();
}
