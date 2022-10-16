<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    
    String id=request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>


</head>
<body >


<%

try
{  
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travelwithus","root","");
	     
            
            PreparedStatement pst=cn.prepareStatement("select * from request where id=? ");
            pst.setString(1,id);
           
 ResultSet rs=pst.executeQuery();

 if(rs.next())
	{
		

   
            
     String sloc,eloc,tpeople,vehicle,stops,date,sdate,edate,em,charge;
     sloc=rs.getString("sloc");
     eloc=rs.getString("eloc");
     tpeople=rs.getString("tpeople");
     vehicle=rs.getString("vehicle");
     stops=rs.getString("stops");
     date=rs.getString("date");
     sdate=rs.getString("ddate");
	 edate=rs.getString("edate");
     em=rs.getString("email");
     charge=rs.getString("charge");
	%>
 
    	                                   


<!-- Registration Start -->
    <div class="container-fluid py-5" style="margin: 50px 0;">
        <div class="container py-5">
            <div class="row align-items-center">
            
                <div class="col-lg-7 mb-5 mb-lg-0" style="padding:30px;border:solid 5px #94c559;margin:0 30px">
                    <center><div class="card border-0">
                        <div class="card-header bg-primary text-center p-4">
                            <h1 class="text-white m-0">Process Request Tour</h1>
                        </div>
                        <div class="card-body rounded-bottom bg-white p-5">
                            <form method= post>
                                <div class="form-group">
                                  <span class="label label-success">Tour Request Id</span>
                                  <input type="text" class="form-control py-2 px-4"  id="rid" name="rid"  value="<%=id%>" readonly required="required" />
                                </div>
                                <div class="form-group">
                                  <span class="label label-success">Email</span>
                                  <input type="text" class="form-control py-2 px-4"  id="em" name="em"  value="<%=em%>" readonly required="required" />
                                </div>
                                  <div class="form-row">
                                      <div class="control-group col-sm-6">
                                     <span class="label label-success">Depart Location</span>
                                       <input type="text" class="form-control py-2 px-4" id ="sloc" name="sloc"  value="<%=sloc%>"  readonly required="required" />
                                       </div>
                                  
                                      <div class="control-group col-sm-6">
                                     <span class="label label-success">Destination</span>
                                       <input type="text" class="form-control py-2 px-4" id ="eloc" name="eloc"  value="<%=eloc%>"  readonly required="required" />
                                       </div>
                                
                                 </div>
                                 <div class="form-row">
                                    <div class="control-group col-sm-6">
                                     <span class="label label-success">Depart Date</span>
                                    <input type="text" class="form-control py-2 px-4"  id="sdate " name="sdate" value="<%=sdate%>" readonly required="required" />
                                </div>
                                 <div class="control-group col-sm-6">
                                     <span class="label label-success">Return Date</span>
                                    <input type="text" class="form-control py-2 px-4"  id="edate " name="edate" value="<%=edate%>" readonly required="required" />
                                </div>
                                </div>
                                <br>
    	                                 
             
                              
                                <div class="control-group">
                                 <span class="label label-success">Stops In Tour </span>
                                <textarea class="form-control py-2 px-4" rows="5" id="stops" name="stops"  readonly required="required" ><%=stops %></textarea>
                                    
                                <p class="help-block text-danger"></p>
                            </div>
                             
                             <div class="form-row">
                                    <div class="control-group col-sm-6">
                                     <span class="label label-success">Total Number Of People</span>
                                    <input type="text" class="form-control py-2 px-4"  id="tpeople " name="tpeople" value="<%=tpeople%>" readonly required="required" />
                                </div>
                                 <div class="control-group col-sm-6">
                                     <span class="label label-success">Vehicle</span>
                                    <input type="text" class="form-control py-2 px-4"  id="vehical " name="vehical" value="<%=vehicle%>" readonly required="required" />
                                </div>
                                </div>
                                <br>
                                <div class="form-group">
                                  <span class="label label-success">Charges</span>
                                  <input type="text" class="form-control py-2 px-4"  id="charge" name="charge" readonly value="<%=charge%>" required="required" />
                                </div>
                             
                            <br>
                              
                              <div class="form-group">
                                  
                                  <h3>Approve For the Tour</h3>
                                  <input type="checkbox" id="app" name=app value=yes required ></input>
                                 
                                </div>
                                <br>
                              
                                <div>
                                   <button class="btn btn-primary btn-block py-3" type="submit" id ="btns" name="btns">Conform Tour</button>
                                     <br><br>
                                      <a href="package.jsp" class="btn btn-primary mt-1">Back To Previous Page</a>        
                                    
                                </div>
                            </form>
                            
                             </div>
                        </div>
                        </center>
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

<%
if(request.getParameter("btns")!=null)
{
	String sdate,edate,sloc,eloc,stops,tnp,veh,rid,em,app;
	sdate=request.getParameter("sdate");
	edate=request.getParameter("edate");
	sloc=request.getParameter("sloc");
	eloc=request.getParameter("eloc");
	tnp=request.getParameter("tpeople");
	veh=request.getParameter("vehical");
	stops=request.getParameter("stops");
	rid=request.getParameter("rid");
	em=request.getParameter("em");
     app=request.getParameter("app");

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travelwithus","root","");
		
		PreparedStatement pst=cn.prepareStatement("update  request set status= ?");
		pst.setString(1,app);
		
		pst.executeUpdate();
		 
		out.println("<script>alert('Tour Successfully Approved!!');window.location='package.jsp';</script>");
	}
		
    
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
}
%>







 </body>
</html>




<%@include file="footer.jsp" %>