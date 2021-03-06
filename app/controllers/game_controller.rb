require 'tictactoe'

class GameController < ApplicationController

    # Global class parameters
     @@tic_tac_toe_game
     @@game_on

    # Index aka Home
    def index
    end

    def new
        @@game_on = false
    end

    # Create new game with parameters from modal
    def create
        # Fetch parameters from form and send them to view.
        @player1_name = params[:player1_name].to_s
        @player2_name = params[:player2_name].to_s

        # Create new game and mark flag as game on
        @@tic_tac_toe_game = TicTacToeGame.new()
        @@game_on = true
    end

    # Make a move on cell with parameters x and y
    def move
        @valid_move = false
        return if !@@game_on

        # Get parameters for the view.
        @next_player = @@tic_tac_toe_game.current_player
        @x = params[:x].to_i
        @y = params[:y].to_i
        
        # Make a move and check for winner.
        @valid_move = @@tic_tac_toe_game.make_move(@x, @y)
        @winner = @@tic_tac_toe_game.check_winner(@x, @y)

        # Return if there was no valid move.
        return if @valid_move == false

        # Change player to next player.
        @next_player = @@tic_tac_toe_game.change_player

        @@game_on = false if @winner != 0
    end

    def reset
        @@tic_tac_toe_game.reset_game
        @@game_on = true
        @current_player = @@tic_tac_toe_game.current_player
    end

end