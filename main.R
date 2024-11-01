set.seed(42) # For reproducibility

# Parameters
num_simulations <- 10000
deck_size <- 60
num_lands <- 22
turns <- c(4, 5, 6, 7)

num_cantrips <- 10
cantrip_prob_2 <- 0.5 # 50% chance to see 2 cards
cantrip_prob_3 <- 1 - cantrip_prob_2 # 50% chance to see 3 cards

# Monte Carlo Simulation
simulate_draws <- function(turn) {
  success_count <- 0
  
  for (sim in 1:num_simulations) {
    deck <- c(rep("land", num_lands), rep("cantrip", num_cantrips), rep("other", deck_size - num_lands - num_cantrips))
    deck <- sample(deck, deck_size) # Shuffle the deck
    lands_drawn <- 0
    cards_seen <- 0
    cantrip_draws <- 0
    
    # Draw cards until the specified turn
    for (t in 1:turn) {
      card <- deck[cards_seen + 1] # Draw the next card
      cards_seen <- cards_seen + 1
      
      # Check the card type
      if (card == "land") {
        lands_drawn <- lands_drawn + 1
      } else if (card == "cantrip") {
        cantrip_draws <- cantrip_draws + 1
        # Simulate the cantrip seeing 2 or 3 additional cards
        if (runif(1) < cantrip_prob_2) {
          cards_seen <- min(cards_seen + 2, deck_size)
        } else {
          cards_seen <- min(cards_seen + 3, deck_size)
        }
      }
      
      # Stop early if we draw too many lands
      if (lands_drawn > 4) break
    }
    
    # Check if we have exactly 4 lands at the end of the turn
    if (lands_drawn == 4) {
      success_count <- success_count + 1
    }
  }
  
  # Return the probability
  return(success_count / num_simulations)
}

# Run the simulation for each turn
results <- sapply(turns, simulate_draws)

# Display the results
results_df <- data.frame(Turn = turns, Probability = results)
print(results_df)

