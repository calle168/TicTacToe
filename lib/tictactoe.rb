class TicTacToeGame

    # @board is the actual 3x3 board for the Tic tac toe game.
    # @current_player is keeping the current player number.
    # @moves keep track on the moves, so we don't exceed 9.
    attr_accessor :board, :current_player, :moves

    # Player 1 will always begin a new game. 
    def initialize
        @current_player = 1
        @moves = 0
        @board = Array.new(3) { Array.new }
    end

    # x is the x-coordinate of the chosen cell.
    # y is the y-coordinate of the chosen cell.
    # returns true if the insertion was successful.
    def make_move(x, y)
        return false if @board[x][y] != nil
        @board[x][y] = @current_player
        @moves = @moves.to_i + 1
        true
    end

    # Overwrites the game board with a new one.
    def reset_game
        @board = Array.new(3) { Array.new }
        @moves = 0
    end

    # x is the x-coordinate of the latest chosen cell.
    # y is the y-coordinate of the latest chosen cell.
    # I'm using the fact that the latest move must be part of the winning
    # solution if there's a winning solution. In this way I'm checking all
    # possible winning solutions.
    # return the winner player number (1 or 2).
    # return 3 if there's a tie.
    # return 0 if there's no winner.
    def check_winner(x ,y)
        n = 3
        col = row = diag = rdiag = 0
        for i in 0..2
            col=col+1 if @board[x][i] == @current_player
            row=row+1 if @board[i][y] == @current_player
            diag=diag+1 if @board[i][i] == @current_player
            rdiag=rdiag+1 if @board[i][n-i-1] == @current_player
        end
        if row == n || col == n || diag == n || rdiag == n
            return @current_player
        end
        return 3 if moves == 9
        return 0
    end

    def change_player
        if @current_player == 1
            @current_player = 2
        else
            @current_player = 1
        end
        @current_player
    end

end