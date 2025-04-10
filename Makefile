# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/21 04:55:38 by marvin            #+#    #+#              #
#    Updated: 2025/04/10 08:28:01 by marvin           ###   ########.fr        #
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

all: print_libft force_libft print_pipex $(NAME) print_done

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

print_libft:
	@echo "\033[1;32m Compilation de libft...\033[0m"

print_pipex:
	@echo "\033[1;32m Compilation de pipex...\033[0m"

print_done:
	@echo "\033[1;32m Compilation terminée ✅\033[0m"

.PHONY: all clean fclean re force_libft print_libft print_pipex print_done
