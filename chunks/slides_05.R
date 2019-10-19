## ----setup, include=FALSE------------------------------------------------
options(htmltools.dir.version = FALSE)
knitr::opts_chunk$set(tidy = FALSE, eval = FALSE, highlight = TRUE)

library(tidyverse)


## ----eval=TRUE, echo=TRUE------------------------------------------------
iris %>% head



## ----echo=TRUE, warning=FALSE--------------------------------------------
iris %>%
  ggplot(mapping = aes(x = Petal.Length, 
                       y = Petal.Width, 
                       colour = Species
                       )
         ) +
  geom_point()


## ----echo=FALSE, eval=TRUE-----------------------------------------------
iris %>%
  ggplot(mapping = aes(x = Petal.Length, 
                       y = Petal.Width, 
                       colour = Species
                       )
         ) +
  geom_point()


## ----echo=FALSE, eval=TRUE-----------------------------------------------
iris %>%
  ggplot(mapping = aes(x = Petal.Length, 
                       y = Petal.Width, 
                       fill = Species
                       )
         ) +
  geom_point(shape=23)


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## iris %>%
##   ggplot(mapping = aes(x = Petal.Length,
##                        y = Petal.Width,
##                        fill = as.factor(Species)
##                        )
##          ) +
##   geom_point(shape=23) +
##   labs(
##     title = "IRIS",
##     subtitle = "Dispersión de dimensión de pétalos",
##     caption = "Acá va el pie de figura ...",
##     x = quote(sum(x[i] ^ 2, i == 1, n)),
##     y = quote(alpha + beta + frac(delta, theta))
## ) +
##   theme_bw() +
##   theme(legend.position = "bottom") +
##   scale_fill_manual(
##     values = c("yellow", "blue", "green"),
##     name = "Species"
##   ) +
##   facet_wrap(~Species)


## ----echo=FALSE, eval=TRUE-----------------------------------------------
iris %>%
  ggplot(mapping = aes(x = Petal.Length, 
                       y = Petal.Width, 
                       fill = as.factor(Species)
                       )
         ) +
  geom_point(shape=23) +
  labs(
    title = "IRIS",
    subtitle = "Dispersión de dimensión de pétalos",
    caption = "Acá va el pie de figura ...",
    x = quote(sum(x[i] ^ 2, i == 1, n)),
    y = quote(alpha + beta + frac(delta, theta))
) +
  theme_bw() +
  theme(legend.position = "bottom") +
  scale_fill_manual(
    values = c("yellow", "blue", "green"),
    name = "Species"
  ) +
  facet_wrap(~Species)


## ----echo=FALSE, eval=TRUE-----------------------------------------------
iris %>%
  ggplot(mapping = aes(x = Petal.Length, 
                       y = Petal.Width, 
                       fill = as.factor(Species)
                       )
         ) +
  geom_point(shape=23) +
  labs(
    title = "IRIS",
    subtitle = "Dispersión de dimensión de pétalos",
    caption = "Acá va el pie de figura ...",
    x = quote(sum(x[i] ^ 2, i == 1, n)),
    y = quote(alpha + beta + frac(delta, theta))
) +
  theme_bw() +
  theme(legend.position = "bottom") +
  scale_fill_manual(
    values = c("yellow", "blue", "green"),
    name = "Species"
  ) +
  facet_wrap(~Species)


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## iris %>%
##   ggplot(mapping = aes(x = Petal.Length,
##                        y = Petal.Width,
##                        fill = as.factor(Species)
##                        )
##          ) +
##   geom_point(shape=23) +
##   labs(
##     title = "IRIS",
##     subtitle = "Dispersión de dimensión de pétalos",
##     caption = "Acá va el pie de figura ...",
##     x = quote(sum(x[i] ^ 2, i == 1, n)),
##     y = quote(alpha + beta + frac(delta, theta))
## ) +
##   theme_bw() +
##   theme(legend.position = "bottom") +
##   scale_fill_manual(
##     values = c("yellow", "blue", "green"),
##     name = "Species"
##   ) +
##   facet_wrap(~Species, scales = "free")


## ----echo=FALSE, eval=TRUE-----------------------------------------------
iris %>%
  ggplot(mapping = aes(x = Petal.Length, 
                       y = Petal.Width, 
                       fill = as.factor(Species)
                       )
         ) +
  geom_point(shape=23) +
  labs(
    title = "IRIS",
    subtitle = "Dispersión de dimensión de pétalos",
    caption = "Acá va el pie de figura ...",
    x = quote(sum(x[i] ^ 2, i == 1, n)),
    y = quote(alpha + beta + frac(delta, theta))
) +
  theme_bw() +
  theme(legend.position = "bottom") +
  scale_fill_manual(
    values = c("yellow", "blue", "green"),
    name = "Species"
  ) +
  facet_wrap(~Species, scales = "free")


