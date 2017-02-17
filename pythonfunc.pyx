# a pure Python function

def sum(a,b):
    global aconst

    print "Hey, I'm Python!"
    return a + b

cdef public int csum(int a,int b):
    return sum(a,b)

