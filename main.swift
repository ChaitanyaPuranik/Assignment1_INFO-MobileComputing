
import Foundation

func main() {
    print("Enter the name of the Player:")
    guard let playerName = readLine() else {
        print("Invalid input. Exiting the game.")
        return
    }

    let game = CardGame(playerName: playerName)
    
    while !game.isGameOver() {
        print("Choose a card position (0 to \(game.deck.cards.count - 1)):")
        guard let choiceString = readLine(), let choice = Int(choiceString), choice >= 0 && choice < game.deck.cards.count else {
            print("Invalid choice. Please enter a valid position.")
            continue
        }

        if let result = game.playRound(playerChoice: choice) {
            print("\(result.winner) won this round and scored \(result.points) points.")
        }
    }

    print("The game is over.")
    print("Final Scores:")
    print("\(playerName): \(game.getPlayerPoints()) points")
    print("System: \(game.getSystemPoints()) points")
    print("The winner is: \(game.determineWinner())")
}

main()
