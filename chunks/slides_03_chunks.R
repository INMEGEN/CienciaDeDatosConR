## ----setup, include=FALSE------------------------------------------------
options(htmltools.dir.version = FALSE)
knitr::opts_chunk$set(tidy = FALSE, eval = FALSE, highlight = TRUE)

library(tidyverse)


## ----eval=TRUE, echo=FALSE-----------------------------------------------
my_data <- readxl::read_xlsx(path = "data/datos_sucios.xlsx", sheet = 2)


## ----eval=TRUE, echo=TRUE------------------------------------------------
my_data


## ----eval=TRUE, echo=TRUE------------------------------------------------

x <- 1:10

(exp(sqrt(log(x))))



## ----eval=TRUE, echo=TRUE------------------------------------------------

x <- 1:10

y <- log(x)

z <- sqrt(y)

w <- exp(z)

w



## ----eval=TRUE, echo=TRUE------------------------------------------------

x <- 1:10

x <- log(x)

x <- sqrt(x)

x <- exp(x)

x



## ----eval=TRUE, echo=TRUE------------------------------------------------

x <- 1:10

my_result <-
  
  x %>%
  log() %>% 
  sqrt() %>% 
  exp 
  
my_result



## ----eval=TRUE, echo=FALSE, message=FALSE--------------------------------
library(magrittr)

## ----eval=TRUE, echo=TRUE------------------------------------------------
rnorm(100) %>%
  matrix(ncol = 2) %T>%
  plot() %>%
  str()


## ----eval=TRUE, echo=FALSE, message=FALSE--------------------------------
library(magrittr)

## ----eval=TRUE, echo=TRUE------------------------------------------------
mtcars %$%
  cor(disp, mpg)


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights <- vroom::vroom(file = "data/flights.txt")



## ----eval=TRUE, echo=TRUE------------------------------------------------
flights 



## ----eval=TRUE, echo=TRUE------------------------------------------------
filter(.data = flights, 
       dest  == "SBN")


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  filter(dest  == "HDN")


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  filter(dest  == "HDN",
       !is.na(dep_time)
       )


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  slice(14:17)


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  select(flight, carrier, origin, dest, distance)


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  select(contains("time"))


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  select_if(is_character)


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  select("dest", contains("time")) %>% 
  filter(dest == "HDN") %>% 
  tidyr::drop_na() %>% 
  slice(1:7)


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  pull("dest") %>% 
  head


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  group_by(dest)


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  group_by(dest, origin)


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  summarise(mean_distance = mean(distance))


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  select(contains("time")) %>% 
  summarise(mean_deptime = mean(dep_time),
            mean_sched_deptime = mean(sched_dep_time),
            mean_arr_time = mean(arr_time),
            mean_sched_arr_time = mean(sched_arr_time),
            mean_air_time = mean(air_time),
            mean_time_hour = mean(time_hour)
            )


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  select(contains("time")) %>% 
  summarise_all(mean, na.rm=TRUE)


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  group_by(dest) %>% 
  select(contains("time")) %>% 
  summarise_all(mean, na.rm=TRUE)


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  group_by(origin, dest) %>% 
  select(contains("time")) %>% 
  summarise_all(list(med = median,
                     avg = mean
                     ),
                na.rm = TRUE
                     )
                     


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  group_by(month, origin, dest) %>% 
  summarize(cuantos = n())
                     


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  count()
                     


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  count(origin)
                     


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  group_by(month) %>% 
  count(origin)
                     


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  group_by(month, origin, dest) %>% 
  tally()
                     


## ----eval=TRUE, echo=TRUE------------------------------------------------
flights %>% 
  group_by(origin, dest) %>% 
  summarise(min_airtime = min(air_time, na.rm = TRUE),
            max_airtime = max(air_time, na.rm = TRUE),
            std_dev_airtime = sd(air_time, na.rm = TRUE),
            cuantos = n()
            )
                     


## ----eval=FALSE, echo=TRUE-----------------------------------------------
## flights %>%
##   group_by(origin, dest) %>%
##   summarise(mean_dep_delay = mean(dep_delay, na.rm = TRUE),
##             mean_arr_delay = mean(arr_delay, na.rm = TRUE)
##             ) %>%
##   ggplot(mapping = aes(x = mean_dep_delay,
##                        y = mean_arr_delay,
##                        colour = as_factor(origin)
##                        )
##          ) +
##   geom_point()


## ----eval=TRUE, echo=FALSE, warning=FALSE--------------------------------
flights %>% 
  group_by(origin, dest) %>% 
  summarise(mean_dep_delay = mean(dep_delay, na.rm = TRUE),
            mean_arr_delay = mean(arr_delay, na.rm = TRUE)
            ) %>% 
  ggplot(mapping = aes(x = mean_dep_delay, 
                       y = mean_arr_delay, 
                       colour = as_factor(origin)
                       )
         ) +
  geom_point()


## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------
flights %>% 
  select(carrier, flight, air_time, dep_delay, arr_delay)


## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------
flights %>% 
  select(carrier, flight, air_time, dep_delay, arr_delay) %>% 
  mutate(expected_airtime = air_time - dep_delay - arr_delay)


## ----eval=TRUE, echo=FALSE, warning=FALSE--------------------------------
flights %>% 
  select(carrier, flight, air_time, dep_delay, arr_delay) %>% 
  mutate(total_delay = dep_delay + arr_delay,
         expected_airtime = air_time - total_delay
         )


## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------
my_flights <- 
flights %>% 
  mutate(total_delay = dep_delay + arr_delay,
         expected_airtime = air_time - total_delay
         ) %>% 
  mutate(net_gainloss = case_when(total_delay > 0 ~ "retraso",
                             total_delay == 0 ~ "a_tiempo",
                             total_delay < 0 ~ "adelanto"
                             )
         )



## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------
my_flights


## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------
my_flights %>% 
  select(carrier, flight, air_time, expected_airtime, total_delay, net_gainloss)


## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------
spiderman_raimi <- vroom::vroom(file = "data/spiderman_raimi.csv")
spiderman_amazing <- vroom::vroom(file = "data/amazing_spiderman.csv")


## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------
spiderman_raimi 


## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------
spiderman_amazing 


## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------

dplyr::left_join(x = spiderman_raimi,
                 y = spiderman_amazing,
                 suffix = c("_raimi", "_amazing"),
                 by = c("character" = "character")
                 )


## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------

dplyr::right_join(x = spiderman_raimi,
                 y = spiderman_amazing,
                 suffix = c("_raimi", "_amazing"),
                 by = c("character" = "character")
                 )


## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------

dplyr::semi_join(x = spiderman_raimi,
                 y = spiderman_amazing,
                 suffix = c("_raimi", "_amazing"),
                 by = c("character" = "character")
                 )


## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------

dplyr::full_join(x = spiderman_raimi,
                 y = spiderman_amazing,
                 suffix = c("_raimi", "_amazing"),
                 by = c("character" = "character")
                 )


## ----eval=TRUE, echo=TRUE, warning=FALSE---------------------------------

dplyr::anti_join(x = spiderman_raimi,
                 y = spiderman_amazing,
                 suffix = c("_raimi", "_amazing"),
                 by = c("character" = "character")
                 )


## ----eval=TRUE, echo=FALSE, warning=FALSE, message=FALSE-----------------

my_data <- vroom::vroom("data/calificaciones_untidy.txt")

my_data_tidy <-
my_data %>% 
  gather(-"student", key = "materia", value = "calificacion")

my_data_tidy %>% 
  ggplot(mapping = aes(x = as_factor(student),
                       y = calificacion,
                       colour = as_factor(materia),
                       size = 12
                       )
         ) +
  geom_point(alpha = 0.5) + 
  xlab("student") +
  ylab("calificacion") +
  guides(size=FALSE) +
  theme(axis.text.x = element_text(angle=45))



## ----eval=TRUE, echo=TRUE, warning=FALSE, message=FALSE------------------

my_data <- vroom::vroom("data/calificaciones_untidy.txt")
my_data


## ----eval=FALSE, echo=TRUE, warning=FALSE, message=FALSE-----------------
## my_data %>%
##   ggplot() %>%
##   geom_point(mapping = aes(x = estudiante?????,
##                            y = calificaciones?????
##                            donde pongo las materias???
##                           )
##              )


## ----eval=TRUE, echo=TRUE, warning=FALSE, message=FALSE------------------
my_data_gather <-
my_data %>% 
  gather(-"student", key = "materia", value = "calificacion")

my_data_gather


## ----eval=FALSE, echo=TRUE, warning=FALSE, message=FALSE-----------------
## my_data_gather %>%
##   ggplot(mapping = aes(x = as_factor(student),
##                        y = calificacion,
##                        colour = as_factor(materia),
##                        )
##          ) +
##   geom_point()
## 


## ----eval=TRUE, echo=FALSE, warning=FALSE, message=FALSE-----------------
my_data_gather %>% 
  ggplot(mapping = aes(x = as_factor(student),
                       y = calificacion,
                       colour = as_factor(materia),
                       )
         ) +
  geom_point()



## ----eval=TRUE, echo=TRUE, warning=FALSE, message=FALSE------------------

my_data_melt <-
  my_data %>% 
  reshape2::melt(variable.name = "materia", 
                 value.name = "calificacion", 
                 id.vars = "student")

head(my_data_melt)


## ----eval=TRUE, echo=TRUE, warning=FALSE, message=FALSE------------------

my_data_pivot_longer <-
  my_data %>% 
  tidyr::pivot_longer(cols = -"student", 
                      names_to = "materia", 
                      values_to = "calificacion")

my_data_pivot_longer

