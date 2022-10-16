 <%@page import="java.sql.*" %>
    <%@page import="java.time.*" %>
    <%@page import="java.time.format.*" %>
<%@include file="header.jsp" %>




<%
String rrid;
int id=101;
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travelwithus","root","");
	String sql="select * from request where id=(select max(id) from request)";
	PreparedStatement pst=cn.prepareStatement(sql);
	
	 ResultSet rs=pst.executeQuery();
	if(rs.next())	 
	{ rrid=rs.getString("id");
         
	 id=Integer.parseInt(rrid)+1;

%>




<body>
   <!-- Contact Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">BOOK TRIP</h6>
                <h1>Book A Full Tour As You Want</h1>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="contact-form bg-white" style="padding:30px;border:solid 5px #94c559;">
                        <div id="success"></div>
                        <form  method="post">
                        
                        <div class="control-group">
                                   <input type="text" class="form-control py-2 px-4" id="id" name="id" 
                                        required="required" readonly data-validation-required-message="Please enter date" value=<%=id%> />
                                    <p class="help-block text-danger"></p>
                            </div>
                        
                            <div class="form-row">
                                <div class="control-group col-sm-6">
                                    <input type="text" class="form-control py-2 px-4" id="sdate" name="sdate" placeholder="Depart Date (dd/mm/yyyy)"
                                        required="required" data-validation-required-message="Please enter date" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}"  />
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="control-group col-sm-6">
                                    <input type="text" class="form-control py-2 px-4" id="edate" name="edate" placeholder="Return Date  (dd/mm/yyyy)"
                                        required="required" data-validation-required-message="Please enter date" pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}"  />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                             <div class="form-row">
                                <div class="control-group col-sm-6">
                                    <input type="text" class="form-control py-2 px-4" id="sloc" name="sloc" placeholder="Starting Location"
                                        required="required" data-validation-required-message="Please enter location" />
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="control-group col-sm-6">
                                    <input type="text" class="form-control py-2 px-4" id="eloc"  name="eloc" placeholder="Destination"
                                        required="required" data-validation-required-message="Please enter location"  />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="control-group col-sm-6">
                                     <input type="number" class="form-control py-2 px-4" id="tnp" name="tnp"placeholder="Total Number Of People"
                                    required="required" data-validation-required-message="Please enter number of tour member" />
                                <p class="help-block text-danger"></p>
                                </div>
                                <div class="control-group col-sm-6">
                                    <select class="custom-select px-4" id="veh" name="veh" style="height: 47px;">
                                        <option selected>Required Vehicle</option>
                                        <option value="Car">Car</option>
                                        <option value="MiniBus">MiniBus</option>
                                        <option value="Bus">Bus</option>
                                    </select>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                          
                            <div class="control-group">
                                <textarea class="form-control py-2 px-4" rows="5" id="stops" name="stops" placeholder="Enter stops in whole tour"
                                    required="required"
                                    data-validation-required-message="Please enter your message"></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="text-center">
                             <button class="btn btn-primary py-md-3 px-md-5 mt-2" type="submit" id="btnsub" name="btnsub">Send Tour</button>
                             
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->
</body>
</html>


<%
}
	
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
  
if(request.getParameter("btnsub")!=null)
{   String em;
    em=(String)session.getAttribute("email");
      
   
		   
			
  
    long millis=System.currentTimeMillis();
	String sdate,edate,sloc,eloc,stops,tnp,veh,date,rid;
	sdate=request.getParameter("sdate");
	edate=request.getParameter("edate");
	sloc=request.getParameter("sloc");
	eloc=request.getParameter("eloc");
	tnp=request.getParameter("tnp");
	veh=request.getParameter("veh");
	stops=request.getParameter("stops");
	rid=request.getParameter("id");
java.sql.Date d=new java.sql.Date(millis);
	
    date=String.valueOf(d);   
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travelwithus","root","");
		
		PreparedStatement pst=cn.prepareStatement("insert into request values (?,?,?,?,?,?,?,?,?,?,?,?)");
		pst.setString(1,em);
		pst.setString(2,sdate);
		pst.setString(3,edate);
		pst.setString(4,sloc);
		pst.setString(5,eloc);
		pst.setString(6,tnp);
		pst.setString(7, veh);
		pst.setString(8, stops);
		pst.setString(9,date);
		pst.setString(10,rid);
		pst.setString(11,"no");
		pst.setString(12,"00");
		pst.executeUpdate();
		out.println("<script>alert('Thanks For Tour Request, We will shortly Inform You About This Tour; Now Continue to Look Our Best Tour Packages');window.location='package.jsp';</script>");
	}
		
    
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
	

} 
		
%>



<%@include file="footer.jsp" %>