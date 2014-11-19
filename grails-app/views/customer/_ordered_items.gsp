<%@ page import="com.superkids.domain.ShippingDate" %>
<table cellpadding="5" cellspacing="0" style="width:420px; border: 1px solid #cccccc;">
		<tr>
			<td colspan="3" align="left" class="adminheadline">Ordered Items &nbsp;
			 <g:link controller="customerOrder" action="show" id="${customerInstance?.customerOrder?.id}">(View Order)</g:link></td>
			<td colspan="3" align="left" class="">
                <g:if test="${!customerInstance?.hasCompletedCurrentAssessment}">
                    <a href="javascript:showCompleteAssessForm()">Complete Assessment</a>
                </g:if>
                <g:else>
                    &nbsp;
                </g:else>
            </td>
		</tr>
		<tr>
			<th>Item Name</th>
			<th>Ship Date</th>
			<th>Assessed</th>
			<th style="width:75px;">Not Received</th>
			<th style="width:75px;">Not Sampled</th>
		</tr>
		<g:form name="OrderProduct" action="add_order" method="post">
		<g:hiddenField name="id" value="${customerInstance.id}" />
			<g:each in="${products.sort{it?.product?.sortOrder}}" var="productOrder" status="i">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td><img style="float:left; width:50px; margin-right:10px" src="${createLink(controller:'product', action:'displayImage', id:productOrder.product.id)}" alt="" />
						${productOrder.product?.sponsor?.name}<sup>®</sup> ${productOrder.product?.name}</td>
					<td style="width:120px;"><p style="margin-top:5px">${customerInstance?.customerOrder?.shippingDate}</p></td>
					<td><p style="margin-top:5px">
						<sks:adminAssessLink id="${productOrder.id}" show="${show}"/>
					</p></td>
					<td style="width:75px;">  <p style="margin-top:4px">
            <sks:ifNotAssessed customerId="${customerInstance?.id}" productOrderId="${productOrder?.id}">
					    <sks:dnrCheckbox pOrderId="${productOrder?.id}" />
            </sks:ifNotAssessed>
					</td>
          <td style="width:75px;">  <p style="margin-top:4px">
            <sks:ifNotAssessed customerId="${customerInstance?.id}" productOrderId="${productOrder?.id}">
              <sks:dnsCheckbox pOrderId="${productOrder?.id}" />
            </sks:ifNotAssessed>
          </td>
				</tr>
			</g:each>
	</g:form>
</table>


<div id="assessForm">
	<g:form action="adminAssessProduct">
		<g:hiddenField name="productOrderId" id="productOrderId" />
		<h3>Assessment Origin</h3>
		<g:radioGroup name="orderType" values="['PHONE','WEB','EMAIL', 'FAX', 'MAIL']" labels="['Phone','Web','Email', 'Fax', 'Mail']" value="5" >
			<g:message code="${it.label}" />: ${it.radio}
		</g:radioGroup>
		<br/>
        <h3>Did not receive product?</h3>
        <g:checkBox name="didNotReceive"/>
		<br/>
		<h3>Assessment Question 1 of 3</h3>
        On a scale of 1-5 (1-very low; 5-very high), please rate your interest in adding this item to your school menu.<br/>
		<g:radioGroup name="likeRating" values="['1', '2', '3', '4','5']" labels="['1', '2', '3', '4','5']" value="3" >
			<g:message code="${it.label}" />${it.radio}
		</g:radioGroup>
		<br/>
		<br/>
		<h3>Assessment Question 2 of 3</h3>
        What things did you like most (list as many as necessary)? <br/>
		<g:textArea rows="" cols="" name="likeComment" style="width:465px" />
		<br/>
		<h3>Assessment Question 3 of 3</h3>
        What things would you change (list as many as necessary)?<br/>
		<g:textArea rows="" cols="" name="changeComment"  style="width:465px" />
		<br/>

		<br/>
		<br/>
		<g:submitButton name="submitAssessment" id="submitAssessment" value="Continue" /> 

	</g:form>
</div>


<div id="completeAssessmentForm">
	<g:form action="completeAssessment" id="${customerInstance?.id}">
		<h3>Additional Comments & Suggestions</h3>
		Are there any whole grain-rich foods on your menu that aren't meeting your or your students&#8217 expectations, and if so, why not?<br/>
		<g:textArea cols="" rows="" name="expectationsNotMetFeedback" style="width:465px" />
		<br/>
		<br/>
		<h3>Program Feedback</h3>
		Please give us feedback on the SuperKids program in general.<br/>
		<g:textArea cols="" rows="" name="programFeedback" style="width:465px" />
		<br/>
    <br />
    If you&#8217;ve participated in the SuperKids Program in the past, did you add any of the item you&#8217;ve sampled to your menu?<br/>
    <p>
      <g:radioGroup name="addedPastItemsToMenu"
                  labels="['Yes','No']"
                  values="['true', 'false']"
                  value="false">
        <span style="${it.label == 'true' ? 'margin-right: 300px;' : ''}">${it.label} ${it.radio}</span>
       </g:radioGroup>
     </p>
    <br/>
    <p>Did you order any of the foods featured from these food companies?</p>
    <div class="expand">&nbsp;</div>

    <table cellpadding="0" cellspacing="0" style="width: 90%;">
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="Azteca" /> Azteca
        </td>
      </tr>
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="Integrated Food Service" /> Integrated Food Service
        </td>
      </tr>
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="Buena Vista Food Products" /> Buena Vista Food Products
        </td>
      </tr>
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="Jane's Dough Foods" /> Jane&#8217;s Dough Foods
        </td>
      </tr>
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="ConAgra Mills" /> ConAgra Mills
        </td>
      </tr>
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="JM Swank" /> JM Swank
        </td>
      </tr>
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="Dick & Jane Baking Company" /> Dick & Jane Baking Company
        </td>
      </tr>
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="Kellogg's" /> Kellog&#8217;s
        </td>
      </tr>
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="Domino's Pizza" /> Domino&#8217;s Pizza
        </td>
      </tr>
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="Pepperidge Farm" /> Pepperidge Farm
        </td>
      </tr>
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="EONI" /> EONI
        </td>
      </tr>
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="Sara Lee Foodservice" /> Sara Lee FoodService
        </td>
      </tr>
      <tr>
        <td>
          <g:checkBox name="pastCompanies" value="Flowers Bakeries Foodservice" /> Flowers Bakeries Foodservice
        </td>
      </tr>
    </table>
    <br />
    <h3>Rewards</h3>
          Thank You!Your assessment has been received, qualifying you for the sweepstakes prize drawing.
          <ol style="list-style-type:decimal; color:#000000; font-weight:normal">
          <li><span style="color:#800000">FIVE (5) First Place Prizes</span>--&#36;200 Gift Card from your choice of Wal-Mart, Target, Learning Zone Xpress, or the OrganWise Guys</li>
          <li><span style="color:#800000">SEVEN (7) Second Place Prizes</span>--&#36;100 Gift Card from your choice of Wal-Mart, Target, Learning Zone Xpress, or the OrganWise Guys</li>
          </ol>
          <p style="color:#000000; font-weight:normal">Please note that you are responsible for ensuring that any rewards provided to you within this program are authorized by your school district.
          Click sweepstakes rules for more information. <g:link controller="home" action="assessment_drawing_rules">Sweepstakes Rules</g:link>    </p>

		<br/>
		<g:submitButton name="completeAssessment" id="completeAssessment" value="Continue" />

	</g:form>
</div>
