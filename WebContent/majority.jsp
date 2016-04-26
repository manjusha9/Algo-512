<!DOCTYPE html>
<%@page import="java.util.*"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Algorithm Animator</title>
    
    
    <link rel="stylesheet" href="css/normalize1.css">

    
        <link rel="stylesheet" href="css/style1.css">

    
        <script src="js/angular.js"></script>
<script src="js/angular-animate.js"></script> 
    <script src="js/majority.js"></script>
    <style type="text/css">
    body {
  text-align: center;
}
div {
    height:auto;
}

.stream{/* 
  position: absolute; */
  top: 30px;/* 
  left: 430px; */
  background: #fdfdfd;
  padding: 30px;
  min-width:600px;
  max-width: 600px;
  min-height:250px;
  max-height: 250px;
  overflow-y:scroll;
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
  top: 480px;
  left: 600px;
  display: inline-block;
  width: 150px;
  height: 30px;
  background: #fdfdfd;
  vertical-align: top;
  }
.f-out{/* 
  position: relative;
  top: 175px;
  left: 80px; */
  display: inline-block;
  width: 30em;
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
.loader-block1 { 
  top: 580px;
  left: 600px; 
  display: inline-block;
  width: 150px;
  height: 30px;
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
}
.asso{/* 
  position: relative;
  top: 100px;
  left: 50px; */
	  font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
	  color: #ffffff;
	font-weight: bold;
	
}
.button-block {/* 
  position:relative;
  left:500px; */
  
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
  display:inline-block;
  width: 600px;
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
  <br>
  <h1 style="text-align:center;">Majority Check</h1>
  <% String stream = request.getParameter("data-stream");
		
		stream=stream.replaceAll("[^a-zA-Z]+"," ");
		stream=stream.replaceAll("\\s+", " ");
	String[] streamArray =stream.split(" ");
	int freq=streamArray.length/2;
	int k =streamArray.length/freq;
	int i=0;
%>
<div>
	<div class="stream" id="stream">
	<%for(String str : streamArray)
	{%><span id="strings" class="stream-string" >
	<%=str%>
	</span>
	<%i++;}%></div>
	<br/>
    <div class="loader">
    <div id="final-display"></div>
    
    <div id="state">
    	<div class="asso" style="color:black">First Pass</div>
    	<div>
    		<div class="asso">Associative Array</div>
    		<%for(int j=0;j<=k-2;j++){ 
    				if(j==5)
    				{
    					%><br/><br/><%
    				}
    			%>
		  		<div class="loader-block" id="array<%=j%>"></div>
			<%} %>	  
	</div>
	
	<div>
		<div class="counter">Counter</div>
		<%for(int h=0;h<=k-2;h++){ 
			  if(h==5)
			    {
			    	%><br/><br/><%
			    }
		
		%>
		<div class="loader-block1" id="counter<%=h%>"></div>
	  	<%} %>	
	</div>
	</div>
	<div><div id="final-output"></div>
	<div class="button-class"><div id="new-button"></div></div><button type="submit" class="button-block" id="mybutton" onclick="runMajority('<%=stream%>','<%=freq%>');">Check Majority</button>        
	</div>
	</div>
</div>
    

    
    
    
  </body>
</html>
