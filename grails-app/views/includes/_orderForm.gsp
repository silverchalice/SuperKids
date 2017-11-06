<tr>
    <td colspan="2">
        <strong>1.</strong> How many students are in your district?
        <input type="text" name="studentsInDistrict" size="4" maxlength="6" value="${customerInstance?.studentsInDistrict}">
    </td>
</tr>
<tr>
    <td colspan="2">
        <strong>2.</strong>	How many students participate in your<br/> school foodservice program? <input type="text" name="studentsParticipate" size="4" maxlength="6" value="${customerInstance?.studentsParticipate}"><br/>
        Breakfast: <input type="text" name="studentsParticipateBreakfast" size="4" maxlength="6" value="${customerInstance?.studentsParticipateBreakfast}">
        Lunch: <input type="text" name="studentsParticipateLunch" size="4" maxlength="6" value="${customerInstance?.studentsParticipateLunch}">
        After School: <input type="text" name="studentsParticipateAfterSchool" size="4" maxlength="6" value="${customerInstance?.studentsParticipateAfterSchool}"></td>
</tr>

<tr>

    <td colspan="2"><strong>3.</strong>	Who is your primary distributor?
        <br/>
        <input type="text" name="callerBrokers" value="${customerInstance?.callerBrokers}" size="55" maxlength="1000"></td>
</tr>

<tr>
    <td colspan="2"><strong>4.</strong> Do you bake from scratch using flour or mixes in your district (do not include parbaked items)?
        <g:select name="hasBakery" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.hasBakery?.toString()}"/>
    </td>
</tr>

<tr>
    <td colspan="2">a)	Do you use Ultragrain 100% whole wheat flour?
        <g:select name="useUltragrainFlour" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.useUltragrainFlour?.toString()}"/>
    </td>
</tr>

<tr>
    <td colspan="2">b)	Do you use Ultragrain T-2 (55% Ultragrain/45% white flour?)
        <g:select name="useUltragrainWhiteFlour" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.useUltragrainWhiteFlour?.toString()}"/>
    </td>
</tr>

<tr>
    <td colspan="2">c)	Do you use Commodity Flour?
        <g:select name="buyCommodityFlour" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.buyCommodityFlour?.toString()}"/>
    </td>
</tr>

<tr><td colspan="2">d) Do you use other flours (please list)? <br/>
    <input type="text" name="otherFlours" value="${customerInstance?.otherFlours}" size="55" maxlength="1000"></td>
</tr>

<tr><td colspan="2">e) Do you use mixes (please list)? <br/>
    <input type="text" name="otherMixes" value="${customerInstance?.otherMixes}" size="55" maxlength="1000"></td>
</tr>

<tr>
    <td colspan="2">
        Do you experience any challenges when scratch baking?
        <g:select name="bakingChallenges" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.bakingChallenges?.toString()}"/>

    </td>
</tr>

<tr><td colspan="2">If yes, which items? <br/>
    <input type="text" name="otherFlourIssues" value="${customerInstance?.otherFlourIssues}" size="55" maxlength="1000"></td>
</tr>

<tr>
    <td colspan="2"><strong>5.</strong> If you've participated in SuperKids in the past, did you add any of the items <br />you sampled to your menu?
    <g:select name="addedPastItemsToMenu" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.addedPastItemsToMenu?.toString()}"/>
    </td>
</tr>
<tr>
    <td colspan="2">a) If yes, which items? <br/>
        <input type="text" name="pastItemsAddedToMenu" value="${customerInstance?.pastItemsAddedToMenu}" size="55" /></td>
</tr>

<tr>
    <td colspan="2"><strong>6.</strong> Do you look for &#8220;Ultragrain&#8221; when trying new whole grain-rich foods?
    <g:select name="lookForUltragrain" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.useUltragrainFlour?.toString()}"/>
    </td>
</tr>

<tr><td colspan="2"><strong>7.</strong>Do you participate in any waivers for whole grain-rich foods?
<g:select name="participateWaivers" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.participateWaivers?.toString()}"/>
</td>
</tr>
<tr>
    <td colspan="2">If yes, for what items?
        <input type="text" name="participateWaiversItems" value="${customerInstance?.participateWaiversItems}" size="55" maxlength="1000">
    </td>
</tr>