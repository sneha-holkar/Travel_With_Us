 <%@page import="java.sql.*" %>
    <%@page import="java.time.*" %>
    <%@page import="java.time.format.*" %>
<%@include file="header.jsp" %>

<%
String em;
em=(String)session.getAttribute("email");

%>
    <!-- Contact Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Contact</h6>
                <h1>Contact For Any Query</h1>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="contact-form bg-white" style="padding: 30px;" style="padding:30px;border:solid 5px #94c559;">
                        <div id="success"></div>
                        <form  method="post">
                            <div class="form-row">
                                <div class="control-group col-sm-6">
                                    <input type="text" class="form-control py-2 px-4" id="name" name="name" placeholder="Your Name"
                                        required="required" data-validation-required-message="Please enter your name" />
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="control-group col-sm-6">
                                    <input type="email" class="form-control py-2 px-4" id="em" value="<%=em %>" name="em " placeholder="Your Email"
                                        required="required" data-validation-required-message="Please enter your email" readonly />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <input type="text" class="form-control py-2 px-4" id="subject" name="subject"placeholder="Subject"
                                    required="required" data-validation-required-message="Please enter a subject" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <textarea class="form-control py-2 px-4" rows="5" id="message" name="message" placeholder="Message"
                                    required="required"
                                    data-validation-required-message="Please enter your message"></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-primary py-3 px-4" type="submit"  name="btnsub" id="btnsub">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->

<%if(request.getParameter("btnsub")!=null)
{
    long millis=System.currentTimeMillis();
	String nm,msg,sub,date;
	nm=request.getParameter("name");
	sub=request.getParameter("subject");
	msg=request.getParameter("message");
	
	java.sql.Date d=new java.sql.Date(millis);
	
    date=String.valueOf(d);   
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travelwithus","root","");
		
		PreparedStatement pst=cn.prepareStatement("insert into contact values (?,?,?,?,?,?)");
		pst.setString(1,nm);
		pst.setString(2,em);
		pst.setString(3,sub);
		pst.setString(4,msg);
		pst.setString(5,date);
		pst.setString(6,"yes");
		pst.executeUpdate();
		out.println("<script>alert('Message Sent Succesfully');window.location='index.jsp';</script>");
	}
		
	
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
	

} 
%>
<%@include file="footer.jsp" %>
   