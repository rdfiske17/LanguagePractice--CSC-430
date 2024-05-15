import random # importing random for card array shuffling
# instatiate global variables
fullDeckOfCards = ["A♠","2♠","3♠","4♠","5♠","6♠","7♠","8♠","9♠","10♠","J♠","Q♠","K♠","A♥","2♥","3♥","4♥","5♥","6♥","7♥","8♥","9♥","10♥","J♥","Q♥","K♥","A♣","2♣","3♣","4♣","5♣","6♣","7♣","8♣","9♣","10♣","J♣","Q♣","K♣","A♦","2♦","3♦","4♦","5♦","6♦","7♦","8♦","9♦","10♦","J♦","Q♦","K♦"]
cards = fullDeckOfCards.copy() # https://www.geeksforgeeks.org/array-copying-in-python/ , copies all the elements from fullDeckOfCards so that it is stored as its own item and not a reference in memory, which will be helpful when you run out of cards in the deck
playerHand = []
hierarchyPreference = []

# shuffleDeck uses the random library to shuffle the cards array
def shuffleDeck():
    global cards
    random.shuffle(cards) # randomoizes the order of cards

# dealCards takes an empty playerHand, draws 6 cards from the card array, and returns the array that is the hand
def dealCards():
    playerHand = []
    while(len(playerHand) < 6): # draws 6 cards
        card = drawCard()
        playerHand.append(card) # but card at the end of playerHand
    return playerHand

# drawCard draws a card from cards. It checks to make sure the deck is not empty before drawing, and if it is recreates the deck, removes all the cards the player has as to only shuffle the non-inplay cards, then allows drawing again
def drawCard():
    global cards # grab cards from the global variables
    hasDrawnCard = False
    while(not hasDrawnCard): # repeat until you successfully draw a card
        if len(cards) > 0:
            newCard = cards.pop(0) # remove the top element from cards and assign newCard the value
            hasDrawnCard = True
        else:
            print("Ran out of cards. Reshuffling Deck.")
            cards = fullDeckOfCards.copy() # https://www.geeksforgeeks.org/array-copying-in-python/      
            for card in playerHand: # for each element in playerHand, do the following
                cards.remove(card) # removes elements from the deck that the player already has
                #print("Removed " + card)
            shuffleDeck() # then shuffle
    return newCard

# makeHandString takes in a hand (array) and creates a string of the cards with commas between them for printing
def makeHandString(hand):
    handString = ""
    for card in hand:
        if(handString == ""):
            handString = card
        else:
            handString = handString + "," + card
    return handString

# checkLogicalResponse checks if the hierarchy specified in the response by the user is in the correct format for extraction
def checkLogicalResponse(orderString):
    isLogicalResponse = True
    hierarchyPreference.clear() # https://www.geeksforgeeks.org/different-ways-to-clear-a-list-in-python/ , removes all items from the array as to start with a clean slate between rounds
    remainingPositions = ["1","2","3","4"] # the valid positions for the four suits
    for character in orderString: # for each character in the received string...
        if(not character == ","): # ignore commas
            isValidCharacter = False
            for number in remainingPositions: # for each position not already extracted from remainingPositions...
                if(character == number):
                    isValidCharacter = True
                    hierarchyPreference.append(int(number)) # add this number next in order to hierarchyPreference of card Suits
                    #print("Added " + str(number) + " to hierarchy")
                    remainingPositions.remove(number) # then remove the position from the array
            if(not isValidCharacter): # if a character is invalid, fail the response
                isLogicalResponse = False
    if(not len(remainingPositions) == 0): # if not all positions have been specified by the user, fail the response
        isLogicalResponse = False
    return isLogicalResponse

