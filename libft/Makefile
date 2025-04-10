# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/21 04:55:24 by marvin            #+#    #+#              #
#    Updated: 2025/04/10 08:04:06 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME 	= libft.a
SRCS 	= ft_putstr_fd.c ft_split.c ft_strjoin.c ft_strnstr.c ft_putchar_fd.c ft_strdup.c \
			ft_strlcpy.c
OBJS 	= ${SRCS:.c=.o}

HEADER	= ./

CC 		= gcc
CFLAGS 	= -Wall -Wextra -Werror

%.o: %.c
	${CC} ${CFLAGS} -I ${HEADER} -c $< -o $@


$(NAME):	${OBJS}
					@ar rc ${NAME} ${OBJS}

all: 		${NAME}

clean:
					@rm -f ${OBJS} ${OBJS_B}

fclean: 	clean
					@rm -f $(NAME)

re:			fclean all

.PHONY: all clean fclean re