## ----eval=FALSE----------------------------------------------------------
## library("cowplot")
## plot_grid(
##   #Los principales ...
##   ...,
##   plotlist = NULL,
##   nrow = NULL, ncol = NULL, cols = NULL, rows = NULL,
##   rel_widths = 1, rel_heights = 1,
##   labels = NULL, label_size = 14,
##   #Adicionales ...
##   align = c("none", "h", "v", "hv"),
##   axis = c("none", "l", "r", "t", "b", "lr", "tb", "tblr"),
##   label_fontfamily = NULL,
##   label_fontface = "bold", label_colour = NULL, label_x = 0,
##   label_y = 1, hjust = -0.5, vjust = 1.5, scale = 1,
##   greedy = TRUE
## )


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## pa <- iris %>%
##   ggplot(
##     mapping = aes(
##       x = Petal.Length,
##       y = Petal.Width,
##       fill = Species
##     )
##   ) +
##   geom_point(shape=23)


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## pa


## ----echo=FALSE, eval=TRUE-----------------------------------------------
pa <- iris %>%
  ggplot(
    mapping = aes(
      x = Petal.Length, 
      y = Petal.Width, 
      fill = Species
    )
  ) +
  geom_point(shape=23)
pa


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## pb <- iris %>%
##   ggplot(
##     mapping = aes(
##       x = Species,
##       y = Petal.Length,
##       fill = Species
##     )
##   ) +
##   geom_boxplot()


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## pb

## ----echo=FALSE, eval=TRUE-----------------------------------------------
pb <- iris %>%
  ggplot(
    mapping = aes(
      x = Species,
      y = Petal.Length, 
      fill = Species
    )
  ) +
  geom_boxplot()
pb


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## pc <- iris %>%
##   ggplot(
##     mapping = aes(
##       x = Species,
##       y = Petal.Width,
##       fill = Species
##     )
##   ) +
##   geom_boxplot()


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## pc

## ----echo=FALSE, eval=TRUE-----------------------------------------------
pc <- iris %>%
  ggplot(
    mapping = aes(
      x = Species,
      y = Petal.Width, 
      fill = Species
    )
  ) +
  geom_boxplot()
pc


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## plot_grid(pa, pb, pc)

## ----echo=FALSE, eval=TRUE-----------------------------------------------
plot_grid(pa, pb, pc)


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## plot_grid(pa, NULL, pb, pc)

## ----echo=FALSE, eval=TRUE-----------------------------------------------
plot_grid(pa, NULL, pb, pc)


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## plot_grid(
##   pa, NULL, pb, pc,
##   labels = c("A", "", "B", "C"))

## ----echo=FALSE, eval=TRUE-----------------------------------------------
plot_grid(
  pa, NULL, pb, pc,
  labels = c("A", "", "B", "C")
)


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## plot_grid(
##   plotlist = list(
##     pa,
##     plot_grid(
##       plotlist = list(pb, pc),
##       labels = c("B", "C"),
##       ncol = 2
##     )
##   ),
##   labels = c("A", ""),
##   nrow = 2, ncol = 1
## )


## ----echo=FALSE, eval=TRUE-----------------------------------------------
plot_grid(
  plotlist = list(
    pa,
    plot_grid(
      plotlist = list(pb, pc),
      labels = c("B", "C"),
      ncol = 2
    )
  ),
  labels = c("A", ""),
  nrow = 2, ncol = 1
)


## ----echo=FALSE, eval=TRUE-----------------------------------------------
plot_grid(
  pc, pa,
  NULL, pb + coord_flip(),
  labels = c("A", "B", "", "C"),
  nrow = 2, ncol = 2
)


## ----echo=FALSE, eval=TRUE-----------------------------------------------
plot_grid(
  pc + theme(legend.position = ""), 
  pa + theme(legend.position = ""),
  NULL, 
  pb + coord_flip() + theme(legend.position = ""),
  labels = c("A", "B", "", "C"),
  nrow = 2, ncol = 2
)


## ----echo=FALSE, eval=TRUE-----------------------------------------------
plot_grid(
  pc + theme(legend.position = ""), 
  pa + theme(legend.position = ""),
  NULL, 
  pb + coord_flip() + theme(legend.position = ""),
  labels = c("A", "B", "", "C"),
  nrow = 2, ncol = 2,
  rel_widths = c(0.3, 0.7),
  rel_heights = c(0.7, 0.3)
)


## ----echo=FALSE, eval=TRUE-----------------------------------------------
plot_grid(
  pc + theme(legend.position = ""), 
  pa + theme(legend.position = ""),
  NULL, 
  pb +
    coord_flip() + 
    theme(legend.position = ""),
  labels = c("A", "B", "", "C"),
  nrow = 2, ncol = 2,
  rel_widths = c(0.3, 0.7),
  rel_heights = c(0.7, 0.3)
)


## ----echo = TRUE, eval = FALSE-------------------------------------------
## <http://example.com>
## [linked phrase](http://example.com)
## ![optional caption text](path/to/img.png)
## <img src="figures/chunkOptions.png" />


## ----echo = TRUE, eval = FALSE-------------------------------------------
## First Header  | Second Header
## ------------- | -------------
## Content Cell  | Content Cell
## Content Cell  | Content Cell

