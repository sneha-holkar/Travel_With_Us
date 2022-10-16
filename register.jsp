 <%@page import="java.sql.*" %>
    <%@page import="java.time.*" %>
    <%@page import="java.time.format.*" %>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
<!-- Registration Start -->
    <div class="container-fluid bg-registration py-5" style="margin: 90px 0;">
        <div class="container py-5">
            <div class="row align-items-center">
               
                <div class="col-lg-7">
                    <div class="card border-0">
                        <div class="card-header bg-primary text-center p-4">
                            <h1 class="text-white m-0">Login Now</h1>
                        </div>
                        <div class="card-body rounded-bottom bg-white p-5">
                            <form method= post>
                                 <div class="form-group">
                                    <input type="text" class="form-control py-2 px-4"  id=" name" name="name" placeholder="Your Name" required="required" />
                                </div>
                                 <div class="form-group">
                                    <input type="email" class="form-control py-2 px-4"  id=" email" name="email" placeholder="Your Email" required="required" />
                                </div>
                                 <div class="form-group">
                                    <input type="tel" class="form-control py-2 px-4"  id=" phone" name="phone" placeholder="Your Phone Number" required="required" />
                                </div>
                                 <div class="control-group">
                                <textarea class="form-control py-3 px-4" rows="5" id="address" name="address" placeholder="Your Address"
                                    required="required"
                                    data-validation-required-message="Please enter your Address"></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                                <div class="form-group">
                                    <input type="password" class="form-control py-2 px-4" id ="password" name="password" placeholder="Your Password" required="required" />
                                </div>
                                
                  
                                <div>
                                    <button class="btn btn-primary btn-block py-3" type="submit" id="btnsub" name="btnsub">Register</button>
                                    <br>
                                    <p><a href="login.jsp">Already Have An Account</a></p>             
                                    
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                 
            </div>
        </div>
    </div>
    <!-- Registration End -->
<%
if(request.getParameter("btnsub")!=null)
{
    long millis=System.currentTimeMillis();
	String nm,mob,em,add,psw,date;
	nm=request.getParameter("name");
	em=request.getParameter("email");
	mob=request.getParameter("phone");
	add=request.getParameter("address");
	psw=request.getParameter("password");
	java.sql.Date d=new java.sql.Date(millis);
	
    date=String.valueOf(d);   
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travelwithus","root","");
		
		PreparedStatement pst=cn.prepareStatement("insert into register values (?,?,?,?,?,?)");
		pst.setString(1,nm);
		pst.setString(2,em);
		pst.setString(3,mob);
		pst.setString(4,add);
		pst.setString(5,psw);
		pst.setString(6,date);
		pst.executeUpdate();
		out.println("<script>alert('Registration Successful');window.location='login.jsp';</script>");
	}
		
	
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
	

} 
%>
</body>
</html>