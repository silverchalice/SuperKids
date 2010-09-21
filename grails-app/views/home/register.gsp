

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public" />
        <title>Register | SuperKids</title>
    </head>
    <body>
    <script> 
        function help(){
            mywindow = window.open('profile_help','_blank','menubar=0,resizeable=0,scrollbars=1,width=500,height=500');
            mywindow.moveTo(300,300);
        }
    </script> 
        <div class="body" class="dialog" style="width:630px; height:460px; overflow:auto;">
            <h1>Registration</h1><br />
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${customerInstance}">
            <div class="errors">
                <g:renderErrors bean="${customerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <div style="width: 610px;"> 
                <div style="float:left;width:300px;"> 
                    <g:form method="post" action="save" name="profileForm"> 
                        <table width="300" border="0" cellspacing="3" cellpadding="0"> 
                            <tr> 			
                                <td align="right">Your Name</td> 
                                <td align="left"><input type="text" name="fsdName" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">Your Title</td> 
                                <td align="left"><input type="text" name="fsdTitle" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">School District Name</td> 
                                <td align="left"><input type="text" name="district" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">School District Address</td> 
                                <td align="left"><input type="text" name="address.street" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">&nbsp;</td> 
                                <td align="left"><input type="text" name="address.street2" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">City</td> 
                                <td align="left"><input type="text" name="address.city" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">State</td> 
                                <td align="left"> 
                                    <g:select name="address.state" from="${states}" />
                                </td> 
                            </tr> 
                            <tr> 			
                                <td align="right">Zip</td> 
                                <td align="left"><input type="text" name="address.zip" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">Telephone</td> 
                                <td align="left"><input type="text" name="phone" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">Fax</td> 
                                <td align="left"><input type="text" name="fax" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">Email</td> 
                                <td align="left"><input type="text" name="email" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">Sample Delivery Address</td> 
                                <td align="left"><input type="text" name="deliveryAddress.street" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">&nbsp;</td> 
                                <td align="left"><input type="text" name="deliveryAddress.street2" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">City</td> 
                                <td align="left"><input type="text" name="deliveryAddress.city" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">State</td>
                                <td align="left"> 
                                    <g:select name="deliveryAddress.state" from="${states}" />
                                </td> 
                            </tr> 
                            <tr> 			
                                <td align="right">Zip</td>
                                <td align="left"><input type="text" name="deliveryAddress.zip" value="" size="20" maxlength="50"></td> 
                            </tr> 
                        </table> 
                    </div> 
                    <div style="float:left;width:300px;"> 
                        <table width="300" border="0" cellspacing="3" cellpadding="0"> 
                            <tr> 
                                <td colspan="2"> 
                                    <div style="font-weight:bold;font-size:12px;">					
                                        <span style="font-size:14px;">Please Correct or Change Any Incorrect or Incomplete Information.<BR><BR></span> 
                                        Samples are limited and subject to availabilty.<BR><br /> 
                                        Please tell us about your school district foodservice program
                                    </div> 
                                </td> 
                            </tr> 
                            <tr style="padding-bottom:10px;"> 
                                <td align="right" valign="top"><input type="checkbox" name="hasBakery" value="1" ></td> 
                                <td>Make our own bread products from scratch in our bakery (proof and bake)</td> 
                            </tr> 
                            <tr style="padding-bottom:10px;"> 
                                <td align="right" valign="top"><input type="checkbox" name="purchaseFrozenBread" value="1" ></td> 
                                <td>Purchase frozen bread products and/or bread mixes and bake them in our bakery</td> 
                            </tr> 
                            <tr style="padding-bottom:10px;"> 
                                <td align="right" valign="top"><input type="checkbox" name="purchasePreparedFood" value="1" ></td> 
                                <td>Purchase prepared foods</td> 
                            </tr> 
                            <tr style="padding-bottom:10px;"> 
                                <td align="right" valign="top"><input type="checkbox" name="purchaseFrozenFood" value="1" ></td> 
                                <td>Purchase frozen foods</td> 
                            </tr> 
                            <tr style="padding-bottom:10px;"> 
                                <td align="right" valign="top"><input type="checkbox" name="purchaseFreshBread" value="1" ></td> 
                                <td>Purchase fresh bakery and bread products</td> 
                            </tr> 
                            <tr> 
                                <td>&nbsp;</td> 
                                <td>Other, please describe: <input type="text" name="otherComments" value="" size="25" maxlength="1000"></td> 
                            </tr> 
                            <tr> 
                                <td colspan="2"> 
                                    Number of students in your school district
                                    <select name="studentsInDistrict"> 
                                        <option value="500" >Less than 500
                                        <option value="1000" >500 - 1,000
                                        <option value="2000" >1,000 - 2,000
                                        <option value="5000" >3,000 - 5,000
                                        <option value="10000" >5,000 - 10,000
                                        <option value="20000" >10,000 - 20,000
                                        <option value="50000" >20,000 - 50,000
                                        <option value="50000+" >Over 50,000
                                    </select> 
                                </td> 
                             </tr> 
                             <tr> 
                                 <td colspan="2"> 
                                     Approximate number of cafeterias, food courts or other eating facilities(District Total)
                                     <select name="facilities"> 
                                         <option value="3" >Less Than 3
                                         <option value="5" >3-5
                                         <option value="10" >6-10
                                         <option value="10+" >More Than 10
                                     </select> 
                                 </td> 
                             </tr> 
                             <tr> 
                                 <td colspan="2"> 
                                     Number of students served daily(in your total school district - not just your individual school). Please confirm/enter these numbers.
                                 </td> 
                             </tr> 
                              <tr> 
                                  <td><input type="text" name="breakfastsServed" size="4" maxlength="6" value="" ></td> 
                                  <td>Breakfast</td> 
                              </tr> 
                              <tr> 
                                  <td><input type="text" name="lunchesServed" size="4" maxlength="6" value=""></td> 
                                  <td>Lunch</td> 
                              </tr> 
                              <tr> 
                                  <td><input type="text" name="snacksServed" size="4" maxlength="6" value=""></td> 
                                  <td>Snacks</td> 
                              </tr> 
                          </table> 
                      </div> 
                      <div style="clear:both;" align="center"> 
                      </div> 
                      <span style="color: rgb(153, 51, 0);">
                              <h2>Optional Broker/Distributor Information</h2>
                      </span> 
                      <div style="font-size: 10px;"> 
                          One of the objectives of the SuperKids Whole Grain Sampling Program is to communicate demand for these products to foodservice distributors and brokers. <BR /><BR /> 
                          Although it is not mandatory that you provide broker or distributor information below, it will help ensure that the right people know about your interest in these products and improve the  likelihood that you will receive more whole grain foods in the future.  Please provide the following if available. <br /><br /> 
                      </div> 

                      <table CELLPADDING="3" CELLSPACING="0" BORDER="0" width="300"> 
                          <tr> 
                              <td><strong>Broker/Distributor Name: </strong></td> 
                              <td><input type="text" name="brokerName" size="20" maxlength="50" value=""></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Email: </strong></td> 
                              <td><input type="text" name="brokerEmail" size="20" maxlength="50" value=""></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Telephone: </strong></td> 
                              <td><input type="text" name="brokerPhone" size="20" maxlength="50" value=""></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Fax: </strong></td> 
                              <td><input type="text" name="brokerFax" size="20" maxlength="50" value=""></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Address: </strong></td> 
                              <td><input type="text" name="brokerStreet" size="20" maxlength="255" value=""></td> 
                          </tr> 
                          <tr> 
                              <td><strong></strong></td> 
                              <td><input type="text" name="brokerStreet2" size="20" maxlength="255" value=""></td> 
                          </tr> 
                          <tr> 
                              <td><strong>City: </strong></td> 
                              <td><input type="text" name="brokerCity" size="20" maxlength="50" value=""></td> 
                          </tr> 
                          <tr> 			
                              <td>State</td> 
                              <td align="left"> 
                                    <g:select name="brokerState" from="${states}" />
                              </td> 
                          </tr> 
                          <tr> 
                              <td><strong>Zip: </strong></td> 
                              <td><input type="text" name="brokerZip" size="10" maxlength="20" value=""></td> 
                          </tr> 
                      </table> 
                      <div style="clear:both;" align="center"> 
                          <a href="javascript:help();"><strong>Help</strong></a> 
                          <input type="hidden" name="Register" value="1"> 
                          <input type="submit" name="save" value="Save"> 
                      </g:form> 
                  </div> 
                </div> 
           </div>
    </body>
</html>