# sorts the drawn hand by suit and by value, ascending order (ace high)
def sortCards(currentHand):
    arrangedHand = []
    for card in currentHand: # for each card in the hand, we must find the right position for it
        if(card[0] == "1" and card[1] == "0"): # if a card has a value of 10, that is two characters so we must treat it differently
            currentNumber = 10
            currentSymbol = card[2]
            currentSymbolOrder = getOrder(currentSymbol) # convert the symbol to its hierarchical order
        else: # otherwise, treat all others the same
            currentSymbol = card[1]
            currentSymbolOrder = getOrder(currentSymbol) # convert the symbol to its hierarchical order
            if(card[0] == 'A' or card[0] == 'J' or card[0] == 'Q' or card[0] == 'K'): # if a card is a face card, we must give that face a numeric value
                if(card[0] == 'J'):
                    currentNumber = 11
                if(card[0] == 'Q'):
                    currentNumber = 12
                if(card[0] == 'K'):
                    currentNumber = 13
                if(card[0] == 'A'):
                    currentNumber = 14
            else: # otherwise, the value is as given
                currentNumber = int(card[0])
                
        #print(card)
        if(arrangedHand == []): # if the arrangedHand is empty, assign the first position to the first card to start
            arrangedHand.append(card)
        else:
            i = len(arrangedHand) - 1 # start sorting at the high point of the deck and search until you find one card that it is greater than, otherwise leave it on the end
            arrangedHand.append("") # add an extra slot to arrangedHand since we're adding a card
            tempHand = arrangedHand.copy() # copy the elements of arrangedHand to create a comparison deck
            hasPlacedCard = False
            while(not hasPlacedCard): # until you've found the card's position
                if(i >= 0): # and until you reach the end of the arrangedHand
                    innercard = tempHand[i]
                    #print(card + " vs " + innercard)
                    if(innercard[0] == "1" and innercard[1] == "0"): # same card value extraction as above
                        innerCardNumber = 10
                        innerCardSymbol = innercard[2]
                        innerCardSymbolOrder = getOrder(innerCardSymbol)
                    else:
                        innerCardSymbol = innercard[1]
                        innerCardSymbolOrder = getOrder(innerCardSymbol)
                        if(innercard[0] == 'A' or innercard[0] == 'J' or innercard[0] == 'Q' or innercard[0] == 'K'):
                            if(innercard[0] == 'J'):
                                innerCardNumber = 11
                            if(innercard[0] == 'Q'):
                                innerCardNumber = 12
                            if(innercard[0] == 'K'):
                                innerCardNumber = 13
                            if(innercard[0] == 'A'):
                                innerCardNumber = 14
                        else:
                            innerCardNumber = int(innercard[0])
                    
                    #print("Innercard symbol order: " + str(innerCardSymbolOrder) + ". CurrentCard symbol order: " + str(currentSymbolOrder) + ".")
        
                    if(innerCardSymbolOrder < currentSymbolOrder): #lower symbol order specifies more important
                        #print(innercard + " has the stronger symbol, and thus goes after " + card)
                        arrangedHand[i+1] = innercard
                        arrangedHand[i] = card
                    
                    elif(innerCardSymbolOrder == currentSymbolOrder):
                        if(innerCardNumber > currentNumber):
                            #print(innercard + " has the same symbol as " + card + ", but has the stronger number so, thus goes after")
                            arrangedHand[i+1] = innercard
                            arrangedHand[i] = card
                        if(innerCardNumber < currentNumber):
                            #print(innercard + " has the same symbol as " + card + ", but has the weaker number so, thus goes before")
                            arrangedHand[i] = innercard
                            arrangedHand[i+1] = card
                            hasPlacedCard = True
                    
                    elif(innerCardSymbolOrder > currentSymbolOrder):
                        #print(innercard + " has the weaker symbol, and thus goes before " + card)
                        arrangedHand[i] = innercard
                        arrangedHand[i+1] = card
                        hasPlacedCard = True
                else: #otherwise, it goes on the end
                    #print(card + " goes at the end since it's the weakest card")
                    hasPlacedCard = True
                
                #print("Printing active hand: " + makeHandString(arrangedHand))
                i = i - 1 # move to the next card in the hand
        
        #print("Print round-done hand: " + makeHandString(arrangedHand))
    return arrangedHand

