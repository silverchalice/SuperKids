

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="broker" />
        <meta name="link" content="broker_ecard" />
        <title>SuperKids | Send An eCard</title>
		<style type="text/css">
			.name {
				font-size:12px;
				text-align:right;
				width:145px;
				font-weight:bolder;
				font-family:arial,helvetica,sans-serif;

			}

			td {
				padding:2px 2px;
				line-height:22px;
			}
		</style>
    </head>
    <body>


	
		<div id="contentInsetInner">

			<div style="width: 620px;">
				
                        <h1>Send an eCard</h1><br />

                        <h2>Do you know someone else who might benefit from knowing about SuperKids products?</h2><br />
                        <p>Send an eCard to the recipient(s) of your choice by clicking below. The eCard you send will fill in as you begin.</p>

				<g:form name="sendEcard" controller="ecard" action="sendEcard">

				<input type="Radio" name="Ecard" value="1" onclick="toggleform(1);"><strong>Broker or Foodservice Distributor eCard</strong><br><span id="FNameID"></span>
				<input type="Radio" name="Ecard" value="2" onclick="toggleform(2);"><strong>School District Foodservice Director eCard</strong><br><span id="RFNameID"></span>
				<div id="EcardData" style="display:none;" >

                                <p>&nbsp;</p>
				<div style="float:left;width:300px;">
				<table style="border:0; position:relative; right:7px; bottom:1px">
				<tr>
					<td class="name">Your Name: </td>
					<td>
						<input type="text" name="name" size="20" maxlength="50" value="">
					</td>
				</tr>

				<tr>
					<td class="name">Your Company Name: </td>
					<td><input type="text" name="company" size="20" maxlength="50" value=""><br></td>
				</tr>
				<tr>
					<td class="name">Your Email Address</td>
					<td><input type="text" name="email" size="20" maxlength="50" value=""><br></td>
				</tr>

				<tr>
					<td class="name">Recipients Name: </td>
					<td>
						<input type="text" name="recipient" size="20" maxlength="50" value="">
					</td>
				</tr>
				<tr>
					<td class="name">Recipients Email:</td>

					<td><input type="text" name="recipientEmail" size="20" maxlength="50" value=""><br></td>
				</tr>
				<tr>
					<td colspan="2"><input type="Submit" name="submit" value="Send Ecard"></td>
				</tr>
				</table>
				</div>
				<div style="float:left;width:300px; padding-left:1px">
					<div style="display:none;" ID="Ecard1Layout">
						Greetings <span style="border-bottom:1px solid black;font-weight:bold;" id="RNameID"></span>: <br /><br />

						<div>
							Whole grain foods are important for our nation's school-age children. I sent
							you this card because I wanted you to know about a unique program known as SuperKids --
							a FREE whole grain product sampling program for K-12 school foodservice directors. As someone
							in foodservice distribution, SuperKids products may be of interest to you.  All are made with
							Ultragrain and Sustagrain for better-for-you whole grain nutrition . <a style="color:#FA9F1B; font-weight:bolder; text-decoration:none" href="http://www.superkidssampling.com/">Click here</a>
							to go to the SuperKids website where you can request product information.
						</div><br />
						Sincerely<br />
						<div style="padding-left:20px;"><span style="border-bottom:1px solid black;font-weight:bold;" id="NameID"></span></div>
					</div>
					<div style="display:none;" id="Ecard2Layout">

						Greetings <span style="border-bottom:1px solid black;font-weight:bold;" id="RNameID2"></span>: <br /><br />
						<div>
							Whole grain foods are important for our nation's school-age children. I sent you this
							card because I wanted you to know about a unique program known as SuperKids  -- a FREE whole
							grain product sampling program for K-12 school foodservice directors featuring  better-for-you
							whole grain products made with Ultragrain and Sustagrain. Your school district may find these
							products of interest. <a style="color:#FA9F1B; font-weight:bolder;" href="http://www.superkidssampling.com/">Click here</a> to go to the SuperKids
							website where you can request product information.
						</div><br />
						Sincerely<br />
						<div style="padding-left:20px;"><span style="border-bottom:1px solid black;font-weight:bold; text-decoration:none" id="NameID2"></span></div>
					</div>

				</div>
				<div class="clear"></div>
			</div>
			</g:form>


			</div>


		</div>

		<script type="text/javascript">
			function toggleform(id){
				document.getElementById('EcardData').style.display = "block";
				if(id == 1)
				{
					document.getElementById('Ecard2Layout').style.display = "none";
					document.getElementById('Ecard1Layout').style.display = "block";
				}
				else
				{
					document.getElementById('Ecard1Layout').style.display = "none";
					document.getElementById('Ecard2Layout').style.display = "block";
				}
			}

		</script>
    </body>
</html>
