#load data 
data <- iris
new <- data[,-5]
str(new)
#load libraries
library(fpc)
library(dbscan)
library(devtools)
install_github("kassambara/factoextra")
library(factoextra)

#EPS
#find optimum level
kNNdistplot(new,k=5)
abline(h=.57,lty=2)
# we need optimum value as: low eps nearer value may throw outliners
# high may get outliners inside cluster

#desity clustering
set.seed(123)
f <- fpc::dbscan(new,eps=0.57,MinPts = 2)
f
d <- dbscan::dbscan(new,0.57,4)
d
#visualization
fviz_cluster(f,new,geom = "point")
fviz_cluster(d,new,geom = "point")
