
library(ggplot2)
library(dplyr)
library(pipeR)

args <- commandArgs(trailingOnly = T)
data_path <- args[1]
save_path <- args[2]

data <- read.table(data_path, header=TRUE, stringsAsFactors=FALSE, sep="\t")
data$chr <- factor(data$chr,levels=c(as.character(1:22), "X", "Y"))
data <- data %>% mutate(normal2=ifelse(normal_depth<1000, normal_depth, 1000))
plot <- ggplot(data, aes(start, ratio))
plot + geom_point(aes(color=normal2), size=0.01, shape=4) + scale_color_gradient(low="yellow", high="red") + facet_wrap(~chr) + ylim(c(0,2)) + theme_bw() + theme(axis.text.x=element_text(angle=90)) +ggtitle("RCC163") + guides(color=FALSE)
ggsave(save_path)
