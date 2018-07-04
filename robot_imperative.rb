##########Created_by_Jarver#########
#####робот_в_императивном_стиле#####
##############ПОЛЕ###################ПОЛЕ###################ПОЛЕ######################
print "SELECT SIZE X: "
x = gets.to_i # считывает размер по Х
print "SELECT SIZE Y: "
y = gets.to_i # считываем размер по У
if x <= 0 or y <= 0 # если Х или У равны нулю задать размер 5х6
	x = 5
	y = 6	
end
puts "YOU CHOICE IS: #{x}x#{y}"
arr1 = Array.new(x) { |i| i } #массив первого порядка X
arr2 = Array.new(y) { |i| i } #массив второго порядка Y
i = 0
arr1.each do |bufer| # итерируем по массиву первого порядка Х
	bufer = arr2 # записываем в буфер массив второго порядка У
	arr1[i] = bufer # записываем в массив первого порядка Х по индексу i массив второго порядка Y 
	i = i + 1
end
puts "x:#{arr1}         y:#{arr2}"
##############ПОЛЕ####################ПОЛЕ###################ПОЛЕ######################
##############ПОЛОЖЕНИЕ_РОБОТА_И_НАПРАВЛЕНИЕ##############ПОЛОЖЕНИЕ_РОБОТА_И_НАПРАВЛЕНИЕ##############
print "SELECT ROBOT PLACE ON X: "
robot_x = gets.to_i #считывает расположение робота по X
print "SELECT ROBOT PLACE ON Y: "
robot_y = gets.to_i #считывает расположение робота по Y
if robot_x.between?(0, arr1.length - 1) == false #если робот не находится в пределах от 0 до длинны массива по Х отмена расположения
	puts "Нельзя разместить робота все оси X: "
	robot_x = 0
end
if robot_y.between?(0, arr2.length - 1) == false #если робот не находится в пределах от 0 до длинны массива по Х отмена расположения
	puts "Нельзя разместить робота вне оси У: "
	robot_y = 0
end
while true
puts "#{robot_x} #{robot_y}"
	print "SELECT ROBOT LOOK (N)orth, (S)outh, (W)est, (E)ast: "
	robot_look = gets.strip.capitalize #считывает направление робота
	case robot_look #проверка на совпадение с направлениями N S W E
	when "N"
		puts "ROBOT LOOK ON NORTH"
	when "S"
		puts "ROBOT LOOK ON SOUTH"
	when "W"
		puts "ROBOT LOOK ON WEST"
	when "E"
		puts "ROBOT LOOK ON EAST"
	else 
		puts "CAN'T UNDERSTAND LOOK"
	end
##############ПОЛОЖЕНИЕ_РОБОТА_И_НАПРАВЛЕНИЕ##############ПОЛОЖЕНИЕ_РОБОТА_И_НАПРАВЛЕНИЕ##############
##############ДВИЖЕНИЕ_РОБОТА##############ДВИЖЕНИЕ_РОБОТА############ДВИЖЕНИЕ_РОБОТА#################
	print "MOVE ROBOT? (Y/N): "
	move_choice = gets.strip.capitalize
	if move_choice == "Y"
		if robot_look == "N" ###########################
			robot_y = robot_y + 1
			if robot_y >= arr2.length 
				puts "CAN'T MOVE OUT OF Y > #{arr2.length - 1}"
				robot_y = arr2.length - 1
			end
		end
		if robot_look == "S" #########################
			robot_y = robot_y - 1
			if robot_y <= arr2[0] - 1 
				puts "CAN'T MOVE OUT OF Y < 0"
				robot_y = 0
			end
		end
		if robot_look == "W" ##########################
			robot_x = robot_x - 1
			if robot_x <= arr1[0][0] - 1
				puts "CAN'T MOVE OUT OF X < 0"
				robot_x = 0
			end
		end
		if robot_look == "E" ############################
			robot_x = robot_x + 1
			if robot_x >= arr1.length 
				puts "CAN'T MOVE OUT OF X > #{arr1.length - 1}"
				robot_x = robot_x - 1
			end
		end
	end
	if move_choice == "N" ##########################
		puts "YOU DON'T WANT MOVE ROBOT"
		break
	end
end	
##############ДВИЖЕНИЕ_РОБОТА##############ДВИЖЕНИЕ_РОБОТА############ДВИЖЕНИЕ_РОБОТА#################