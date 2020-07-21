
usePackage <- function(p)
{
  if (!is.element(p, installed.packages()[,1]))
    install.packages(p, dep = TRUE)
  require(p, character.only = TRUE)
}


usePackage("tidyverse")
usePackage("magrittr")



# From XLSX/CSV -----------------------------------------------------------

data            <-   read_csv(file = "sampling.csv")
data$prod_stage %<>% factor(levels = c("Placement", "Farm", "Abattoir", "Retail"))


# ggplot(data = data, aes(prod_stage, pathogen, fill = did_sample)) +
#   geom_tile(colour = "white") +
#   facet_grid(year~commodity) + 
#   scale_fill_gradient(low = "white", high = "sky blue")


ggplot(data = data, aes(year, pathogen, fill = did_sample)) +
  geom_tile(colour = "white") +
  facet_grid(prod_stage~commodity) + 
  scale_fill_gradient(low = "white", high = "sky blue")

ggsave(
  "cipars_sampling_regime.png",
  plot = last_plot(),
  device = "png",
  path = NULL,
  scale = 1,
  width = 25,
  height = 25,
  units = "cm",
  dpi = 300,
  limitsize = TRUE
)