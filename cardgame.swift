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
}