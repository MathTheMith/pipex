# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/21 04:55:24 by math              #+#    #+#              #
#    Updated: 2025/04/12 14:19:38 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libft.a
CC			= cc
CFLAGS		= -Wall -Wextra -Werror
HEADER		= libft.h
SRCS		= ft_putstr_fd.c ft_split.c ft_strjoin.c ft_strnstr.c \
			  ft_putchar_fd.c ft_strdup.c ft_strlcpy.c

OBJDIR		= ../obj/libft
OBJS		= $(SRCS:%.c=$(OBJDIR)/%.o)

GREEN		= \033[1;32m
GRAY		= \033[1;30m
RESET		= \033[0m

MAKEFLAGS	+= --no-print-directory

all: print_start $(NAME) print_done

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)

$(OBJDIR)/%.o: %.c $(HEADER)
	@mkdir -p $(OBJDIR)
	@echo "$(GRAY)Compilation de $<$(RESET)"
	$(CC) $(CFLAGS) -I. -c $< -o $@

clean:
	@rm -f $(OBJS)

fclean: clean
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re print_start print_done
