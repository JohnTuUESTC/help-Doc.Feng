# help-Doc.Feng

This code is to help my senior Doc.Feng to prove the theory he proposed in his recent paper. The paper is about complex networks. Although Doc.Feng is a doctor now, but he is still a freshman in coding. So I help him to do this work. If this paper will be accepted, I will have a nuibi senior. Good luck for him.

Some code in this are written by Doc.Feng, you know, may have some errors. We should be tolerant to him. Everyone is become big from freshman.

This code is to create a network using true data. The data is in "netscience.gml". It's a science paper network.

The code, "adjacency matrix.py", is to get the adjacency matrix of the network.

"drawscatter.m" is to use the adjacency matrix compute the degree distributiuon of the network, and draw it.

"ba_net.m" is to create a scale-free network according to the mechanism that is proposed by Barabási. That is to be a contrast experiment to the truth network. Doc.Feng proposed some theory on BA net, he wants to use the true data to prove the result.

"Aver_Path_Length.m" is to compute the average length of the path in the network. "Clustering_Coefficient.m" is to compute the clustering coefficient of the network. Doc.Feng wants to compare the two indicators of the BA net and the science paper network. But in the truth, that is not comparable. Beacuse I don't know much about complex networks, I cannot tell you why.

"main.m" is the main function of the whole code.

The ".py" file, I write by Python 2.7.8 (64bit), and I use the matlab R2012b to run the ".m" file.