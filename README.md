# Monte Carlo Simulation for Card Draw Probability

## Table of Contents

- [Project Overview](#project-overview)
- [Results](#results)
- [Assumptions and Limitations](#assumptions-and-limitations)
- [How to Run](#how-to-run)
- [Parameter Details](#parameter-details)
- [Changing Parameters](#changing-parameters)

## Project Overview

This project is a Monte Carlo simulation designed to calculate the probability of drawing a certain number of lands by a specific turn in a card game. The simulation considers different numbers of lands and cantrips in the deck, and outputs the probability of having at least four lands by turns 4, 5, 6, and 7.

## Results

The simulation results for different numbers of cantrips are as follows:

### Number of Cantrips: 8
| Lands/Turns | Turn 4 | Turn 5 | Turn 6 | Turn 7 |                                                                                                                       
|------------| --- | --- | --- | --- |                                                                                                                                    
| Lands 19 | 91.0 | 96.6 | 99.0 | 99.8 |                                                                                                                                  
| Lands 20 | 93.6 | 97.8 | 99.4 | 99.8 |                                                                                                                                  
| Lands 21 | 95.2 | 98.5 | 99.6 | 99.9 |
| Lands 22 | 96.3 | 99.2 | 99.8 | 99.9 |

### Number of Cantrips: 9
| Lands/Turns | Turn 4 | Turn 5 | Turn 6 | Turn 7 |
|------------| --- | --- | --- | --- |
| Lands 19 | 92.7 | 97.3 | 99.1 | 99.8 |
| Lands 20 | 95.1 | 98.4 | 99.7 | 99.9 |
| Lands 21 | 96.3 | 98.8 | 99.7 | 100.0 |
| Lands 22 | 97.5 | 99.4 | 99.9 | 100.0 |

### Number of Cantrips: 10
| Lands/Turns | Turn 4 | Turn 5 | Turn 6 | Turn 7 |
|------------| --- | --- | --- | --- |
| Lands 19 | 94.2 | 98.2 | 99.5 | 99.9 |
| Lands 20 | 96.0 | 98.7 | 99.7 | 99.9 |
| Lands 21 | 96.9 | 99.1 | 99.8 | 100.0 |
| Lands 22 | 98.0 | 99.5 | 99.9 | 100.0 |

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

### Parameter Details

The simulation is controlled by several parameters defined in the `main.R` file:

- **Number of Simulations (`num_simulations`)**: This parameter sets the number of iterations for the simulation. A higher number of simulations will yield more accurate results but will take longer to compute. The default is set to 10,000.

- **Deck Size (`deck_size`)**: This represents the total number of cards in the deck. The standard deck size is 60 cards.

- **Number of Lands (`num_lands_range`)**: This range specifies the different numbers of lands to simulate within the deck. The simulation will run for each value in this range, which is set from 19 to 22 lands.

- **Turns (`turns`)**: This vector defines the specific turns for which the probabilities of drawing lands are calculated. The default turns are 4, 5, 6, and 7.

- **Number of Cantrips (`num_cantrips_range`)**: This range specifies the different numbers of cantrips to simulate within the deck. The simulation will run for each value in this range, which is set from 8 to 10 cantrips.

- **Cantrip Probabilities (`cantrip_prob_2` and `cantrip_prob_3`)**: These parameters define the probabilities of drawing 2 or 3 cards when a cantrip is played. By default, there is a 50% chance to draw 2 cards (`cantrip_prob_2`) and a 50% chance to draw 3 cards (`cantrip_prob_3`).

### Changing Parameters

- **Number of Simulations**: Modify `num_simulations` to change the number of iterations for the simulation.
- **Deck Size**: Adjust `deck_size` to reflect the total number of cards in the deck.
- **Number of Lands**: Change `num_lands_range` to set the range of lands to simulate.
- **Turns**: Update `turns` to specify which turns to calculate probabilities for.
- **Number of Cantrips**: Modify `num_cantrips_range` to set the range of cantrips to simulate.
- **Cantrip Probabilities**: Adjust `cantrip_prob_2` and `cantrip_prob_3` to change the probabilities of drawing 2 or 3 cards with a cantrip.
