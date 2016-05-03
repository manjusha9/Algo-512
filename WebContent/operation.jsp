<!DOCTYPE html>
<%@page import="com.models.UserDetails"%>
<%@page import="java.util.*"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    
    <link rel="stylesheet" href="css/style_3.css">

    
        <link rel="stylesheet" href="css/style_2.css">

    <%UserDetails user=(UserDetails)session.getAttribute("user"); 
    %>
	<style type="text/css">
		body, html {
	    overflow-x: hidden; 
	    overflow-y: hidden;
        }
		h1, h2{
		display:inline;
		text-align:center;
		}
		h1:{
		float:left;
		padding:0px;
		margin:0px;
		}
		h2{
		float:right;
		padding:0px;
		margin:0px;
		font-size:100%;
		}
		table{
		padding: 0px;
		margin:0px;
		}
		button, .button button-block{
		padding: 0px;
		margin:0px;
		}
		
		
		
	</style>    
  </head>

  <body>

    <div class="form">
      
      
      <h1>Welcome <%=user.getFirstName() %></h1>
      <h2><a id="logout" href='LogOutServlet' onclick="invalidateSession();">Log Out</a><a> | </a><a href='change_password.jsp'>Change Password</a></h2>
        <div id="signup">
          <form id="myForm" action="frequency_check.jsp" method="post">
          
          <table width="100%">
          <tr>
          <td width="30%">
          
          	<div class="field-wrap">
              <label>
                Select an Operation<span class="req">*</span>
                </label>
            </div>
            <div class="radios">
				Majority Check<input type="radio" name="option" value="majority"
					onchange="document.getElementById('myForm').action = 'majority_check.jsp'; 
								document.getElementById('min_freq').disabled=true;
								document.getElementById('min_freq').style.display='none';
								document.getElementById('k-div').disabled=true;
								document.getElementById('k-div').style.display='none';
								document.getElementById('freq-inp').disabled=true;
								document.getElementById('freq-inp').style.display = 'none';
								document.getElementById('freq-div').style.display='none';
								document.getElementById('freq-div').disabled=true">
				Frequency Check<input type="radio" name="option" value="anim" checked="checked" 
					onchange="document.getElementById('myForm').action = 'frequency_check.jsp';
					document.getElementById('k-div').style.display='block';
					document.getElementById('min_freq').style.display='block';
					document.getElementById('k-div').disabled=false;
					document.getElementById('min_freq').disabled=false;
					document.getElementById('freq-inp').style.display = 'none';
					document.getElementById('freq-inp').disabled=true;
					document.getElementById('freq-div').style.display='none';
					document.getElementById('freq-div').disabled=true">   
            </div>
           
          </td>
          <td width="4%">
          </td>
          <td rowspan="2" width="71%">
            <div class="field-wrap">
              <label id="stream_label">
                Enter the Stream<span class="req">*</span>
              </label>
              <textarea name="data-stream" rows="10" cols="10" required 
                onfocus="document.getElementById('stream_label').style.display='none'"
                oninput="document.getElementById('stream_label').style.display='none'"
                onblur="if (this.value.length == 0) {document.getElementById('stream_label').style.display='block'}"></textarea>
            </div>
        
           
          </td>
          </tr>
          <tr>
          	 <td>
          	 <div class="field-wrap" id="min_freq">
              <label id="min_freq_label">
                Enter the minimum frequency<span class="req">*</span>
              </label>
              <input type="number" id="k-div" name="k-value" value="" required autocomplete="off" 
              oninput="document.getElementById('min_freq_label').style.display='none'"
              onblur="if (this.value.length == 0) {document.getElementById('min_freq_label').style.display='block'; document.getElementById('min_freq_label.disabled=true).}"/>
            </div>
   			
   			<div class="field-wrap" id="freq-div">
   			   <!-- <label id='freq_word_label'>
   			     Enter the frequent word<span class='req'>*</span>
   			   </label>
   			   <input type='text' id='freq-inp' name='k-word' required autocomplete='off'  
   			   oninput="document.getElementById('freq_word_label').style.display='none'"
               onblur="if (this.value.length == 0) {document.getElementById('freq_word_label').style.display='block'; document.getElementById('min_freq_label.disabled=true}"/>
               -->
            </div>
           </td>
          </tr>
   			
          <tr > 
          <td colspan="3"> 
          <button type="submit" class="button button-block">Proceed</button>
          </td></tr>
          </table>
          </form>

        </div>
        
		
        
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>
	
  </body>
</html>
