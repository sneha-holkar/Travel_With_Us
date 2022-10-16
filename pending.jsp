 <%@page import="java.sql.*" %>
    <%@page import="java.time.*" %>
    <%@page import="java.time.format.*" %>
<%@include file="header.jsp" %>

<%
String em;
em=(String)session.getAttribute("email");

%>

    <!-- Packages Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
        
            <div class="text-center mb-3 pb-3">
            
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;"></h6>
                <h1>My Pending Tours</h1>
                
             
            
            
            </div>
             <div class="row">
        
        
            
            
       <%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travelwithus","root","");
	PreparedStatement pst;
	        
            String sql="select * from request where charge!='00' and email=? and status='no'";
            
             pst=cn.prepareStatement(sql);
             pst.setString(1,em);
 ResultSet rs=pst.executeQuery();
 
  
 int i=0;
 while(rs.next())
 {
      i++;       
         
     String ddate,edate,sloc,eloc,tnp,stops,veh,date,id,charge;
     em=rs.getString("email");
     ddate=rs.getString("ddate");
	 edate=rs.getString("edate");
	 sloc=rs.getString("sloc");
	 eloc=rs.getString("eloc");
	 tnp=rs.getString("tpeople");
	 stops=rs.getString("stops");
	 veh=rs.getString("vehicle");
	 date=rs.getString("date");
	  id=rs.getString("id");
      charge=rs.getString("charge");
	  
	 %>    
            
            
           
            
    
            
            
           
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="package-item bg-white mb-2">
                         <div class="p-4">
                            
                                <h4 ><i class="fa fa-map-marker-alt text-primary mr-2"></i><%= sloc%> -to- <%=eloc%></h4><br>
                               
                                
                                <h5><i class="fa fa-calendar-alt text-primary mr-2"></i><%=ddate%> -to- <%=edate %></h5><br>
                               <div class="d-flex justify-content-between mb-3">
                                <h4 ><i class="fa fa-user text-primary mr-2"></i><%=tnp%></h4> <h4 ><i class="fas fa-car text-primary mr-2"></i><%=veh%></h4><br>
                               </div>
                               <span>Stops In Tour</span>
                            <p class="h5 text-decoration-none" style="overflow-y:scroll;height:50px;"><%=stops%></p>
                            <div class="border-top mt-4 pt-4">
                                <div class="d-flex justify-content-between">
                                    
                                    <a href="approcess.jsp?id=<%=id%>"> View More</a>                                    
                                    
                                    <h6 class="m-2"> </h6>
                                     </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                                
                 <%
	 
	 }
	 if(i==3)
	 {
		 i=0;
		 %>
		
      		 <div class="row">
		 <%
		 
	 }

}
catch(Exception ex)
{
ex.printStackTrace();	
}
%>
</div>

</div>
  </div>
  </div>
<%@include file="footer.jsp"%>