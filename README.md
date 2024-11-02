# Monte Carlo Simulation for Card Draw Probability

## Project Overview

This project is a Monte Carlo simulation designed to calculate the probability of drawing a certain number of lands by a specific turn in a card game. The simulation considers different numbers of lands and cantrips in the deck, and outputs the probability of having at least four lands by turns 4, 5, 6, and 7.

## Results

The simulation results for different numbers of cantrips are as follows:

### Number of Cantrips: 8
```
         Turn 4 Turn 5 Turn 6 Turn 7
Lands 19 91.0   96.6   99.0   99.8  
Lands 20 93.6   97.8   99.4   99.8  
Lands 21 95.2   98.5   99.6   99.9  
Lands 22 96.3   99.2   99.8   99.9  
```

### Number of Cantrips: 9
```
         Turn 4 Turn 5 Turn 6 Turn 7
Lands 19 92.7   97.3   99.1   99.8  
Lands 20 95.1   98.4   99.7   99.9  
Lands 21 96.3   98.8   99.7   100.0 
Lands 22 97.5   99.4   99.9   100.0 
```

### Number of Cantrips: 10
```
         Turn 4 Turn 5 Turn 6 Turn 7
Lands 19 94.2   98.2   99.5   99.9  
Lands 20 96.0   98.7   99.7   99.9  
Lands 21 96.9   99.1   99.8   100.0 
Lands 22 98.0   99.5   99.9   100.0 
```

## Assumptions and Limitations

- **Cantrips**: The simulation assumes that cantrips draw multiple cards, which simplifies the actual card selection process. This can affect the results, especially in scenarios where multiple lands are drawn consecutively.
- **Brainstorm Lock**: The simulation does not account for the "brainstorm lock" scenario, where cards are put back on top of the deck.
- **Objective**: The simulation assumes that the primary goal of cantrips is to draw lands, which may not always be the case in actual gameplay.

## How to Run

1. Ensure you have R installed on your system.
2. Run the `main.R` script using an R environment or command line.

```bash
Rscript main.R
```

## Changing Parameters

- **Number of Simulations**: Modify `num_simulations` to change the number of iterations for the simulation.
- **Deck Size**: Adjust `deck_size` to reflect the total number of cards in the deck.
- **Number of Lands**: Change `num_lands_range` to set the range of lands to simulate.
- **Turns**: Update `turns` to specify which turns to calculate probabilities for.
- **Number of Cantrips**: Modify `num_cantrips_range` to set the range of cantrips to simulate.
- **Cantrip Probabilities**: Adjust `cantrip_prob_2` and `cantrip_prob_3` to change the probabilities of drawing 2 or 3 cards with a cantrip.
