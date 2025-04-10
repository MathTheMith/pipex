# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/21 04:55:24 by math              #+#    #+#              #
#    Updated: 2025/04/11 01:37:27 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= libft.a
SRCS	= ft_putstr_fd.c ft_split.c ft_strjoin.c ft_strnstr.c \
		  ft_putchar_fd.c ft_strdup.c ft_strlcpy.c
OBJS	= $(SRCS:.c=.o)

HEADER	= ./
MAKEFLAGS += --no-print-directory

CC		= cc
CFLAGS	= -Wall -Wextra -Werror

# Couleurs
GREEN	= \033[1;32m
ROSE	= \033[1;35m
RESET	= \033[0m

%.o: %.c
	@echo "$(ROSE)[Compiling] $<$(RESET)"
	@$(CC) $(CFLAGS) -I $(HEADER) -c $< -o $@

$(NAME): $(OBJS)
	@ar rc $(NAME) $(OBJS)

all: print_start $(NAME) print_done

clean:
	@rm -f $(OBJS)

fclean: clean
	@rm -f $(NAME)

re: fclean all

print_start:
	@echo "$(GREEN)Compilation de libft...$(RESET)"

print_done:
	@echo "$(GREEN)Libft terminée ✅$(RESET)"

.PHONY: all clean fclean re print_start print_done
