<%@ page import="com.superkids.domain.ShippingDate; com.superkids.domain.CallResult;" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="caller" />
	<link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'ui-lightness/jquery-ui-1.8.5.custom.css')}" />

<title>Caller Home</title>
</head>
<body>
	<link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'ui.selectmenu.css')}" />
	<script type="text/javascript" src="${resource(dir:'js', file:'ui.selectmenu.js')}"></script>

	<script type="text/javascript">
		$(document).ready(function(){

            var allRadios = $('input[type=radio]')
            var radioChecked;

			var changedFlag;
			$('.body :input').bind('change', function() {
			    //console.log('changedFlag = true')
				changedFlag = 'true';
			});
			

            var setCurrent =
                            function(e) {
                                var obj = e.target;

                                radioChecked = $(obj).attr('checked');
                         }

            var setCheck =
                        function(e) {

                            if (e.type == 'keypress' && e.charCode != 32) {
                                return false;
                            }

                            var obj = e.target;

                 if (radioChecked) {
                 $(obj).attr('checked', false);
                 } else {
                 $(obj).attr('checked', true);
                 }
                     }

            $.each(allRadios, function(i, val){
                 var label = $('label[for=' + $(this).attr("id") + ']');

             $(this).bind('mousedown keydown', function(e){
                    setCurrent(e);
                });

                label.bind('mousedown keydown', function(e){
                    e.target = $('#' + $(this).attr("for"));
                    setCurrent(e);
                });

             $(this).bind('click', function(e){
                    setCheck(e);
                });

            });


			$("#callbackDateString").datepicker({dateFormat: 'mm/dd/yy'});

			//When page loads...
			$(".tab_content").hide(); //Hide all content
			$("ul.tabs li:first").addClass("active").show(); //Activate first tab
			$(".tab_content:first").show(); //Show first tab content

			
			//$("select#result").selectmenu({style:'dropdown'});
			//$("select#bState").selectmenu({style:'dropdown'});

            var clicked;


			//On Click Event
			$("ul.tabs li").click(function() {

				$("ul.tabs li").removeClass("active"); //Remove any "active" class
				$(this).addClass("active"); //Add "active" class to selected tab
				$(".tab_content").hide(); //Hide all tab content

				var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
				$(activeTab).fadeIn(); //Fade in the active ID content
				return false;
			});

            $("select#timezone").selectmenu({style:'dropdown'});


            $('#submit').click(function (e) {
                if(clicked == 'true') { return false };

				if(changedFlag == 'true' && $('#result').val() == "null") {
					return confirm('You made changes to the form, but did not choose a Call Result - your changes will not be saved. Do you want to continue?')
				};
			
			
                $('#loader').toggle();
                clicked = 'true'
                return true

            });

		

		});
    </script>

    <style type="text/css">

        html {
          background-color: #f4f2f2;
        }

        body {
          background-color: #f4f2f2;
        }

        label {
          font-weight:bold;
          font-size:12px;
        }


        input, select, textarea {
          background:#FFF3E0;
        }

        .prop .textField {
            width:300px
        }

        .prop .name {
            width: auto
        }

        .contact {
            width:400px;
            margin: 10px 10px 0 0;
        }

        .contact td {
            padding:0 5px;
        }

        a#timezone-button {
          width: 74px;
        }

        input.ui-button {
          padding: 3px 4px 4px 4px;
        }

        table {
            width:auto;
        }

    </style>

    <g:form>

		<g:hiddenField name="id" value="${customerInstance?.id}" />
        <g:hiddenField name="offset" value="${offset}" />
		<g:hiddenField name="currentTimezone" value="${currentTimezone}" />

		<div class="callerNavBar">
			<g:link class="callerButton" style="margin-left:10px" action="finish_call" id="${customerInstance?.id}"><g:message code="default.home.label"/></g:link>
			<g:if test="${queue && !start}">
				<g:hiddenField name="queue" value="${queue}" />
				<span style="position:absolute; width:100px; left:1120px; top:60px;"><g:actionSubmit id="submit" class="callerButton" action="save_assess_call" value="Next Call" /></span>
                <img id="loader" style="position:absolute; left:1200px; padding-top:3px; height:25px; display:none;" src="${resource(dir:'images', file:'ajax-loader.gif')}"  alt="" />
			</g:if>

			<g:if test="${single}">
				<g:hiddenField name="search" value="${search}" />
				<g:hiddenField name="query" value="${query}" />
				<g:hiddenField name="single" value="${single}" />
				<g:hiddenField name="cb" value="${cb}" />
				<g:hiddenField name="acl" value="${acl}" />
				<g:actionSubmit style="position:absolute; left:1080px; top:63px; width:100px" class="callerButton" id="submit" action="save_assess_call" value="Finish" />
			</g:if>
			<g:if test="${start && queue}">
				<g:hiddenField name="queue" value="${queue}" />
                <g:actionSubmit id="submit" controller="call" class="callerButton" style="position:absolute; left:1070px; top:62px" action="next_assess_call" value="Start Calling" />
                <span style="position:absolute; left:975px; top:64px"><g:select id="timezone" name="timezone" from="${timezones}" /></span>
                <img id="loader" style="position:absolute; left:1175px; padding-top:3px; height:25px; display:none;" src="${resource(dir:'images', file:'ajax-loader.gif')}"  alt="" />
			</g:if>

		</div>

		<div class="body" style="width:1250px">
			<ul class="tabs">
				<li><a href="#tab1">Customer Information</a></li>
				<sks:productAssessmentNav id="${customerInstance?.id}"/>
				<!-- <li><a href="#tab4">Final Questions</a></li> -->
			</ul>

            <div id="tab1" class="tab_content">
                <div class="dialog">
                    <div id="column1" style="width:415px; float:left">
                        <table style="width:400px; margin: 10px 10px 0 0; margin-left:0">
							<tbody>
                            <tr class="prop">
                                <td valign="top" colspan="2">
                                    <g:if test="${customerInstance?.pastParticipant}">
                                        <span style="color:green; font-weight:bold;">Past participant</span>
                                    </g:if>
                                    <g:else>
                                        <span style="color:gray">Has not participated in the past</span>
                                    </g:else>

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="source"><g:message code="customer.source.label" default="Source" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'source', 'errors')}">
                                    ${customerInstance?.source}
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fsdName"><g:message code="customer.fsdName.label" default="FSD Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdName', 'errors')}">


                                    <g:textField class="textField" name="fsdName" value="${customerInstance?.fsdName}" style="width:290px;" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fsdTitle"><g:message code="customer.fsdTitle.label" default="FSD Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdTitle', 'errors')}">


                                    <g:textField class="textField" name="fsdTitle" value="${customerInstance?.fsdTitle}" style="width:290px;" />
                                </td>
                            </tr>


                            <tr class="prop">
      							<td valign="top" class="name">
      								<label for="email"><g:message code="customer.email.label" default="Email" /></label>
      							</td>
      							<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'email', 'errors')}">
      								<g:textField class="textField" name="email" value="${customerInstance?.email}" />
      							</td>
      						</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="district"><g:message code="customer.district.label" default="District" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'district', 'errors')}">


									<g:textField class="textField" name="district" value="${customerInstance?.district}" style="width:290px;" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="address.street"><g:message code="address.street.label" default="Street" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'street', 'errors')}">
									<g:textField class="textField" name="address.street" value="${customerInstance?.address?.street}" style="width:290px;" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="address.street2"><g:message code="address.street2.label" default="Street 2" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'street2', 'errors')}">
									<g:textField class="textField" name="address.street2" value="${customerInstance?.address?.street2}" style="width:290px;" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="address.city"><g:message code="address.city.label" default="City" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'city', 'errors')}">
									<g:textField class="textField" name="address.city" value="${customerInstance?.address?.city}" style="width:120px; margin-right:10px;" />
                                </td>
                              </tr>
                            <tr class="prop">
                              <td class="name">
									<label for="address.state"><g:message code="address.state.label" default="State" /></label>
                              </td>
                              <td class="value">
									<g:textField class="textField" name="address.state" value="${customerInstance?.address?.state}" style="width:35px;  margin-right:10px;"/>
									<label for="address.zip"><g:message code="address.zip.label" default="Zip" /></label>
									<g:textField class="textField" name="address.zip" value="${fieldValue(bean: customerInstance?.address, field: 'zip')}" style="width:50px" />
                              </td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="studentsInDistrict"><g:message code="customer.studentsInDistrict.label" default="Students" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'studentsInDistrict', 'errors')}">
									<g:textField name="studentsInDistrict" value="${fieldValue(bean: customerInstance, field: 'studentsInDistrict')}" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="column2" style="width:500px; float:left">
					<table style="width:500px;margin-top: 10px; margin-left: 0; margin-right:10px;">
						<tbody>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="phone"><g:message code="customer.phone.label" default="Phone" /></label>
								</td>
								<td valign="top">
									<g:textField style="width:150px;" name="phone" value="${customerInstance?.phone}" />
									<label for="callbackDateString" style="padding: 0 10px 0 3px;"><g:message code="callback.date" default="Callback Date" /></label>
									<input type="text" style="width:90px" id="callbackDateString" name="callbackDateString" />
								</td>

							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="fax"><g:message code="customer.fax.label" default="Fax" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fax', 'errors')}">
									<g:textField style="width:150px;" class="textField" name="fax" value="${customerInstance?.fax}" />
									<label for="callbackTime" style="padding: 0 10px 0 3px;"><g:message code="callback.date" default="Callback Time" /></label>
									<input type="text" style="width:90px" id="callbackTime" name="callbackTime" />
								</td>

							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="deliveryAddress.street"><g:message code="address.street.label" default="Del. Street" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance?.deliveryAddress, field: 'street', 'errors')}">
									<g:textField class="textField" name="deliveryAddress.street" value="${customerInstance?.deliveryAddress?.street}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="deliveryAddress.street2"><g:message code="address.street2.label" default="Del. Street 2" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'street2', 'errors')}">
									<g:textField class="textField" name="deliveryAddress.street2" value="${customerInstance?.deliveryAddress?.street2}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="deliveryAddress.city"><g:message code="address.city.label" default="Del. City" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance?.deliveryAddress, field: 'city', 'errors')}">
									<g:textField class="textField" name="deliveryAddress.city" value="${customerInstance?.deliveryAddress?.city}" style="width:150px; margin-right:10px;" />
									<label for="deliveryAddress.state"><g:message code="deliveryAddress.state.label" default="State" /></label>
									<g:textField class="textField" name="deliveryAddress.state" value="${customerInstance?.deliveryAddress?.state}" style="width:35px;  margin-right:10px;"/>
									<label for="deliveryAddress.zip"><g:message code="deliveryAddress.zip.label" default="Zip" /></label>
									<g:textField class="textField" name="deliveryAddress.zip" value="${fieldValue(bean: customerInstance?.deliveryAddress, field: 'zip')}" style="width:50px" />
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table style="width:500px;">
						<tbody>
						    <tr class="prop">
								<td valign="top" class="name">
									<label for="studentsInDistrict"><g:message code="customer.studentsInDistrict.label" default="# of Students In District" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'studentsInDistrict', 'errors')}">
									<g:textField name="studentsInDistrict" value="${fieldValue(bean: customerInstance, field: 'studentsInDistrict')}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="breakfastsServed"><g:message code="customer.breakfastsServed.label" default="# of Breakfasts Served" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'breakfastsServed', 'errors')}">
									<g:textField name="breakfastsServed" value="${fieldValue(bean: customerInstance, field: 'breakfastsServed')}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="lunchesServed"><g:message code="customer.lunchesServed.label" default="# of Lunches Served" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'lunchesServed', 'errors')}">
									<g:textField name="lunchesServed" value="${fieldValue(bean: customerInstance, field: 'lunchesServed')}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="snacksServed"><g:message code="customer.snacksServed.label" default="# of Snacks Served" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'snacksServed', 'errors')}">
									<g:textField name="snacksServed" value="${fieldValue(bean: customerInstance, field: 'snacksServed')}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="facilities"><g:message code="customer.facilities.label" default="# of Facilities" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'facilities', 'errors')}">
									<g:textField name="facilities" value="${fieldValue(bean: customerInstance, field: 'facilities')}" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>


					</div>
				</div>

				<div style="border:1px; width:940px"><sks:productAssessmentTabs id="${customerInstance?.id}" /></div>


				<table style="margin: 20px 0 10px 0; width:280px; position:absolute; top:120px; left:965px;" class="callerRecord">
						<tbody>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="result"><strong>Call Result</strong></label>
								</td>
								<td valign="top" class="value">
									 <g:select style="width:175px" id="result" name='result' value="${call?.result?.id}" valueMessagePrefix="call.result" optionKey="key"
										noSelection="${['null':'Select One...']}"
										from='${CallResult.enumConstants}' />
								</td>
							</tr>
							<g:render template="previousCall" model="['customerInstance': customerInstance ]" />
						</tbody>
					</table>

				<table style="margin:10px 10px 0 0; width:320px; position:absolute; top:370px; left:955px; border:none; height:320px;">
					<tbody>
						<tr>
							<td class="prop" style=" background-image:url(${resource(dir:'images', file:'callnote-assess.png')}); background-repeat:no-repeat">
								<h3 style="padding-top:10px; padding-left:10px">Operator Comments</h3>
								<br />
								<g:textArea rows="" cols="" style="width:270px; height:250px; background:none; margin-left:10px" name="opNotes" value="${customerInstance?.opNotes}"/>
							</td>
						</tr>
					</tbody>
				</table>






		</div>
	</g:form>

</body>
</html>