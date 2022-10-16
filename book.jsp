<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.counter {
    width: 150px;
    margin: auto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.counter input {
    width: 50px;
    border: 0;
    line-height: 30px;
    font-size: 20px;
    text-align: center;
    background: #94c559;
    color: #fff;
    appearance: none;
    outline: 0;
}
.counter span {
    display: block;
    font-size: 25px;
    padding: 0 10px;
    cursor: pointer;
    color: #94c559;
    user-select: none;
}
input[type="date"]:before {
  color: transparent;
  background: none;
  display: block;
  font-size: 18px;
  font-family: 'FontAwesome';
  content: '\f073';
  /* This is the calendar icon in FontAwesome */
  width: 15px;
  height: 20px;
  position: absolute;
  top: 12px;
  right: 6px;
  color: #999;
}



/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}



.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}
@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

</style>
</head>
<body >


<%
String tnm=request.getParameter("tnm");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travelwithus","root","");
	     
            
            PreparedStatement pst=cn.prepareStatement("select * from package where tnm=?");
            pst.setString(1,tnm);
 ResultSet rs=pst.executeQuery();

 if(rs.next())
	{
		

   
            
     String timg,tloc,tdur,tdes,tp;
     tnm=rs.getString("tnm");
     timg=rs.getString("timg");
     
	 tloc=rs.getString("tloc");
	 tdur=rs.getString("tdur");
	 tdes=rs.getString("tdes");
	 tp=rs.getString("tp");
	 
	


	%>
 
    	                                   


<!-- Registration Start -->
    <div class="container-fluid py-5" style="margin: 50px 0;">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-7 mb-5 mb-lg-0" style="border:solid 5px #94c559;">
                    <div class="card border-0">
                        <div class="card-header bg-primary text-center p-4">
                            <h1 class="text-white m-0">Book Now</h1>
                        </div>
                        <div class="card-body rounded-bottom bg-white p-5">
                            <form method= post>
                                <div class="form-group">
                                  <span class="label label-success">Tour Location</span>
                                  <input type="text" class="form-control py-2 px-4"  id=" tloc" name="tloc"  value="<%=tloc %>" readonly required="required" />
                                </div>
                                  <div class="form-row">
                                  
                                  
                                      <div class="control-group col-sm-6">
                                     <span class="label label-success">Tour Price Per Head</span>
                                       <input type="text" class="form-control py-2 px-4" id ="tp" name="tp"  value="<%=tp %>"  readonly required="required" />
                                       </div>
                                
                                 
                                 
                                    <div class="control-group col-sm-6">
                                     <span class="label label-success">Tour Duration in Days</span>
                                    <input type="text" class="form-control py-2 px-4"  id="tdur " name="tdur" value="<%=tdur+" days" %>" readonly required="required" />
                                </div>
                                </div>
                                <br>
    	                                 
             
                              
                                <div class="control-group">
                                 <span class="label label-success">Tour Description</span>
                                <textarea class="form-control py-2 px-4" rows="5" id="tdes" name="tdes"  readonly required="required" ><%=tdes %></textarea>
                                    
                                <p class="help-block text-danger"></p>
                            </div>
                             <div class="control-group col-sm-6">
                              <span class="label label-success">Total People</span>
                            <div class="counter">
  <span class="down" onClick='decreaseCount(event, this)' >-</span>
  <input type="text" value="1" id="tnp" name="tnp"  required="required">
  <span class="up" onClick='increaseCount(event, this)' >+</span>
</div></div>
                            
                            
                             <script>
                             function increaseCount(a, b) {
                            	  var input = b.previousElementSibling;
                            	  var value = parseInt(input.value, 10);
                            	  value = isNaN(value) ? 0 : value;
                            	  value++;
                            	  input.value = value;
                            	  
                            	  
                            	  var p=parseInt(document.getElementById("tp").value);
                            	  var t=parseInt(value);
                              	  var tamt=t*p;
                                  
                            	
                            	  
                            	  document.getElementById("tamt").value=tamt;
                            	}

                            	function decreaseCount(a, b) {
                            	  var input = b.nextElementSibling;
                            	  var value = parseInt(input.value, 10);
                            	  if (value > 1) {
                            	    value = isNaN(value) ? 0 : value;
                            	    value--;
                            	    input.value = value;
                            	    
                            	    var p=parseInt(document.getElementById("tp").value);
                            	    var t=parseInt(value);
                              	  var tamt=t*p;
                              	
                              	  document.getElementById("tamt").value=tamt;
                            	  }
                            	}
                            
                            	 </script> 
                            <br>
                              <div class="form-group">
                                  <span class="label label-success">Depart Date</span>
                                  
                                  <input type="text" class="form-control py-2 px-4" id="ddate" name="ddate" placeholder="dd/mm/yyyy" required="required" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}" oninvalid="this.setCustemValidity('enter date in valid form)" />
                                </div>
                                <br>
                          
    	                                 
             
                               <div class="form-group">
                                  <span class="label label-success">Total Tour Amount</span>
                                  <input type="number" class="form-control py-2 px-4"  id="tamt" name="tamt" readonly  value="<%=tp %>" required="required" />
                                </div>
                                <br>
                              <div class="form-group">
                                  
                                  <a href="termscondition.jsp" target="_blank">Accepts Terms And Conditions</a>
                                  <input type="checkbox" required />
                                </div>
                                <br>
                              
                                <div>
                                   <button class="btn btn-primary btn-block py-3" type="submit" id ="btns" name="btns">Conform Tour</button>
                                     <br><br>
                                    <p><a href="package.jsp">View More Packages</a></p>             
                                    
                                </div>
                            </form>
                             </div>
                        </div>
                    </div>
               
                
               <div class="col-lg-5">
                   <div class="my-class-for-img">
                   <div class="img-fluid">
                   
                   <div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 2</div>
  <img src="<%=timg%>" style="width:100%;border: 2px solid #94c559;">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 2</div>
  <img src="<%=timg%>" style="width:100%;border: 2px solid #94c559;">
  <div class="text"></div>
</div>
<br>
<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
 
</div>

<script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>


</div>
                   
                   
                    
                    </div>
                    
                    
                    
                    
                    
                    
                     </div> 
                
                
               </div>
                </div>
            </div>
   
            </div>
    
    <!-- Registration End -->




<%

}		 
	
	
}

