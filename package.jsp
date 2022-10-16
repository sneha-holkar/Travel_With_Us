 <%@page import="java.sql.*" %>
    <%@page import="java.time.*" %>
    <%@page import="java.time.format.*" %>
<%@include file="header.jsp" %>



    <!-- Packages Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Packages</h6>
                <h1>Perfect Tour Packages</h1>
            </div>
             <div class="row">
            
            
       <%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travelwithus","root","");
	     
            String sql="select * from package";
            PreparedStatement pst=cn.prepareStatement(sql);
 ResultSet rs=pst.executeQuery();
 int i=0;
 while(rs.next())
 {
      i++;       
         
     String timg,tloc,tdur,tdes,tp,tnm;
     tnm=rs.getString("tnm");
     timg=rs.getString("timg");
	 tloc=rs.getString("tloc");
	 tdur=rs.getString("tdur");
	 tdes=rs.getString("tdes");
	 tp=rs.getString("tp");
	 

	 %>    
            
            
            
            
            
            
            
    
            
            
           
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="package-item bg-white mb-2">
                        <div class="my-class-for-img"><img class="img-fluid" style="height:250px; width:300px;border:solid 2px #94c559;"src="<%=timg%>" height="250px" alt="<%=tnm%>" ></div>
                          <div class="p-4">
                            <div class="d-flex justify-content-between mb-3">
                                <small class="m-0"><i class="fa fa-map-marker-alt text-primary mr-2"></i><%=tloc%></small>
                                <small class="m-0"><i class="fa fa-calendar-alt text-primary mr-2"></i><%=tdur+" Days" %></small>
                                <small class="m-0"><i class="fa fa-user text-primary mr-2"></i>1 Person</small>
                            </div>
                            <p class="h5 text-decoration-none" style="overflow-y:scroll;height:80px;"><%=tdes %></p>
                            <div class="border-top mt-4 pt-4">
                                <div class="d-flex justify-content-between">
                                    
                                    <h5 class="m-2"><%=tp %> Rs</h5>&nbsp&nbsp&nbsp
                                    
                                    <a href="login.jsp" class="btn btn-primary mt-1">Book Now</a>
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