## ----setup, include=FALSE------------------------------------------------
options(htmltools.dir.version = FALSE)
knitr::opts_chunk$set(tidy = FALSE, eval = FALSE, highlight = TRUE)

library(tidyverse)


## ----eval=TRUE, echo=TRUE------------------------------------------------
iris %>% head



## ----eval=FALSE, echo=TRUE-----------------------------------------------
## plot(
##   x = iris$Petal.Length,
##   y = iris$Petal.Width,
##   col = iris$Species,
##   type = "p", #for points
##   xlab = "Petal.Length",
##   ylab = "Petal.Width"
## )
## legend(
##   legend = levels(iris$Species),
##   col = seq(levels(iris$Species)),
##   x = 1,
##   y = 2.5,
##   lty = 1
## )
## 


## ----eval=TRUE, echo=FALSE-----------------------------------------------
plot(
  x = iris$Petal.Length,
  y = iris$Petal.Width,
  col = iris$Species,
  type = "p", #for points
  xlab = "Petal.Length",
  ylab = "Petal.Width"
)
legend(
  legend = levels(iris$Species),
  col = seq(levels(iris$Species)),
  x = 1,
  y = 2.5,
  lty = 1
)



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


## ----eval=FALSE----------------------------------------------------------
## ggplot(data = <DATA>) +
##   <GEOM_FUNCTION>(
##      mapping = aes(<MAPPINGS>),
##      stat = <STAT>,
##      position = <POSITION>
##   ) +
##   <COORDINATE_FUNCTION> +
##   <FACET_FUNCTION> +
##   <THEME>


## ----eval=FALSE, echo=TRUE-----------------------------------------------
## Nuestros_Datos %>%
##   ggplot()
## 


## ----eval=FALSE, echo=TRUE-----------------------------------------------
## ggplot(data = Nuestros_Datos)


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


## ----eval=FALSE, echo=TRUE-----------------------------------------------
## 
## labs(
##   title = "Mi título",
##   subtitle = "Mi subtítulo",
##   caption = "Un pie de figura"
## )


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## iris %>%
##   ggplot(mapping = aes(x = Petal.Length,
##                        y = Petal.Width,
##                        fill = Species
##                        )
##          ) +
##   geom_point(shape=23) +
##   labs(
##   title = "IRIS",
##   subtitle = "Dispersión de dimensión de pétalos",
##   caption = "Acá va el pie de figura ..."
## )


## ----echo=FALSE, eval=TRUE-----------------------------------------------
iris %>%
  ggplot(mapping = aes(x = Petal.Length, 
                       y = Petal.Width, 
                       fill = Species
                       )
         ) +
  geom_point(shape=23) +
  labs(
  title = "IRIS",
  subtitle = "Dispersión de dimensión de pétalos",
  caption = "Acá va el pie de figura ..."
)


## ----eval=FALSE, echo=TRUE-----------------------------------------------
## 
## labs(
##     x = quote(Petal.Length=sum(x[i] ^ 2, i == 1, n)),
##     y = quote(Petal.Widht=alpha + beta + frac(delta, theta))
##   )


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## iris %>%
##   ggplot(mapping = aes(x = Petal.Length,
##                        y = Petal.Width,
##                        fill = Species
##                        )
##          ) +
##   geom_point(shape=23) +
##   labs(
##     title = "IRIS",
##     subtitle = "Dispersión de dimensión de pétalos",
##     caption = "Acá va el pie de figura ...",
##     x = quote(sum(x[i] ^ 2, i == 1, n)),
##     y = quote(alpha + beta + frac(delta, theta))
## )


## ----echo=FALSE, eval=TRUE-----------------------------------------------
iris %>%
  ggplot(mapping = aes(x = Petal.Length, 
                       y = Petal.Width, 
                       fill = Species
                       )
         ) +
  geom_point(shape=23) +
  labs(
    title = "IRIS",
    subtitle = "Dispersión de dimensión de pétalos",
    caption = "Acá va el pie de figura ...",
    x = quote(sum(x[i] ^ 2, i == 1, n)),
    y = quote(alpha + beta + frac(delta, theta))
)


## ----eval=FALSE, echo=TRUE-----------------------------------------------
## + theme(legend.position = NULL) # remove the legend
## + theme(legend.position = "left")
## + theme(legend.position = "top")
## + theme(legend.position = "bottom")
## + theme(legend.position = "right") # the default


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## iris %>%
##   ggplot(mapping = aes(x = Petal.Length,
##                        y = Petal.Width,
##                        fill = Species
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
##   theme(legend.position = "bottom")


