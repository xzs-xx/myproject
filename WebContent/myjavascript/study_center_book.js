
var index=1;
var book;
function putbook(id,bookname,booksrc,bookpage,booktype,path){
	book={"id":id,"bookname":bookname,"booksrc":booksrc,"bookpage":bookpage,"booktype":booktype,"path":path};
}

function init(){
	putnotes();
}
function putnotes(){
	$.ajax({
		type:"post",
		url:"findnotes.do",
		data:{
			"notesbookid":book.id,
			"notespage":index
		},	
		success:function(result){
			var i;
			document.getElementById("putnotetext").innerHTML = "";
			for(i = 0;i<result.length;i++){
				document.getElementById("putnotetext").innerHTML += "<p  onclick='delnotes("+ result[i].id +")'>"+result[i].notestext+"</p>";
			}
		}			
	}); 
}
function savenotes(){
	if($("#notestext").val()!="" && $("#notestext").val()!=null){
		$.ajax({
			type:"post",
			url:"addnotes.do",
			data:{
				"notesbookid":book.id,
				"notespage":index,
				"notestext":$("#notestext").val()
			},	
			success:function(result){
				movenotes($("#notestext").val());
				$("#notestext").val("");
				putnotes();
			}			
		});
		
	}else alert("输入内容");
}

var movel = 1;
var movenum = 50;
var mytime = null;
function movechange(){
	movenum = movenum - 1;
	document.getElementById("shownotes").style.top = "" + movenum + "%";
	if( movenum <=0){
		clearInterval(mytime);
		document.getElementById("shownotes").style.display="none";
	}
}

function movenotes(text){
	movenum = 50;
	document.getElementById("shownotes").style.display="inline";
	document.getElementById("shownotestext").innerHTML = text;
	document.getElementById("shownotes").style.top = "" + movenum + "%";
	mytime = setInterval(movechange, 100);
}

function delnotes(id){
	$.ajax({
		type:"post",
		url:"delnotes.do",
		data:{
			"id":id
		},	
		success:function(result){
			alert(result);
			putnotes();
		}			
	}); 
}

function posnext(changepage){
	index = index + changepage;
	if(index<1){
		alert("第一页");
		index = index + 1;
	}else if(index>book.bookpage){
		alert("最后一页")
		index = index - 1;
	}else{
		putnotes();
		document.getElementById("putbookimg").src = book.path+book.booksrc + "/" + index + ".jpg";
		document.getElementById("modal_putbookimg").src = book.path+book.booksrc + "/" + index + ".jpg";
	}
}
