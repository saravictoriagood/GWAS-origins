
library(Rcpp)
library(ggplot2)
#install.packages("dplyr", dependencies = T)
library(dplyr)
CLG <- read.csv(file = "plot_CLG_GWAS_LogP_new_noUn.csv", strip.white=TRUE, fill = TRUE, header = TRUE) 
hapmap<-read.table(file = "hapmap_count_X.txt", strip.white=TRUE, fill = TRUE, header = TRUE)
colnames(hapmap) <- c("Chrom", "position", "count")
colnames(CLG) <- c("Chrom", "position", "log_P", "CLG", "rsID")
CLG$Chrom<-sapply(CLG$Chrom, as.character)
CLG$Chrom <- factor(CLG$Chrom,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"))
hapmap$Chrom <- factor(hapmap$Chrom,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"))


C1 <- ggplot() + geom_line(data = hapmap, aes(x=position, y=(count+8)), color='gray80', size=0.3) +
  geom_point(data = CLG, aes(x=position, y=(log_P), color=CLG), size=0.3) + 
  scale_y_continuous(trans = 'log2', sec.axis = 
                       sec_axis(trans=~.-8, 
                                name = "Density of Hapmap SNPs (log)", 
                                breaks = list(c(0,10,100,500))[[1]], 
                                labels = list(c(0,10,100,500))[[1]]))+
  facet_wrap("Chrom", scales="free_x", shrink=FALSE, 
             labeller = labeller(Chrom = c("1" = "1","2" = "2", "3" = "3","4" = "4","5" = "5","6" = "6","7" = "7", "8" = "8",
                                           "9" = "9",  "10" = "10",  "11" = "11",  "12" = "12", "13" = "13",  "14" = "14", "15" = "15",                                                   
                                           "16" = "16",  "17" = "17","18" = "18",  "19" = "19", "20" = "20",                          
                                           "21" = "21",   "22" = "22",  "23" = "X"))) +                      
 
  labs(y = "GWAS Log_(P)", x="position(Mb)") + theme_bw()+
  
  theme(strip.background = element_blank())+
  scale_x_continuous(labels=function(x)x/1000000)+
  theme(legend.position="bottom")+
  scale_colour_manual(values=c("A"= "#5f68c3", "B"="#5ab84f", "C"= "#9452c4", "D"= "#b6b236", "E" = "#c74bac","F" ="#457e44","G" ="#d9457f", "H"= "#52bea5", "I" = "#d4424c",
                               "J"="#6d96d2","K"= "#cf572a", "L"= "#c081da","M"= "#95a957","N"="#9d4869","O"="#da9542","P"="#d884af","Q"="#8a7433", "Un" = "#737270"))+
  theme(legend.text=element_text(size=10))+
   guides(colour = guide_legend(override.aes = list(size=3), nrow=1))+
  theme(strip.text = element_text(size=8))


C1
dev.off()