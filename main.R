set.seed(42) # For reproducibility

# Parameters
num_simulations <- 10000
deck_size <- 60
num_lands <- 22
turns <- c(4, 5, 6, 7)

num_cantrips <- 10
cantrip_prob_2 <- 0.5 # 50% chance to see 2 cards
cantrip_prob_3 <- 1 - cantrip_prob_2 # 50% chance to see 3 cards

# Recursive function to process cards
process_cards <- function(deck, pointer, lands_drawn, mana_available) {
  if (mana_available <= 0 || pointer > length(deck)) {
    return(pointer)
  }
  
  cantrip_index <- which(deck[1:pointer] == "cantrip")[1]
  
  if (!is.na(cantrip_index)) {
    # Process the cantrip
    mana_available <- mana_available - 1
    deck[cantrip_index] <- "cantrip_casted"
    draw_count <- ifelse(runif(1) < cantrip_prob_2, 2, 3)
    pointer <- process_cards(deck, pointer + draw_count, lands_drawn, mana_available)
  }
  
  return(pointer)
}

# Monte Carlo Simulation
simulate_draws <- function(turn) {
  success_count <- 0
  
  for (sim in 1:num_simulations) {
    deck <- c(rep("land", num_lands), rep("cantrip", num_cantrips), rep("other", deck_size - num_lands - num_cantrips))
    deck <- sample(deck, deck_size) # Shuffle the deck
    cards_seen <- 7
    lands_drawn <- sum(deck[1:cards_seen] == "land")
    
    for (t in 1:turn) {
      if (t > 1 || runif(1) > 0.5) {
        cards_seen <- cards_seen + 1
      }
      lands_drawn <- sum(deck[1:cards_seen] == "land")

      # Calculate mana available for the current turn
      mana_available <- min(lands_drawn, t)
      
      # Process cards with available mana
      cards_seen <- process_cards(deck, cards_seen + 1, lands_drawn, mana_available)
    }
    
    # Check if we have exactly 4 lands at the end of the turn
    lands_drawn <- sum(deck[1:cards_seen] == "land")
    if (lands_drawn >= 4) {
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

