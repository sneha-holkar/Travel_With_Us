<%@page import="java.sql.*" %>
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
    <div class="container-fluid bg-registration py-5" style="margin: 40px 0;">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-7 mb-5 mb-lg-0">
                    <div class="mb-4">
                        <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">To Get</h6>
                        <h1 class="text-white"><span class="text-primary">Exclusive Offer </span> </h1>
                        <h1 class="text-white"><span class="text-primary">Login Now </span> </h1>
                    </div>
                    <p class="text-white"></p>
                    <ul class="list-inline text-white m-0">
                        <li class="py-2"><i class="fa fa-check text-primary mr-3"></i>Best Trips</li>
                        <li class="py-2"><i class="fa fa-check text-primary mr-3"></i>With Your Securities</li>
                        <li class="py-2"><i class="fa fa-check text-primary mr-3"></i>In Your Budget</li>
                    </ul>
                </div>
                <div class="col-lg-5">
                    <div class="card border-0">
                        <div class="card-header bg-primary text-center p-4">
                            <h1 class="text-white m-0">Administration Login</h1>
                        </div>                                       
                        <div class="card-body rounded-bottom bg-white p-5">
                            <form method= post>
                                    
                                 <div class="form-group">
                                    <input type="email" class="form-control py-2 px-4"  id=" email" name="email" placeholder="Your Email" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control py-2 px-4" id ="password" name="password" placeholder="Your Password" required="required" />
                                </div>
                                
                  
                                <div>
                                    <button class="btn btn-primary btn-block py-3" type="submit" id ="btns" name="btns">Login</button>
                                    <br>
                                      
                                    
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Registration End -->

</body>
</html>
<%
if(request.getParameter("btns")!=null)
{
	String em,psw;
	em=request.getParameter("email");
	psw=request.getParameter("password");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travelwithus","root","");
		PreparedStatement pst=cn.prepareStatement("select * from adlogin where email=? and password=?");
		pst.setString(1,em);
		pst.setString(2,psw);

		ResultSet rs=pst.executeQuery();
	if(rs.next())
	{
		session.setAttribute("email",em);

	out.println("<script>alert('Login Successful');window.location='admin/index.jsp';</script>");
	}
	else
	{
		out.println("<script>alert('Invalid Emai Or Password');</script>");	
	}
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
}
%>