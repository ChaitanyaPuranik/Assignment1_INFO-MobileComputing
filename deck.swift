class Deck {
    var cards: [Card]

    init() {
        cards = []
        createDeck()
    }
    
    private func createDeck() {
        for suit in Suit.allCases {
            for face in Face.allCases {
                let card = Card(suit: suit, face: face)
                cards.append(card)
            }
        }
    }

    func shuffle() {
        cards.shuffle()
    }

    func drawCard(at position: Int) -> Card? {
        if position >= 0 && position < cards.count {
            return cards.remove(at: position)
        }
        else { return nil }
    }
    
    func drawRandomCard() -> Card?{
        
        if cards.isEmpty{
            return nil
        }
        else{
            let randomIndex = Int.random(0..<cards.count)
            return cards.remove(in: randomIndex)
        }
    }
}