#!/usr/bin/python
file1 = open("test_vector.txt")
file2 = open("test_vector_result.txt",'wb')
result = [] * 33
while 1:
    line = file1.readline()
    if not line:
        break
    else: 
    	for n in range (33):
    		if line[n] == '0':
    			result.append('0000')
    		elif line[n] == '1':
    			result.append("0001")
    		elif line[n] == '2':
    			result.append("0010")
    		elif line[n] =='3':
    			result.append("0011")
    		elif line[n] =='4':
    			result.append("0100")
    		elif line[n] == '5':
    			result.append("0101")
    		elif line[n] == '6':
    			result.append("0110")
    		elif line[n] == '7':
    			result.append("0111")
    		elif line[n] == '8':
    			result.append("1000")
    		elif line[n] == '9':
    			result.append("1001")
    		elif line[n] == 'A':
    			result.append("1010")
    		elif line[n] == 'B':
    			result.append("1011")
    		elif line[n] == 'C':
    			result.append("1100")
    		elif line[n] == 'D':
    			result.append("1101")
    		elif line[n] == 'E':
    			result.append("1110")
    		elif line[n] == 'F':
    			result.append("1111")
    		elif line[n] == ' ':
    			result.append(' ')

	result.append('\r\n')

	print result
	for binary in result:  
	    # print type(binary) 
		file2.write(binary)

	result = []

file1.close()
file2.close()