# getOrder is a long tree structure conditional statement that corresponds a card symbol to its hierarchical position as specified by the user
def getOrder(symbol):
    order = -1
    if(hierarchyPreference[0] == 1):
        if(symbol == '♣'):
            order = 1
        else:
            if(hierarchyPreference[1] == 2):
                if(symbol == '♦'):
                    order = 2
                else:
                    if(hierarchyPreference[2] == 3):
                        if(symbol == '♠'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 4):
                                if(symbol == '♥'):
                                    order = 4 # club, diamond, spade, heart
                    if(hierarchyPreference[2] == 4):
                        if(symbol == '♥'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 3):
                                if(symbol == '♠'):
                                    order = 4 # club, diamond, heart, spade
            if(hierarchyPreference[1] == 3):
                if(symbol == '♠'):
                    order = 2
                else:
                    if(hierarchyPreference[2] == 2):
                        if(symbol == '♦'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 4):
                                if(symbol == '♥'):
                                    order = 4 # club, spade, diamond, heart
                    if(hierarchyPreference[2] == 4):
                        if(symbol == '♥'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 2):
                                if(symbol == '♦'):
                                    order = 4 # club, spade, heart, diamond
            if(hierarchyPreference[1] == 4):
                if(symbol == '♥'):
                    order = 2
                else:
                    if(hierarchyPreference[2] == 2):
                        if(symbol == '♦'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 3):
                                if(symbol == '♠'):
                                    order = 4 # club, heart, diamond, spade
                    if(hierarchyPreference[2] == 3):
                        if(symbol == '♠'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 2):
                                if(symbol == '♦'):
                                    order = 4 # club, heart, spade, diamond
    if(hierarchyPreference[0] == 2):
        if(symbol == '♦'):
            order = 1
        else:
            if(hierarchyPreference[1] == 1):
                if(symbol == '♣'):
                    order = 2
                else:
                    if(hierarchyPreference[2] == 3):
                        if(symbol == '♠'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 4):
                                if(symbol == '♥'):
                                    order = 4 # diamond, club, spade, heart
                    if(hierarchyPreference[2] == 4):
                        if(symbol == '♥'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 3):
                                if(symbol == '♠'):
                                    order = 4 # diamond, club, heart, spade
            if(hierarchyPreference[1] == 3):
                if(symbol == '♠'):
                    order = 2
                else:
                    if(hierarchyPreference[2] == 1):
                        if(symbol == '♣'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 4):
                                if(symbol == '♥'):
                                    order = 4 # diamond, spade, club, heart
                    if(hierarchyPreference[2] == 4):
                        if(symbol == '♥'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 1):
                                if(symbol == '♣'):
                                    order = 4 # diamond, spade, heart, club
            if(hierarchyPreference[1] == 4):
                if(symbol == '♥'):
                    order = 2
                else:
                    if(hierarchyPreference[2] == 1):
                        if(symbol == '♣'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 3):
                                if(symbol == '♠'):
                                    order = 4 # diamond, heart, club, spade
                    if(hierarchyPreference[2] == 3):
                        if(symbol == '♠'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 1):
                                if(symbol == '♣'):
                                    order = 4 # diamond, heart, spade, club
    if(hierarchyPreference[0] == 3):
        if(symbol == '♠'):
            order = 1
        else:
            if(hierarchyPreference[1] == 1):
                if(symbol == '♣'):
                    order = 2
                else:
                    if(hierarchyPreference[2] == 2):
                        if(symbol == '♦'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 4):
                                if(symbol == '♥'):
                                    order = 4 # spade, club, diamond, heart
                    if(hierarchyPreference[2] == 4):
                        if(symbol == '♥'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 2):
                                if(symbol == '♦'):
                                    order = 4 # spade, club, heart, diamond
            if(hierarchyPreference[1] == 2):
                if(symbol == '♦'):
                    order = 2
                else:
                    if(hierarchyPreference[2] == 1):
                        if(symbol == '♣'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 4):
                                if(symbol == '♥'):
                                    order = 4 # spade, diamond, club, heart
                    if(hierarchyPreference[2] == 4):
                        if(symbol == '♥'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 1):
                                if(symbol == '♣'):
                                    order = 4 # spade, diamond, heart, club
            if(hierarchyPreference[1] == 4):
                if(symbol == '♥'):
                    order = 2
                else:
                    if(hierarchyPreference[2] == 1):
                        if(symbol == '♣'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 2):
                                if(symbol == '♦'):
                                    order = 4 # spade, heart, club, diamond
                    if(hierarchyPreference[2] == 2):
                        if(symbol == '♦'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 1):
                                if(symbol == '♣'):
                                    order = 4 # spade, heart, diamond, club
    if(hierarchyPreference[0] == 4):
        if(symbol == '♥'):
            order = 1
        else:
            if(hierarchyPreference[1] == 1):
                if(symbol == '♣'):
                    order = 2
                else:
                    if(hierarchyPreference[2] == 2):
                        if(symbol == '♦'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 3):
                                if(symbol == '♠'):
                                    order = 4 # heart, club, diamond, spade
                    if(hierarchyPreference[2] == 3):
                        if(symbol == '♠'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 2):
                                if(symbol == '♦'):
                                    order = 4 # heart, club, spade, diamond
            if(hierarchyPreference[1] == 2):
                if(symbol == '♦'):
                    order = 2
                else:
                    if(hierarchyPreference[2] == 1):
                        if(symbol == '♣'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 3):
                                if(symbol == '♠'):
                                    order = 4 # heart, diamond, club, spade
                    if(hierarchyPreference[2] == 3):
                        if(symbol == '♠'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 1):
                                if(symbol == '♣'):
                                    order = 4 # heart, diamond, spade, club
            if(hierarchyPreference[1] == 3):
                if(symbol == '♠'):
                    order = 2
                else:
                    if(hierarchyPreference[2] == 1):
                        if(symbol == '♣'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 2):
                                if(symbol == '♦'):
                                    order = 4 # heart, spade, club, diamond
                    if(hierarchyPreference[2] == 2):
                        if(symbol == '♦'):
                            order = 3
                        else:
                            if(hierarchyPreference[3] == 1):
                                if(symbol == '♣'):
                                    order = 4 # heart, spade, diamond, club
    return order

