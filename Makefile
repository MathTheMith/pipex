# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mvachon <mvachon@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/21 04:55:38 by math              #+#    #+#              #
#    Updated: 2025/04/11 19:57:46 by mvachon          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

NAME        = pipex

HEADER      = pipex.h
LIBF_HEADER = libft/libft.h

CFLAGS      = -Wall -Wextra -Werror

SRC         = pipex.c \
              utils.c \
              error.c

DIR_OBJ     = obj
OBJ         = $(SRC:%.c=$(DIR_OBJ)/%.o)

CC          = gcc

MAKEFLAGS   += --no-print-directory

LIBFT_DIR   = libft
LIBFT_LIB   = $(LIBFT_DIR)/libft.a
LIBFT_HDR   = $(LIBFT_DIR)/libft.h
LIBFT_SRC   = $(wildcard $(LIBFT_DIR)/*.c)

GREEN       = \033[0;32m
BLUE        = \033[0;34m
GRAY        = \033[1;30m
RED          = \033[0;31m
NC          = \033[0m

all: $(NAME)
	@echo "$(GREEN)✅ Compilation terminée !$(NC)"

# Link only if needed: libft rebuilt or objects newer than binary
$(NAME): $(OBJ) $(LIBFT_LIB)
	@echo "$(BLUE)🔧 Linking...$(NC) "
	$(CC) $(CFLAGS) $(OBJ) -L$(LIBFT_DIR) -lft -o $@

# Compile libft only if .a missing or .c changed
$(LIBFT_LIB): $(LIBFT_SRC) $(LIBFT_HDR) $(LIBF_HEADER)
	@echo "$(BLUE)📦 Compilation de la libft...$(NC)"
	$(MAKE) -C $(LIBFT_DIR)

$(DIR_OBJ)/%.o: %.c $(HEADER)
	@mkdir -p $(DIR_OBJ)
	@echo "$(GRAY)Compilation de $<$(NC)"
	$(CC) $(CFLAGS) -I$(LIBFT_DIR) -I. -c $< -o $@

clean:
	@echo "$(RED)🧹 Suppression des fichiers objets...$(NC)"
	rm -rf $(DIR_OBJ)
	@$(MAKE) clean -C $(LIBFT_DIR)

fclean: clean
	@echo "$(RED)🗑️ Suppression de l'exécutable...$(NC)"
	rm -f $(NAME)
	@$(MAKE) fclean -C $(LIBFT_DIR)

re: fclean all

print_libft:
	@echo "$(BLUE)📦 Compilation de la libft...$(NC)"

print_done:
	@echo "$(GREEN)✅ Compilation terminée !$(NC)"

.PHONY: all clean fclean re force_libft print_libft print_done
