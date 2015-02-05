from __future__ import division
adjacency_matrix = []
item_num = 1589 #the number of the node

#initial the adjacency matrix
for i in range ( item_num ) :
    tmp = []
    for j in range ( item_num ) :
        tmp.append( 0 )
    adjacency_matrix.append( tmp )

fp = open( 'netscience.gml' , 'rU' )
flag=0#record the state in get the relationship of two nodes
raw=0#index the raw of the adjacency matrix
column=0#index the column of the adjacency matrix
for line in fp.readlines():
    tmp=line.split()
    if tmp[0]=='source':
        raw=int(tmp[1])
    if tmp[0]=='target':
        column=int(tmp[1])
        flag=1#we have already get the relationship
    if flag==1:
        #store the relationship of the science paper
        adjacency_matrix[raw][column]=1
        adjacency_matrix[column][raw]=1
        flag=0

fp.close()
#store the raw index that don't have the element 1
#that indicates that there is no relationship between this node with others
index=[]
for i in range(item_num):
    tmp=adjacency_matrix[i]
    if 1 not in tmp:
       index.append(i)

#store the adjacency matrix
fp = open( 'matrix.txt' , 'w')
for i in range( item_num ):

    if i in index:
        continue

    for j in range( item_num ):

        if j in index:
            continue

        fp.write( str( adjacency_matrix[ i ][ j ] ) )
        fp.write( ' ' )
    fp.write( '\n' )
fp.close()
