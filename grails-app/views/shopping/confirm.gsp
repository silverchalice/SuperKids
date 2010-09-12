

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public" />
        <title>You landed on: The Landing Page.</title>
    </head>
    <body>

        <div style="width:450px">
           <g:if test="${flash.message}">
               <div class="message">${flash.message}</div>
           </g:if>
           <h1>Checkout Step 2 of 2</h1>
           <h2>Your Contact Information</h2>
           <p>Please confirm the information shown. To change your contact information, click <a href="#">here</a>. To add a sample, click <a href="#">here</a>.</p>

           <table cellpadding="1" cellpadding="0"> 
               <tr> 
                   <td nowrap="nowrap" valign="top" align="right"><strong>Name: </strong></td> 
                   <td nowrap="nowrap" valign="top">Jacob Marley</td> 
               </tr> 
               <tr> 
                   <td nowrap="nowrap" valign="top" align="right"><strong>School District: </strong></td> 
                   <td nowrap="nowrap">Scrooge and Marley</td> 
               </tr> 
               <tr> 
                   <td nowrap="nowrap" valign="top" align="right"><strong>Shipping Address: </strong></td> 
                   <td nowrap="nowrap"> 
                       123 Foo Bar Rd.<BR> 
                                            
                       Fred CA, 1234567
                   </td> 
               </tr> 
               <tr> 
                   <td nowrap="nowrap" valign="top" align="right"><strong>Phone Number: </strong></td> 
                   <td nowrap="nowrap">1234567890</td> 
               </tr> 
               <tr> 
                   <td nowrap="nowrap" valign="top" align="right"><strong>Email Address: </strong></td> 
                   <td nowrap="nowrap">fifthposition92@gmail.com</td> 
               </tr> 
           </table> 
           <h2>The Samples Requested</h2>
           <g:each in="${products}">
               <g:link controller="product" action="show" id="${product.id}"><img src="${createLink(controller:'product', action:'displayImage', id:product.id)}" width="65" height="50" style="margin:3px;" /></g:link><br />
               [quantity]<br />
               [foo]
           </g:each>

           <p>Samples are limited and subject to availability. You will receive an email from our Fulfillment Center telling you the approximate date your samples will ship.</p>

     <h2>When to Ship</h2>
     <p>Please select when to ship your order:</p>

     <h2>Rewards for Assessments</h2>
     <p>When you receive your samples and try them out, be sure to come back to SuperKidsSampling.com before March 5, 2010 -- you can earn special rewards for completing your assessments by this deadline. Click Assess to learn more. </p>
     <p>If this sample order is correct, click here to complete order. If you do not confirm your order by pressing this button, the order will not be placed.</p>

        </div>
    </body>
</html>
