dataku=read.delim("clipboard")
install.packages("randomForest")
install.packages("caret",  dep=TRUE)
install.packages("ggplot")
install.packages('e1071', dependencies=TRUE)
library("randomForest")
library("caret")
#---
sampel=sample(1:nrow(dataku),0.75*nrow(dataku),replace=TRUE)
training=data.frame(dataku)[sampel,]
testing=data.frame(dataku)[-sampel,]
#---
str(dataku)
View(dataku)
modelRF=randomForest(as.factor(Keputusan)~.,data=training)
prediksi=predict(modelRF,testing)
hasil=confusionMatrix(table(prediksi,testing$Keputusan))
hasil
                      