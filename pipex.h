/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mvachon <mvachon@student.42lyon.fr>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/15 14:50:42 by mvachon           #+#    #+#             */
/*   Updated: 2025/04/11 19:54:30 by mvachon          ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#ifndef PIPEX_H
# define PIPEX_H

# include <stdio.h>
# include <sys/wait.h>
# include <fcntl.h>
# include "libft/libft.h"

void	error(void);
void	free_paths(char **paths);
void	child_process(char **argv, char **envp, int *fd);
void	parent_process(char **argv, char **envp, int *fd);
void	handle_fork_error(int *fd);
int		execute_pipex(char **argv, char **envp, int *fd);
char	*absolute_path(char *cmd);
char	*look_for_path(char *cmd, char **paths);
char	*find_path(char *cmd, char **envp);
void	execute(char *argv, char **envp);

#endif
