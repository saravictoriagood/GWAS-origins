library(chromPlot)
#ACE ALG chromosomes
clgmap2 <- read.csv("CLG_Map_2.csv", header=T)
clgmap2$Colors <-
  ifelse(clgmap2$Group == "A", "blue3",
         ifelse(clgmap2$Group == "B", "chartreuse4",
                ifelse(clgmap2$Group == "C", "coral4",
                       ifelse(clgmap2$Group == "D", "darkgoldenrod",
                              ifelse(clgmap2$Group == "E", "darkorchid1",
                                     ifelse(clgmap2$Group == "F", "forestgreen",
                                            ifelse(clgmap2$Group == "G", "gold4",
                                                   ifelse(clgmap2$Group == "H", "greenyellow",
                                                          ifelse(clgmap2$Group == "I", "lightpink1",
                                                                 ifelse(clgmap2$Group == "J", "lightskyblue",
                                                                        ifelse(clgmap2$Group == "K", "maroon",
                                                                               ifelse(clgmap2$Group == "L", "mediumorchid1",
                                                                                      ifelse(clgmap2$Group == "M", "mediumseagreen",
                                                                                             ifelse(clgmap2$Group == "N", "mediumvioletred",
                                                                                                    ifelse(clgmap2$Group == "O", "orange3",
                                                                                                           ifelse(clgmap2$Group == "P", "plum3",
                                                                                                                  ifelse(clgmap2$Group == "Q", "sandybrown", 
                                                                                                                         ifelse(clgmap2$Group == "Un", "grey85", "grey85"))))))))))))))))))



exp <- read.csv("GTEX_Expression_grouped_March2021_nogene.csv", header=T, stringsAsFactors=FALSE)
exp_brain <- subset(exp, Tissue%in%"Brain")
exp2 <- read.csv("GTEX_Expression_grouped_March2021_nogene_ACE2.csv", header=T, stringsAsFactors=FALSE)

exp_brain2 <- subset(exp2, Tissue%in%"Brain")

chromPlot(gaps=hg_gap, bands=clgmap2, stat=exp_brain2, statName = "Expression", statCol = "Expression", statTyp = "p", annot1=exp, annot2=exp_brain, noHist=FALSE, figCols=5, cex=0.8, spty=16, chr=c(1,2,3, 5,7, 9,11,15,18,19), chrSide=c(1,1,1,1,1,1,-1,1), colAnnot1="gray", colAnnot2="red")
