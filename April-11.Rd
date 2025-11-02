library(ape);
library(phangorn);
library(phytools);
library(geiger)

text.string <- "(((((((cow, pig),whale),(bat,(lemur,human))),(robin,iguana)),coelacanth),gold_fish),shark);"

vert.tree<-read.tree(text=text.string)

plot(vert.tree,no.margin=TRUE,edge.width=2,
main="This is phylogenetic plot")

# Creating an unrooted tree

plot(unroot(vert.tree),type="unrooted",no.margin=TRUE,lab4ut="axial", edge.width=2)

# Print edges and nodes in your tree

str(vert.tree)

# Write the tree in a text file

write.tree(vert.tree,file="example.txt")



