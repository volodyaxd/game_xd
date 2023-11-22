#!/bin/bash

generate_random_number() {
	echo $((RANDOM % 6 + 20))
}

display_sticks() {
	local sticks=$1
	for ((i = 1; i <= sticks; i++)); do
		echo -n "|"
	done
	echo
}

remaining_sticks=$(generate_random_number)
computer_sticks=$(generate_random_number)
echo "Компьютер взял $computer_sticks палочек:"
display_sticks $computer_sticks
while true; do
	read -p "Ваш ход (1, 2 или 3): " user_choice

	if [[ $user_choice =~ [1-3]$ ]]; then
		remaining_sticks=$((remaining_sticks - user_choice))
		echo "Осталось $remaining_sticks палочек"
		display_sticks $remaining_sticks

		if [[ $remaining_sticks -le 0 ]]; then
			echo "Вы победили!"
			break
		fi

		computer_choice=$((4 - user_choice))
		echo "Компьютер взял $computer_choice палочек:"
		display_sticks $computer_choice

		remaining_sticks=$((remaining_sticks - computer_choice))
		echo "Осталось $remaining_sticks палочек:"
		display_sticks $remaining_sticks

		if [[ $remaining_sticks -le 0 ]]; then
			echo "Компьютер победил!"
			break
		fi
	else
		echo "Неверный выбор. Попробуйте снова"
	fi
done