# play() contains the main proceedings of the program. It shuffles the cards, gives the user printed statements to guide through traversing the program, and contains the loop that keeps the program running until the user tells it to stop.
def play():
    shuffleDeck()
    print("Welcome to the demonstration of a Card Sorting algorithm. You will be drawing a hand of 6 cards, then you specify an order of importance for each suit. The algorithm will then sort your hand (Ace high) ascending.")
    repeating = True
    while repeating: # repeats the sorting algorithm dialog until the user specifies "no" at the end of a round
        playerHand = dealCards() # deals the player cards
        playerHandAsString = makeHandString(playerHand) # makes the hand printable
        receviedLogicalResponse = False
        order = input("Your hand is " + playerHandAsString + ". Please specify (using numbers below) your card suit hierarchy using commas as delimiters, or no delimiters at all: \n Ex) 1,2,3,4 or 1234 \n 1. ♣Clubs♣ \n 2. ♦Diamonds♦ \n 3. ♠Spades♠ \n 4. ♥Hearts♥ \n")
        while not receviedLogicalResponse: # loops user input until they give a logical response
            isLogicalResponse = checkLogicalResponse(order)
            if(isLogicalResponse):
                receviedLogicalResponse = True
            else: # ask question again if input given is bad
                order = input("Invalid response received. Please follow the format specified below: \n Ex) 1,2,3,4 or 1234 \n 1. ♣Clubs♣ \n 2. ♦Diamonds♦ \n 3. ♠Spades♠ \n 4. ♥Hearts♥ \n")
        # now to sort the cards in that order
        sortedHand = sortCards(playerHand)
        sortedHandAsString = makeHandString(sortedHand)
        print("Sorted Hand: " + sortedHandAsString) # prints the sorted hand as a string
        repeatingQuestionAnswered = False
        again = input("Draw again? Type \"Yes\" or \"No\". \n")
        while not repeatingQuestionAnswered: # loops user input until they give a logical response
            if(again == "Yes" or again == "yes" or again == "y" or again == "\"Yes\"" or again == "\"yes\""): # play again
                repeatingQuestionAnswered = True
                repeating = True
            elif(again == "No" or again == "no" or again == "n" or again =="\"No\"" or again == "\"no\""): # quit program
                repeatingQuestionAnswered = True
                repeating = False
            else: # ask question again if input given is bad
                again = input("Incorect input. Draw again? Type \"Yes\" or \"No\" \n")
    print("Thanks for trying out this algorithm!") # end program
    
play()