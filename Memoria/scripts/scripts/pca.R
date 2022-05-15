library("factoextra")
library("hydroTSM")
library("FactoMineR")
library("knitr")
library(magrittr)
muestras<-read.csv("../data/muestras.csv", sep = ";")

rownames(muestras) <- muestras$MUESTRA
muestras <- muestras[,-c(1,6)]
muestras1 <- muestras[,-c(1,2,3,16,17)]
muestras1 <- muestras1[complete.cases(muestras1),]

res.pca <- prcomp(muestras1, scale = TRUE)

res.pca2 <- prcomp(t(muestras1), scale = TRUE)

componentes2 <- res.pca2$x

fviz_eig(res.pca)

fviz_pca_ind(res.pca,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)

fviz_pca_var(res.pca,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)

fviz_pca_biplot(res.pca, repel = TRUE,
                col.var = "#2E9FDF", # Variables color
                col.ind = "#696969"  # Individuals color
)

summary(res.pca2)
stdpca<-do.call(cbind, lapply(res.pca, summary))
kable(stdpca) ## copiar esta salida en el markdown

as.data.frame(smry(muestras)) %>% kable()

tabla1<-as.data.frame(smry(muestras))

res.pca1 <- PCA(muestras1, ncp = 4, graph = FALSE)

res.hcpc <- HCPC(res.pca1, graph = FALSE)

fviz_dend(res.hcpc, 
          cex = 0.7,                     # Label size
          palette = "jco",               # Color palette see ?ggpubr::ggpar
          rect = TRUE, rect_fill = TRUE, # Add rectangle around groups
          rect_border = "jco",           # Rectangle color
          labels_track_height = 0.8      # Augment the room for labels
)

fviz_cluster(res.hcpc,
             repel = TRUE,            # Avoid label overlapping
             show.clust.cent = TRUE, # Show cluster centers
             palette = "jco",         # Color palette see ?ggpubr::ggpar
             ggtheme = theme_minimal(),
             main = "Factor map"
)
