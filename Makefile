# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nle-biha <nle-biha@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 19:27:19 by nle-biha          #+#    #+#              #
#    Updated: 2021/04/20 15:04:05 by nle-biha         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME	=	cub3D
CC		=	clang
FLAGS	=	-O3 -Wall -Wextra -Werror
SRCS	=	srcs/cub3d.c 
INCS	=	$(addprefix includes/, cub3d.h)
OBJS	=	$(SRCS:.c=.o)


all: $(NAME)


$(NAME): $(OBJS) $(INCS)
	make -C libft
	make -C mlx_linux
	$(CC) $(FLAGS) -I includes -o $(NAME) $(OBJS) -Llibft -lft -Lmlx_linux -lmlx_Linux -lX11 -lbsd -lm -lXext

%.o: %.c $(INCS)
	$(CC) $(FLAGS) -I includes -Imlx_linux -c $< -o $@

clean:
	@make fclean -C libft
	rm -f ${OBJS}

fclean: clean
	rm -f ${NAME}

re: fclean all