## ----echo=FALSE, eval=TRUE-----------------------------------------------
iris %>%
  ggplot(mapping = aes(x = Petal.Length, 
                       y = Petal.Width, 
                       fill = Species
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
  theme(legend.position = "bottom")


## ----eval=FALSE,echo=TRUE------------------------------------------------
##   scale_x/y/colour/fill_manual/continuos/discrete/log10
##   scale_x_continuous()
##   scale_fill_manual()
##   scale_x_log10()
##   scale_x_continuous(limits = range(iris$Petal.Length))
##   scale_y_continuous(limits = c(min=0, max=10))
##   scale_colour_brewer(palette = "Set1")
##   scale_fill_distiller("spectral")


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
##   )


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
  )


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


## ----echo=TRUE, eval=FALSE, warning=FALSE--------------------------------
## iris %>%
##   ggplot(mapping = aes(x = Petal.Length,
##                        y = Petal.Width,
##                        fill = as.factor(Species)
##                        )
##          ) +
##   geom_point(shape=23) +
##   theme_bw() +
##   theme(legend.position = "bottom") +
##   geom_smooth()


## ----echo=FALSE, eval=TRUE, warning=FALSE--------------------------------
iris %>%
  ggplot(mapping = aes(x = Petal.Length, 
                       y = Petal.Width, 
                       fill = as.factor(Species)
                       )
         ) +
  geom_point(shape=23) +
  theme_bw() +
  theme(legend.position = "bottom") +
  geom_smooth()


## ----eval = TRUE, echo = TRUE--------------------------------------------
iris %>% head
iris %>%
  tidyr::pivot_longer(cols = -Species, names_to = "variables", values_to = "values") %>% 
 head


## ----eval = FALSE, echo = TRUE-------------------------------------------
## iris %>%
##   tidyr::pivot_longer(
##     cols = -Species,
##     names_to = "variables",
##     values_to = "values") %>%
##   ggplot(mapping = aes(x = variables,
##                        y = values,
##                        fill = as_factor(Species))) +
##   geom_boxplot()
## 


## ----eval = TRUE, echo = FALSE-------------------------------------------
iris %>% 
  tidyr::pivot_longer(cols = -Species, names_to = "variables", values_to = "values") %>% 
  ggplot(mapping = aes(x = variables,
                       y = values,
                       fill = as_factor(Species))) + 
  geom_boxplot()



## ----eval = TRUE, echo = FALSE-------------------------------------------
iris %>% 
  tidyr::pivot_longer(cols = -Species, names_to = "variables", values_to = "values") %>% 
  ggplot(mapping = aes(x = variables,
                       y = values)) + 
  geom_violin()



## ----eval=FALSE, echo=TRUE-----------------------------------------------
## datos <- tibble(
##   valores = c(rnorm(100), rnorm(n = 100, mean = 10)))
## datos %>%
##   ggplot(aes(x = valores))+
##   geom_density()


## ----eval=TRUE, echo=FALSE-----------------------------------------------
datos <- tibble(
  valores = c(rnorm(100), rnorm(n = 100, mean = 10)))
datos %>% 
  ggplot(aes(x = valores))+
  geom_density()


## ----eval=TRUE, echo=TRUE------------------------------------------------
  diamonds %>% head


## ----eval=TRUE, echo=TRUE------------------------------------------------
  diamonds %>% 
  ggplot() + 
  geom_bar(
    mapping = aes(x = cut)
  )


## ----eval=TRUE, echo=TRUE------------------------------------------------
  ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))


## ----eval=TRUE, echo=TRUE------------------------------------------------
  ggplot(data = diamonds) + 
  stat_summary(mapping = aes(x = cut, y = depth),
    fun.ymin = min,fun.ymax = max,fun.y = median)


## ----eval=FALSE, echo=TRUE-----------------------------------------------
##   ggplot(data = diamonds) +
##   geom_bar(
##     mapping = aes(x = cut, fill = clarity),
##     position = "dodge"
##   )
## 


## ----eval=TRUE, echo=FALSE-----------------------------------------------
  ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = clarity), 
    position = "dodge"
  )



## ----eval=FALSE, echo=TRUE-----------------------------------------------
## bar <- ggplot(data = diamonds) +
##   geom_bar(
##     mapping = aes(x = cut, fill = cut),
##     show.legend = FALSE,
##     width = 1
##   ) +
##   theme(aspect.ratio = 1) +
##   labs(x = NULL, y = NULL)
## 
## bar + coord_flip()
## bar + coord_polar()
## 


## ----eval=TRUE, echo=FALSE-----------------------------------------------
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()


## ----eval=TRUE, echo=FALSE-----------------------------------------------
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_polar()


## ----eval=FALSE, echo=TRUE-----------------------------------------------
## USArrests %>%
##   rownames_to_column(var = "estado") %>%
##   pivot_longer(cols = -estado, names_to = "type", values_to = "value", values_drop_na = FALSE) %>%
##   ggplot(mapping = aes(x = type, y = estado, fill = value)) +
##   geom_tile() +
##   scale_fill_distiller("spectral")
## 


## ----eval=TRUE, echo =FALSE----------------------------------------------
USArrests %>% 
  rownames_to_column(var = "estado") %>% 
  pivot_longer(cols = -estado, names_to = "type", values_to = "value", values_drop_na = FALSE) %>% 
  ggplot(mapping = aes(x = type, y = estado, fill = value)) +
  geom_tile() + 
  scale_fill_distiller("spectral")



## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

ggsave(plot = bar, filename = "results/bar.pdf")
save(bar, file = "results/bar.RData")


## ----eval=TRUE, echo=TRUE------------------------------------------------
rm(list=ls())
load("results/bar.RData")
bar

