class CardGame {
    let playerName: String
    var playerPoints: Int = 0
    var systemPoints: Int = 0
    var deck: Deck
    
    init(playerName: String) {
        self.playerName = playerName
        self.deck = Deck()
        self.deck.shuffle()
    }

    func playRound(playerChoice: Int) -> (winner: String, points: Int)? {
    let playerCardOptional = deck.drawCard(position: playerChoice)
    if playerCardOptional == nil {
        return nil
    }
    let playerCard = playerCardOptional!
    
    let systemCardOptional = deck.drawRandomCard()
    if systemCardOptional == nil {
        return nil
    }
    let systemCard = systemCardOptional!
    
    let playerCardValue = playerCard.value
    let systemCardValue = systemCard.value
    
    if playerCardValue > systemCardValue {
        let pointsScored = playerCardValue - systemCardValue
        playerPoints += pointsScored
        return (playerName, pointsScored)
    } else if systemCardValue > playerCardValue {
        let pointsScored = systemCardValue - playerCardValue
        systemPoints += pointsScored
        return ("System", pointsScored)
    } else {
        return ("Tie", 0)
    }
}

}