catch(Exception ex)
{
ex.printStackTrace();	
}
 


%>









 </body>
</html>



<%



if(request.getParameter("btns")!=null)
{  
	String amt,dd,loc,dur,des,tp,p,date,nm,x;

    long millis=System.currentTimeMillis();
	
    String em=(String)session.getAttribute("email");
    
	nm=request.getParameter("tnm");
	loc=request.getParameter("tloc");
	dur=request.getParameter("tdur");
	des=request.getParameter("tdes");
	x=request.getParameter("tp");
	p=request.getParameter("tamt");
	dd=request.getParameter("ddate");
	tp=request.getParameter("tnp");
	java.sql.Date d=new java.sql.Date(millis);
	
    date=String.valueOf(d);  
    
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travelwithus","root","");
		
		PreparedStatement pst=cn.prepareStatement("insert into book values (?,?,?,?,?,?,?,?,?,?)");
		pst.setString(1,em);
		pst.setString(2,nm);
		pst.setString(3,loc);
		pst.setString(4,dur);
		pst.setString(5,dd);
		pst.setString(6,des);
		pst.setString(7,x);
		pst.setString(8,tp);
		pst.setString(9,p);
		pst.setString(10,date);
		pst.executeUpdate();
		out.println("<script>alert('Booking Successfull');window.location='package.jsp';</script>");
	}
		
	
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
	

} 

%>
<%@include file="footer.jsp" %>