	var frequentElements= new Map();
function majorityCheck(stream,freq)
{
	
	stream=stream.replace(/[^A-Z0-9]/ig, " ");
	stream=stream.replace(/\s\s+/g, ' ');
	stream=stream.trim();
	
	var elements=stream.split(" ");	
	
	console.log(elements);
	
	//k=N/K
	var k =parseInt(elements.length/freq);
	
	
	var list = document.getElementsByClassName("stream-string");
	  for (var i = 0; i < list.length; i++) {
	   list[i].setAttribute("id", "strings" + i);
	  }
	  
	var n=0;
	
	console.log(elements.length);
	
	var i=0;
	
	//First pass
	var intervalId=setInterval(function(){
		document.getElementById("mybutton").style.display = 'none';
		
		document.getElementById("new-button").innerHTML= "<form action='operation.jsp'><button type='submit' class='button-block' id='back-button' disabled>Back</button></form>"

		n=n+1;
		if(i>0 && i<=elements.length)
			{
			var streamDivOld=document.getElementById(("strings"+(i-1).toString()).toString());
			streamDivOld.style.backgroundColor="#fdfdfd";
			}
		
		if(i<elements.length)
			{
			var streamDiv=document.getElementById(("strings"+i.toString()).toString());
			streamDiv.style.backgroundColor="green";
			
			algorithm(elements[i],k);
			
			var list = document.getElementsByClassName("loader-block");
			  for (var m = 0; m < list.length; m++) {
			   list[m].innerHTML="";
			  }
			
			var list1 = document.getElementsByClassName("loader-block1");
			  for (var m = 0; m < list1.length; m++) {
			   list1[m].innerHTML="";
			  }
			
			var p=0;
			frequentElements.forEach(function(value, key) {
			console.log("p ="+p);	  
			var assoDiv=document.getElementById("array"+p.toString());	
			assoDiv.innerHTML=key.toString();
			console.log("p ="+p);	
			var counterDiv=document.getElementById("counter"+p.toString());	
			counterDiv.innerHTML=value.toString();
			p++;
			}, frequentElements);
			
			}
		
		if(i>elements.length)
			{
			
			clearInterval(intervalId);
			document.getElementById("mybutton").disabled = false;
			document.getElementById('state').style.display = "none";
			frequentElements.forEach(function(value, key){
				
			},frequentElements);
		
		var count=0;
		
		var finalDisp=document.getElementById("final-display");
		
		finalDisp.innerHTML=finalDisp.innerHTML+ "<div class='asso' style='color:black;'>Second Pass</div>";
		
		//Second pass
		frequentElements.forEach(function(value, key) {
			count=0;
			finalDisp.innerHTML=finalDisp.innerHTML + "<span><div class='loader-block'>"+key+"</div><br/>";
			for(var j = 0, len3 = elements.length; j < len3; j++)
			{
				
				if(elements[j]==key)
				{
					count++;
				}
			}
			
			finalDisp.innerHTML=finalDisp.innerHTML + "<br><div class='loader-block1'>"+count.toString()+"</div><br/></span><br>";
			
			if(count<freq)
			{	
				frequentElements.delete(key);
			}
		},frequentElements);

		console.log(frequentElements.size);
		
		finalDisp=document.getElementById("final-output");
		
		if(frequentElements.size==0)
			finalDisp.innerHTML="<div class='f-out' id='final-data'>No word has majority </div>";
		else
		{
			finalDisp.innerHTML="<div class='f-out' id='final-data'>Majority word is </div>";
		
			finalDisp=document.getElementById("final-data");
		
			frequentElements.forEach(function(value, key){
					console.log(value+" "+key);
					finalDisp.innerHTML=finalDisp.innerHTML+"<span style='font-weight:bold;'>"+key+"."+"</span>";
			},frequentElements);
		}
			frequentElements.clear();
			document.getElementById("back-button").disabled=false;
			}
		
		i++;
		
	}, 1000);	
}


function algorithm(element,k)
{
	//Already there
	if(frequentElements.has(element))
	{		
		frequentElements.set(element,parseInt(frequentElements.get(element))+1);
	}
	//First entry and Associative array not full
	else if(frequentElements.size <k-1)
	{	
		frequentElements.set(element,1);		
	}
	//Asoociative array full and new entry
	else
	{	
			frequentElements.forEach(function(value, key) {
				  frequentElements.set(key,frequentElements.get(key)-1);
							
			if(frequentElements.get(key)==0)
			{				
				frequentElements.delete(key);
			}
			}, frequentElements);		
	}
}