# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvachon <mvachon@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/21 04:55:24 by math              #+#    #+#              #
#    Updated: 2025/04/11 19:58:01 by mvachon          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

NAME    = libft.a
SRCS    = ft_putstr_fd.c ft_split.c ft_strjoin.c ft_strnstr.c \
          ft_putchar_fd.c ft_strdup.c ft_strlcpy.c
OBJS    = $(SRCS:.c=.o)

HEADER  = libft.h
MAKEFLAGS += --no-print-directory

CC      = cc
CFLAGS  = -Wall -Wextra -Werror

# Couleurs
GREEN   = \033[1;32m
GRAY    = \033[1;30m
RESET   = \033[0m

%.o: %.c
	@echo "$(GRAY)Compilation de $<$(RESET)"
	$(CC) $(CFLAGS) -I. -c $< -o $@

$(NAME): $(OBJS)
	@ar rc $(NAME) $(OBJS)

all: print_start $(NAME) print_done

clean:
	@rm -f $(OBJS)

fclean: clean
	@rm -f $(NAME)

re: fclean all

print_start:
	@echo "$(GREEN)📦 Compilation de libft...$(RESET)"

print_done:
	@echo "$(GREEN)✅ Libft terminée !$(RESET)"

.PHONY: all clean fclean re print_start print_done
