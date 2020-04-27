from urllib import request
import re 
i=1
while i<143:
	request.urlretrieve("http://static.ruiwen.com/img/jiaocai/yuwen/shujiaoban/liunianjixiace/%d.jpg"%i,"%d.jpg"%i)
	i=i+1