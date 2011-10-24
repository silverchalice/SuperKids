

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public" />
        <title>SuperKids | Register</title>
    </head>
    <body>
    <script> 
        function help(){
            mywindow = window.open('profile_help','_blank','menubar=0,resizeable=0,scrollbars=1,width=500,height=500');
            mywindow.moveTo(300,300);
        }
    </script> 
        <div id="contentInsetInner">
            <h1>Registration</h1><br />

            <div style="width: 610px;"> 
                <div style="float:left;width:300px;">
                        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div><br />
            </g:if>
            <g:hasErrors bean="${customerInstance}">
            <div class="errors">
                <g:renderErrors bean="${customerInstance}" as="list" />
            </div>
            </g:hasErrors>
                    <g:form method="post" action="save" name="profileForm"> 
                        <table width="300" border="0" cellspacing="3" cellpadding="0"> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">Your Name</td>
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="fsdName" value="${customerInstance?.fsdName}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">Your Title</td> 
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="fsdTitle" value="${customerInstance?.fsdTitle}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">School District Name</td> 
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="district" value="${customerInstance?.district}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">School District Address</td> 
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="address.street" value="${customerInstance?.address?.street}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">&nbsp;</td> 
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="address.street2" value="${customerInstance?.address?.street2}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">City</td> 
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="address.city" value="${customerInstance?.address?.city}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">State</td> 
                                <td style="text-align:left; padding: 0 4px"> 
                                    <g:select name="address.state" from="${states}" value="${customerInstance?.address?.state}" />
                                </td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">Zip</td> 
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="address.zip" value="${customerInstance?.address?.zip}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">Telephone</td> 
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="phone" value="${customerInstance?.phone}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">Fax</td> 
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="fax" value="${customerInstance?.fax}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">Email</td> 
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="email" value="${customerInstance?.email}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">Sample Delivery Address</td> 
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="deliveryAddress.street" value="${customerInstance?.deliveryAddress?.street}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">&nbsp;</td> 
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="deliveryAddress.street2" value="${customerInstance?.deliveryAddress?.street2}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">City</td> 
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="deliveryAddress.city" value="${customerInstance?.deliveryAddress?.city}" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">State</td>
                                <td style="text-align:left; padding: 0 4px"> 
                                    <g:select name="deliveryAddress.state" from="${states}" value="${customerInstance?.deliveryAddress?.state}" />
                                </td> 
                            </tr> 
                            <tr> 			
                                <td style="text-align:right; padding: 0 4px">Zip</td>
                                <td style="text-align:left; padding: 0 4px"><input type="text" name="deliveryAddress.zip" value="${customerInstance?.deliveryAddress?.zip}" size="20" maxlength="50"></td> 
                            </tr> 
                        </table> 
                    </div> 
                    <div style="float:left;width:310px;">
                        <table cellspacing="3" cellpadding="0">
                            <tr> 
                                <td colspan="2"> 
                                    <div style="font-weight:bold;font-size:12px;">					
                                        <span style="font-size:14px; line-height:15px">Please Correct or Change Any Incorrect or Incomplete Information.<BR><BR></span>
                                        Samples are limited and subject to availabilty.<BR><br /> 
                                        Please tell us about your school district foodservice program
                                    </div> 
                                </td> 
                            </tr> 
                            <tr style="padding-bottom:10px;"> 
                                <td style="text-align:right; padding: 0 0 0 4px" valign="top"><input type="checkbox" name="hasBakery" value="1" ></td>
                                <td style="padding:0 0 0 0; line-height:13px;">Make our own bread products from scratch in our bakery (proof and bake)</td>
                            </tr> 

                            <tr>
                                <td colspan="2"  style="padding:0 0 0 0; line-height:13px;">How much flour does your district use on a monthly basis in pounds? <input type="text" name="monthlyFlourUsage" value="" size="25" maxlength="1000" style="float:right"></td>
                            </tr>
                            <tr>
                                <td colspan="2"  style="padding:0 0 0 0; line-height:13px;">Do you work with a local bakery to supply your fresh bakery products? If you’d like us to
                                                            contact them about the program, please list them here.<input type="text" name="localBakeries" value="" size="25" maxlength="1000" style="float:right"></td>
                            </tr>
                            <tr>

                                <td colspan="2" style="padding:0 0 0 0; line-height:13px;"> Do you currently use Ultragrain® or Sustagrain® products in your district? If so, please list:<input type="text" name="usedUltragrainSustagrainProducts" value="" size="25" maxlength="1000" style="float:right"></td>
                            </tr>

                            <tr>
                                <td colspan="2"  style="padding:0 0 0 0; line-height:13px;">Other, please describe: <input type="text" name="otherComments" value="" size="25" maxlength="1000" style="float:right"></td>
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
                                  <td><input type="text" name="breakfastsServed" size="4" maxlength="6" value="${customerInstance?.breakfastsServed}" ></td> 
                                  <td style="line-height:20px;">Breakfast</td>
                              </tr> 
                              <tr> 
                                  <td><input type="text" name="lunchesServed" size="4" maxlength="6" value="${customerInstance?.lunchesServed}"></td> 
                                  <td style="line-height:20px;">Lunch</td>
                              </tr> 
                              <tr> 
                                  <td><input type="text" name="snacksServed" size="4" maxlength="6" value="${customerInstance?.snacksServed}"></td> 
                                  <td style="line-height:20px;">Snacks</td>
                              </tr> 
                          </table> 
                      </div> 
                      <div style="clear:both;" align="center"> 
                      </div> 
                      <span style="color: rgb(153, 51, 0);">
                              <h2>Optional Broker/Distributor Information</h2>
                      </span> 
                          One of the objectives of the SuperKids Whole Grain Sampling Program is to communicate demand for these products to foodservice distributors and brokers. <br /><br /> 
                          Although it is not mandatory that you provide broker or distributor information below, it will help ensure that the right people know about your interest in these products and improve the  likelihood that you will receive more whole grain foods in the future.  Please provide the following if available. <br /><br />
                      <g:hiddenField name="seq" value="9998" />
                      <table cellpadding="3" cellspacing="0" style="border:none; width:320px">
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
                              <td style="text-align:left"> 
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
