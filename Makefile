# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/21 04:55:38 by marvin            #+#    #+#              #
#    Updated: 2025/04/10 08:09:06 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME    = pipex
CC      = cc
CFLAGS  = -Wall -Wextra -Werror
HEADER  = pipex.h

SRCS    = pipex.c \
          utils.c \
		  error.c

MAKEFLAGS += --no-print-directory

OBJDIR  = obj
OBJS    = $(SRCS:%.c=$(OBJDIR)/%.o)

LIBFTDIR = libft
LIBFT    = $(LIBFTDIR)/libft.a

all: force_libft $(NAME)

$(NAME): $(OBJS) $(LIBFT)
	$(CC) $(OBJS) -L$(LIBFTDIR) -lft -o $(NAME)

$(LIBFT): 
	$(MAKE) -C $(LIBFTDIR)

force_libft:
	@$(MAKE) -C $(LIBFTDIR)

$(OBJDIR)/%.o: %.c $(HEADER)
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -I. -c $< -o $@

clean:
	@rm -rf $(OBJDIR)
	@make clean -C $(LIBFTDIR)

fclean: clean
	@rm -f $(NAME)
	@make fclean -C $(LIBFTDIR)

re: fclean all

.PHONY: all clean fclean re force_libft