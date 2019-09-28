## ----setup, include=FALSE------------------------------------------------
options(htmltools.dir.version = FALSE)
knitr::opts_chunk$set(tidy = FALSE, eval = FALSE, highlight = TRUE)

library(tidyverse)


## ----echo=FALSE, eval=TRUE-----------------------------------------------
iris %>% head


## ----echo=FALSE, eval=TRUE-----------------------------------------------
pairs(iris[1:4],
      main="Iris Data", pch=21,
      bg=c("red","green3","blue")[unclass(iris$Species)])


## ----echo=TRUE, eval=TRUE------------------------------------------------
read.table(file = "data/iris_01.csv")


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## read.table(file = "data/iris_01.csv", #el archivo
##            header = , #¿tiene cabezal?
##            sep = ,  #¿cuál separador?
##            quote = , #¿Valores con comillas?
##            #nombres de ...
##            row.names = , #renglones
##            col.names = , #columnas
##            #renglones que no se leen...
##            skip  = #al principio
##            nrows = #cuantos leer despues
##            #y el famoso
##            stringsAsFactors = #...
##            )


## ----echo=TRUE, eval=TRUE------------------------------------------------
my_logic = c(TRUE, TRUE, FALSE)
my_logic
typeof(my_logic)


## ----echo=TRUE, eval=TRUE------------------------------------------------
my_integer = c(7L, 2L, 5L)
my_integer
typeof(my_integer)


## ----echo=TRUE, eval=TRUE------------------------------------------------
my_double = c(7.25, 3, 14)
my_double
typeof(my_double)


## ----echo=TRUE, eval=TRUE------------------------------------------------
my_char = c("Esto", "Es", "1", "de", "muchos", "textos", "TRUE")
my_char
typeof(my_char)


## ----echo=TRUE, eval=TRUE------------------------------------------------
my_factor <- factor(c("interno", "externo", "externo", "interno"))
my_factor

levels(my_factor)
class(my_factor)


## ----echo=TRUE, eval=TRUE------------------------------------------------
typeof(my_factor)
as.numeric(my_factor)


## ----echo=TRUE, eval=TRUE------------------------------------------------
my_iris <- 
read.table(file = "data/iris_01.csv", #el archivo
           header = TRUE, #¿tiene cabezal?
           sep = ",",  #¿cuál separador?
           stringsAsFactors = TRUE#...
           )

head(my_iris)


## ----echo=TRUE, eval=TRUE------------------------------------------------
str(my_iris)


## ----echo=TRUE, eval=TRUE------------------------------------------------
summary(my_iris)


## ----echo=TRUE, eval=TRUE------------------------------------------------
boxplot(my_iris)


## ----echo=TRUE, eval=TRUE------------------------------------------------
pairs(my_iris)


## ----echo=TRUE, eval=FALSE-----------------------------------------------
## my_iris %>%
## ggplot(aes(x = Petal.Length,
##            y = Sepal.Length,
##            colour = Species)) +
##   geom_point() +
##   ggtitle('Especies de Iris',
##           subtitle = "por longitud de pétalo y sépalo")


## ----echo=FALSE, eval=TRUE-----------------------------------------------
my_iris %>% 
ggplot(aes(x = Petal.Length, 
           y = Sepal.Length, 
           colour = Species)) + 
  geom_point() +
  ggtitle('Especies de Iris', 
          subtitle = "por longitud de pétalo y sépalo")


## ----echo=TRUE, eval=TRUE------------------------------------------------
mtcars %>% head


## ----echo=TRUE, eval=TRUE------------------------------------------------
my_iris_tbl <- 
readr::read_csv(file = "data/iris_01.csv")


## ----echo=TRUE, eval=TRUE------------------------------------------------
my_iris_tbl


## ----echo=TRUE, eval=TRUE------------------------------------------------
my_iris_tbl %>% str


## ----echo=TRUE, eval=TRUE, error=TRUE------------------------------------
my_iris_tbl %>% boxplot()


## ----eval=TRUE, echo=TRUE------------------------------------------------
my_iris_dt = data.table::fread(input = "data/iris_01.csv")
my_iris_dt


## ----eval=TRUE, echo=TRUE------------------------------------------------
my_iris_dt %>% str


## ----eval=TRUE, echo=TRUE------------------------------------------------
my_iris_vroom = vroom::vroom(file = "data/iris_01.csv")



## ----eval=TRUE, echo=TRUE------------------------------------------------
my_iris_vroom



## ----eval=TRUE, echo=TRUE------------------------------------------------
readxl::read_xlsx(path = "data/datasets_clasicos.xlsx")



## ----eval=TRUE, echo=TRUE------------------------------------------------
readxl::read_xlsx(path = "data/datasets_clasicos.xlsx", 
                  sheet = 1)


## ----eval=TRUE, echo=TRUE------------------------------------------------
readxl::read_xlsx(path = "data/datasets_clasicos.xlsx", 
                  sheet = 2)


## ----eval=TRUE, echo=TRUE------------------------------------------------
readxl::read_xlsx(path = "data/datasets_clasicos.xlsx", 
                  sheet = "USarrests")


## ----eval=TRUE, echo=TRUE------------------------------------------------
readxl::read_xlsx(path = "data/datasets_clasicos.xlsx", 
                  sheet = 4)


## ----eval=TRUE, echo=TRUE------------------------------------------------
readxl::read_xlsx(path = "data/datasets_clasicos.xlsx", 
                  sheet = 4, 
                  skip = 1)


## ----eval=TRUE, echo=TRUE------------------------------------------------
my_genes <- vroom::vroom("data/genes_500.txt")
my_genes


## ----eval=TRUE, echo=TRUE------------------------------------------------
my_genes <- janitor::clean_names(dat = my_genes, 
                                 case = "snake")
my_genes


## ----eval=TRUE, echo=TRUE, error=TRUE------------------------------------
otro_iris_mas <- iris
save(otro_iris_mas, file = "results/iris_forever.RData")
rm(otro_iris_mas)
otro_iris_mas


## ----eval=TRUE, echo=TRUE, error=TRUE------------------------------------
load("results/iris_forever.RData")
otro_iris_mas


## ----eval=TRUE, echo=TRUE, error=TRUE------------------------------------
otro_iris_mas <- iris
save.image(file = "results/sesion_01.RData")


## ----eval=TRUE, echo=TRUE, error=TRUE------------------------------------
otro_iris_mas <- iris
rm(list=ls()) #¡cuidado con este comando!
my_iris


## ----eval=TRUE, echo=TRUE, error=TRUE------------------------------------
load("results/sesion_01.RData")
otro_iris_mas %>% head
my_iris_vroom


## ----eval=TRUE, echo=TRUE, error=TRUE------------------------------------
saveRDS(object = my_iris_vroom, 
        file = "results/my_iris_vroom.RDS"
        )

load("results/my_iris_vroom.RDS")


## ----eval=TRUE, echo=TRUE, error=TRUE------------------------------------
my_iris_vroom_again <- readRDS(file = "results/my_iris_vroom.RDS")
my_iris_vroom_again


## ----eval=FALSE, echo=TRUE, error=TRUE-----------------------------------
## write.table(x = mtcars,
##             file = "results/otro_mtcars.txt",
##             sep = "\t",
##             quote = FALSE,
##             row.names = TRUE,
##             col.names = TRUE)
## 

