from urllib import request
import re 
i=1
while i<138:
	request.urlretrieve("http://static.ruiwen.com/img/jiaocai/yuwen/shujiaoban/yinianjishangce/%d.jpg"%i,"%d.jpg"%i)
	i=i+1