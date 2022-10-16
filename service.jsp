 <%@page import="java.sql.*" %>
    <%@page import="java.time.*" %>
    <%@page import="java.time.format.*" %>
<%@include file="header.jsp" %>

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
                            <div class="form-row">
                                <div class="control-group col-sm-6">
                                    <input type="text" class="form-control py-2 px-4" id="sdate" name="sdate" placeholder="Depart Date"
                                        required="required" data-validation-required-message="Please enter date" />
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="control-group col-sm-6">
                                    <input type="text" class="form-control py-2 px-4" id="edate" onfocus="display()" value="" name="edate " placeholder="Return Date"
                                        required="required" data-validation-required-message="Please enter date"  />
                                    <p class="help-block text-danger"></p>
                                     <script>
                                function display()
                                {
                                	window.location('login.jsp');
                                }
                                </script>
                                </div>
                                </div>
                             <div class="form-row">
                                <div class="control-group col-sm-6">
                                    <input type="text" class="form-control py-2 px-4" id="sloc" name="sloc" placeholder="Starting Location"
                                        required="required" data-validation-required-message="Please enter location" />
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="control-group col-sm-6">
                                    <input type="text" class="form-control py-2 px-4" id="eloc" value="" name="eloc " placeholder="Destination"
                                        required="required" data-validation-required-message="Please enter location" />
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
                                    <select class="custom-select px-4" style="height: 47px;">
                                        <option selected>Required Vehicle</option>
                                        <option value="1">Car</option>
                                        <option value="2">MiniBus</option>
                                        <option value="3">Bus</option>
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
                               <a href="login.jsp" class="btn btn-primary py-md-3 px-md-5 mt-2">Send Tour</a>
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
<%@include file="footer.jsp" %>