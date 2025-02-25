
# New comment

#' Carbon Sequestration by Mangrove Trees 
#'
#' This function estimates the carbon stored in mangrove trees
#' @param biomass_per_tree tree biomass (kg) per tree
#' @param trees number of trees
#' @param carbon_fraction fraction of biomass that is carbon (default = 0.451 from IPCC 2013)
#' @return total carbon stored in the trees (kg C)
#'
#' function definition
mangrove_trees_carbon = function(biomass_per_tree, trees, carbon_fraction = 0.451) {
  
  # Exit the function prematurely based on invalid inputs
  if (any(trees < 0)) {
    stop("Number of trees cannot be less than 0")
  }
  
  # It is known that biomass greater than 1,000,000 kilograms is very unlikely 
  # so if we get that something is probably wrong so we warn the user 
  # (but we let the function continue just in case) 
  if (any(biomass_per_tree > 1000000)) {
    warning("Unrealistically high biomass (kg)")
  }
  
  # Calculate total biomass for all trees (assuming all trees have the same biomass)
  total_biomass = biomass_per_tree * trees
  
  # Calculate total carbon stored (kg C)
  total_carbon = total_biomass * carbon_fraction
  
  return(total_carbon)
}
