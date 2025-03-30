# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/21 04:55:38 by marvin            #+#    #+#              #
#    Updated: 2025/03/30 12:54:29 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME    = pipex
CC      = gcc
CFLAGS  = -Wall -Wextra -Werror
HEADER  = pipex.h

SRCS    = pipex.c \
          utils.c

OBJDIR  = obj
OBJS    = $(SRCS:%.c=$(OBJDIR)/%.o)

LIBFTDIR = libft
LIBFT    = $(LIBFTDIR)/libft.a

all: $(NAME)

$(NAME): $(OBJS) force_libft
	@$(CC) $(OBJS) -L$(LIBFTDIR) -lft -o $(NAME)

force_libft:
	@$(MAKE) -C $(LIBFTDIR)

$(OBJDIR)/%.o: %.c $(HEADER)
	@mkdir -p $(OBJDIR)
	@$(CC) $(CFLAGS) -I. -c $< -o $@

clean:
	@rm -rf $(OBJDIR)
	@make clean -C $(LIBFTDIR)

fclean: clean
	@rm -f $(NAME)
	@make fclean -C $(LIBFTDIR)

re: fclean all

.PHONY: all clean fclean re force_libft