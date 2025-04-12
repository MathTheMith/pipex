# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/21 04:55:38 by math              #+#    #+#              #
#    Updated: 2025/04/12 14:18:56 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= pipex
CC			= cc
CFLAGS		= -Wall -Wextra -Werror
HEADER		= pipex.h

SRCS		= pipex.c \
			  utils.c \
			  error.c

OBJDIR		= obj
OBJS		= $(SRCS:%.c=$(OBJDIR)/%.o)

LIBFTDIR	= libft
LIBFT		= $(LIBFTDIR)/libft.a

MAKEFLAGS	+= --no-print-directory

# Couleurs
GREEN		= \033[1;32m
YELLOW		= \033[1;33m
BLUE		= \033[0;34m
RESET		= \033[0m

all: print_libft force_libft print_pipex $(NAME) print_done

$(NAME): $(OBJS) $(LIBFT)
	@echo "$(BLUE)Linking...$(RESET)"
	$(CC) $(OBJS) -L$(LIBFTDIR) -lft -o $(NAME)

$(LIBFT):
	@$(MAKE) -s -C $(LIBFTDIR)

force_libft:
	@$(MAKE) -s -C $(LIBFTDIR)

$(OBJDIR)/%.o: %.c $(HEADER)
	@mkdir -p $(OBJDIR)
	@echo "$(BLUE)[Compiling] $<$(RESET)"
	$(CC) $(CFLAGS) -I. -c $< -o $@

clean:
	@rm -rf $(OBJDIR)
	@$(MAKE) clean -C $(LIBFTDIR)

fclean: clean
	@rm -f $(NAME)
	@$(MAKE) fclean -C $(LIBFTDIR)

re: fclean all

print_done:
	@echo "$(GREEN)Compilation terminée ✅$(RESET)"

.PHONY: all clean fclean re force_libft print_libft print_pipex print_done
