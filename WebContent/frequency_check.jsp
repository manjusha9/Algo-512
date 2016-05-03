<!DOCTYPE html>
<%@page import="java.util.*"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Algorithm Animator</title>
    
    
    <link rel="stylesheet" href="css/style_4.css">

    
        <link rel="stylesheet" href="css/style_2.css">

    
        <script src="js/angular1.js"></script>
<script src="js/angular2.js"></script> 
    <script src="js/frequency_check.js"></script>
    
    <style type="text/css">
      body {
  text-align: center;
}
div {
    height:auto;
}

.stream{/* 
  position: absolute; */
  top: 10px;/* 
  left: 430px; */
  background: #fdfdfd;
  padding: 30px;
  width:100%;
  height:auto;
  margin: 10px auto;
  border-radius: 4px;
  display:inline-block;
  
    text-align: left;
    line-height: 200%;
    	word-spacing: 10px;
}
  .stream-string{
  position:relative;
  top=10px;
  left=10px;
  background: #fdfdfd;
  }
.loader-block {
  /* position: relative;
  top: 125px;
  left: 80px; */
  display: inline-block;
  width: 8em;
  height: 2em;
  background: #fdfdfd;
  vertical-align: top;
  }
.f-out{/* 
  position: relative;
  top: 175px;
  left: 80px; */
  display: inline-block;
  width: 100%;
  height: 100%;
  background: #fdfdfd;
}

.button-class{
	
/* 	  position: relative;
  top: 30px;
  left: 10px; */
	
}

.loader
{/* 
	position: relative;
  top: 300px;
  left: 10px; */
}
.loader-block1 {/* 
  position: relative;
  top: 125px;
  left: 160px; */
  display: inline-block;
  width: 3em;
  height: 2em;
  background: #fdfdfd;
  vertical-align: top;
  }

.counter{
/* 	position: relative;
  top: 160px;
  left: -150px; */
	  font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
	  color: #ffffff;
	  font-weight: bold;
	  vertical-align: top;
}
.asso{/* 
  position: relative;
  top: 100px;
  left: 50px; */
	  font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
	  color: #ffffff;
	font-weight: bold;
	
}
.button-block {
 /*  position:relative;
  top:10px;
  left:460px; */
  border: 0;
  
  outline: none;
  border-radius: 0;
  padding: 15px 0;
  font-size: 1rem;
  font-weight: 400;
  text-transform: uppercase;
  letter-spacing: .1em;
  background: #808080;
  color: #ffffff;
    display: block;
    /* 
  width: 200px; */
  -webkit-transition: all 0.5s ease;
          transition: all 0.5s ease;
  -webkit-appearance: none;
}


html,
body {
  height: 100%;
  

}
  </style>
  </head>

  <body>
  <% String stream = request.getParameter("data-stream");
		int freq=Integer.parseInt(request.getParameter("k-value"));
		stream=stream.replaceAll("[^a-zA-Z]+"," ");
		stream=stream.replaceAll("\\s+", " ");
	String[] streamArray =stream.split(" ");
	int k =streamArray.length/freq;
	int i=0;
%>
<table style="width: 100%;">
	<tr><td colspan ="4" style="vertical-align: center; text-align : center">
		<br><h1 style="text-align:center">Frequency Check</h1>
	</td>
	</tr>
	<tr>
	<td style="width:1%;"></td>
	<td style="vertical-align: top; text-align : center; width:30%;">
	<br>
	
	<div class="stream" id="stream" style="overflow-y: auto; min-height: 300px; max-height: 300px;">
		<%for(String str : streamArray)
		{%><span id="strings" class="stream-string" >
		<%=str%>
		</span>
		<%i++;}%>
	</div>
	<br>
	<div >
		
		<div class="button-class">
			<div id="new-button"></div>
		</div>
		<button style="float:center;" "type="submit" class="button-block" id="mybutton" onclick="frequencyCheck('<%=stream%>','<%=freq%>');">Run Simulation</button>        
		<br><br>
		<div id="final-output"></div>
	</div>
	<br>
	</td>
	<td style="width:1%;"></td>
	<td style="vertical-align: center; text-align : center; width:68%;">
	<br><br>
    <div class="loader">
    	<div id="final-display"></div>
    	<div>
	    	<div id="state">
	    		<div class="asso" style="color:black">First Pass</div>
	    		<div>
	    			<div class="asso" style="color:grey">Associative Array</div>
		    		<%for(int j=0;j<=k-2;j++){ 
	    				if(j%6==0)
	    				{
	    					%><br/><br/><%
	    				}
	    			%>
			  		<div class="loader-block" id="array<%=j%>"></div>
					<%} %>	  
				</div>
				<div>
					<div class="counter" style="color:grey">Counter</div>
					<%for(int h=0;h<=k-2;h++){ 
						if(h%6==0)
					    	{
					    		%><br/><br/><%
					    	}
				
					%>
					<div class="loader-block1" id="counter<%=h%>"></div>
			  		<%} %>	
				</div>
	  		</div>	
		</div>
	</div>
	</td>
	</tr>
	
</div>
</table>
    
    
    
  </body>
</html>
