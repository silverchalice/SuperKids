

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
		<script type="text/javascript" src="${resource(dir:'js', file:'sks.js')}">
		</script>
      		<style type="text/css">
              input {
                width:auto
                }

                #assessForm {
                    width:500px;
             }

               label {
                   white-space: normal;
               }

               .prop .name {
                   width:auto
               }

               .prop .value {
                   width:auto
               }

			#assessForm {
				width:500px;
			}

			#assessForm input {
				width:auto
			}

		</style>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <div style="margin:20px 0; padding:15px;">
                <g:form method="post" action="findSchoolDistrict">
                    School District: <input type="text" name="query" />
                    <input type="submit" id="customerSearchButton" value="Search" />
                </g:form>
            </div>
            <h1>Add a Customer</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${customerInstance}">
            <div class="errors">
                <g:renderErrors bean="${customerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
               <g:hiddenField name="seq" value="9999" />
               <div class="dialog" style="float:left; width:320px; margin:0">
                 <h1>Main Information</h1>
                    <table style="width:320px;">
                        <tbody>
                            <tr class="prop">
                                <td class="name"></td>
                                <td class="value">
                                    <h3>FSD/Main Contact</h3>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fsdName"><g:message code="customer.fsdName.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdName', 'errors')}">
                                    <g:textField class="textField" name="fsdName" value="${customerInstance?.fsdName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fsdTitle"><g:message code="customer.fsdTitle.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdTitle', 'errors')}">
                                    <g:textField class="textField" name="fsdTitle" value="${customerInstance?.fsdTitle}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="customer.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${customerInstance?.email}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td class="name"></td>
                                <td class="value">
                                    <h3>Alternate Contact</h3>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cdName"><g:message code="customer.cdName.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'cdName', 'errors')}">
                                    <g:textField class="textField" name="cdName" value="${customerInstance?.cdName}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cdTitle"><g:message code="customer.cdTitle.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'cdTitle', 'errors')}">
                                    <g:textField class="textField" name="cdTitle" value="${customerInstance?.cdTitle}"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cdEmail"><g:message code="customer.cdEmail.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'cdEmail', 'errors')}">
                                    <g:textField class="textField" name="cdEmail" value="${customerInstance?.cdEmail}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    &nbsp;
                                </td>
                                <td valign="top">
                                  &nbsp;
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phone"><g:message code="customer.phone.label" default="Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'phone', 'errors')}">
                                    <g:textField class="textField"  name="phone" value="${customerInstance?.phone}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fax"><g:message code="customer.fax.label" default="Fax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fax', 'errors')}">
                                    <g:textField class="textField"  name="fax" value="${customerInstance?.fax}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="customer.password.label" default="Password" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField class="textField" name="password" value="superkids" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td class="name"></td>
                                <td class="value">
                                    <br />
                                    <h3>Customer Address</h3>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="district"><g:message code="customer.district.label" default="District" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'district', 'errors')}">
                                    <g:textField class="textField" name="district" value="${customerInstance?.district}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.address.street.label" default="Street" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField class="textField"  name="address.street" value="${customerInstance?.address?.street}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.address.street2.label" default="Street 2" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField class="textField"  name="address.street2" value="${customerInstance?.address?.street2}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.address.city.label" default="City" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField class="textField"  name="address.city" value="${customerInstance?.address?.city}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.deliveryAddress.state.label" default="State" /></label>
                                </td>
                                <td valign="top">
                                   <g:select name="address.state" from="${states}" value="${customerInstance?.address?.state}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.address.zip.label" default="Zip" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField class="textField"  name="address.zip" value="${customerInstance?.address?.zip}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td class="name"></td>
                                <td class="value">
                                    <br />
                                    <h3>Delivery Address</h3>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.deliveryAddress.street.label" default="Del Street" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField class="textField"  name="deliveryAddress.street" value="${customerInstance?.deliveryAddress?.street}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.deliveryAddress.street2.label" default="Del Street 2" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField class="textField"  name="deliveryAddress.street2" value="${customerInstance?.deliveryAddress?.street2}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.deliveryAddress.city.label" default="Del City" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField class="textField"  name="deliveryAddress.city" value="${customerInstance?.deliveryAddress?.city}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.deliveryAddress.state.label" default="Del State" /></label>
                                </td>
                                <td valign="top">
									<g:select name="deliveryAddress.state" from="${states}" value="${customerInstance?.deliveryAddress?.state}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label><g:message code="customer.deliveryAddress.zip.label" default="Del Zip" /></label>
                                </td>
                                <td valign="top">
                                   <g:textField class="textField"  name="deliveryAddress.zip" value="${customerInstance?.deliveryAddress?.zip}" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    </div>
                    <div style="float:left; width:420px; margin-left:10px">
                        <h1>Additional Information</h1>
                         <table style="width:420px;">
                            <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="studentsInDistrict"><g:message code="customer.studentsInDistrict.label" default="Students In District" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'studentsInDistrict', 'errors')}">
                                    <g:textField name="studentsInDistrict" value="${fieldValue(bean: customerInstance, field: 'studentsInDistrict')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td colspan="2">Approximately how many students participate<br/> in your foodservice program?
                                    <input type="text" name="studentsParticipate" size="4" maxlength="6" value="${customerInstance?.studentsParticipate}"></td>
                            </tr>
                            <tr class="prop">
                                <td colspan="2">Approximately what percent of those students<br/> are free or reduced?
                                    <input  type="text" name="freeStudents" size="4" maxlength="6" value="${customerInstance?.freeStudents}"></td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="facilities"><g:message code="customer.facilities.label" default="Facilities" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'facilities', 'errors')}">
                                    <g:textField name="facilities" value="${fieldValue(bean: customerInstance, field: 'facilities')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="breakfastsServed"><g:message code="customer.breakfastsServed.label" default="Breakfasts Served" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'breakfastsServed', 'errors')}">
                                    <g:textField name="breakfastsServed" value="${fieldValue(bean: customerInstance, field: 'breakfastsServed')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lunchesServed"><g:message code="customer.lunchesServed.label" default="Lunches Served" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'lunchesServed', 'errors')}">
                                    <g:textField name="lunchesServed" value="${fieldValue(bean: customerInstance, field: 'lunchesServed')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="snacksServed"><g:message code="customer.snacksServed.label" default="Snacks Served" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'snacksServed', 'errors')}">
                                    <g:textField name="snacksServed" value="${fieldValue(bean: customerInstance, field: 'snacksServed')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hasBakery">We make our own bread products from
                                    scratch in our bakery (proof & bake)</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'hasBakery', 'errors')}">
                                    <g:checkBox name="hasBakery" value="${customerInstance?.hasBakery}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="monthlyFlourUsage">If yes, how much flour does your district use on a monthly basis in pounds?</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'monthlyFlourUsage', 'errors')}">
                                    <g:textField class="textField" name="monthlyFlourUsage" value="${customerInstance?.monthlyFlourUsage}" />
                                </td>
                            </tr>

                            <tr>

                                <td colspan="2">When do you start look at new items for your menu?
                                    <br/>
                                    <input type="text" name="startLooking" value="${customerInstance?.startLooking}" size="55" maxlength="1000"></td>
                            </tr>

                            <tr>

                                <td colspan="2">When do you issue your bid?
                                    <br/>
                                    <input type="text" name="startBidding" value="${customerInstance?.startBidding}" size="55" maxlength="1000"></td>
                            </tr>


                            <tr>
                                <td colspan="2">Do you bake from scratch in your district? <g:checkBox name="hasBakery" value="${customerInstance?.hasBakery}" />
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">a) If yes, do you use commodity flour? &nbsp; Whole Wheat Flour?  <g:checkBox name="useWholeWheatFlour" value="${customerInstance?.useWholeWheatFlour}" /> <br/> Ultragrain/ Healthy Choice T-2 with Ultragrain? <g:checkBox name="useUltragrainFlour" value="${customerInstance?.useUltragrainFlour}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="localBakeries">Do you work with a local bakery to supply your fresh bakery products? If you’d like us to
                                    contact them about the program, please list them here: </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'localBakeries', 'errors')}">
                                    <g:textField class="textField" name="localBakeries" value="${customerInstance?.localBakeries}" />
                                </td>
                            </tr>



                            <tr class="prop">
                                <td valign="top" class="name">Member of a Co-op</td>

                                <td valign="top" class="value"><g:checkBox name="coOpMember" value="${customerInstance?.coOpMember}"/></td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">Co-op Name</td>

                                <td valign="top" class="value"><g:textField class="texField" name="coOpName" value="${customerInstance.coOpName}" /></td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">Send Samples to Co-op</td>

                                <td valign="top" class="value"><g:checkBox name="coOpSamples" value="${customerInstance?.coOpSamples}"/></td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">Co-op Sample Delivery Address</td>

                                <td valign="top" class="value"><g:textField class="texField" name="coOpAddress" value="${customerInstance.coOpAddress}" /></td>
                            </tr>


                            <tr class="prop">
                                <td valign="top" class="name">Contract Managed</td>

                                <td valign="top" class="value"><g:checkBox name="contractManaged" value="${customerInstance?.contractManaged}"/></td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">Contractor</td>

                                <td valign="top" class="value"><g:textField class="texField" name="contractManager" value="${customerInstance.contractManager}" /></td>
                            </tr>

      							<tr class="prop">
                                      <td valign="top" class="name">
                                        <label for="seq"><g:message code="customer.seq.label" default="Sequence Number (DO NOT CHANGE)" /></label>
                                      </td>
                                      <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'seq', 'errors')}">
                                          <g:textField name="seq" value="${fieldValue(bean: customerInstance, field: 'seq')}" />
                                      </td>
                                  </tr>
                              <tr>
                                  <td colspan="2">
                                  Please let us know if you would any of these manufacturers to contact you immediately.
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="2">
                                      <g:each in="${sponsors}" var="sponsor">
                                          <span style="display: block;"><g:checkBox name="sponsor.${sponsor.id}" checked="${customerInstance.contactManufacturers?.contains(sponsor)}"/>${sponsor.name}</span>
                                      </g:each>
                                  </td>
                              </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="seq"><g:message code="customer.otherComments.label" default="Please list any special requests for the manufacturers you checked:" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'seq', 'errors')}">
                                    <g:textField name="otherComments" value="${fieldValue(bean: customerInstance, field: 'otherComments')}" />
                                </td>
                            </tr>

                                <tr class="prop">
                                    <td valign="top" class="name">
                                      <label for="didNotReceiveMailing"><g:message code="customer.didNotReceiveMailing.label" default="Did not Receive Mailing" /></label>
                                    </td>
                                    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'didNotReceiveMailing', 'errors')}">
                                        <g:checkBox name="didNotReceiveMailing" value="${customerInstance?.didNotReceiveMailing}" />
                                    </td>
                                </tr>
                                <tr class="prop">
                                    <td valign="top" class="name">
                                      <label for="callerBrokers"><g:message code="customer.callerBrokers.label" default="Primary Foodservice Distributors" /></label>
                                    </td>
                                    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'callerBrokers', 'errors')}">
                                        <g:textField class="textField"  name="callerBrokers" value="${customerInstance?.callerBrokers}" />
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                      <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="save" value="${message(code: 'default.button.save.label', default: 'Save')}" /></span>
                    </div>
                </div>

            </g:form>

        </div>
    </body>
</html>
