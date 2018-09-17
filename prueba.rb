
puts "give me the number of volume? only one number por example 3 --- = 3x3"
        n = STDIN.gets.chomp
        n = n.to_i
        n = n * n  
        board = Array.new(n)
        (0..n-1).each do |i|
            board[i] = i
        end
        (0..n-1).each do |i|
            print "|_#{board[i]}_|"

            if i==2 || i ==5 || i == 8
                puts "\n"
            end
        end
        puts board.to_s
       