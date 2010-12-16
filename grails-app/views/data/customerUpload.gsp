<html>
<head>
	<title>SuperKids | Utilities Dashboard</title>
	<meta name="layout" content="main" />
</head>
<body>
<h1>Upload Customer Data</h1>
    <g:form action="loadCustomerData" enctype="multipart/form-data" name="cust_data_form">
		<input type="file" name="cust_data" /><br/>
		<input type="submit" value="Upload File" />
	</g:form>
<h1>Upload DNRMailing Data</h1>
    <g:form action="processDNRUpdate" enctype="multipart/form-data" name="cust_data_form">
		<input type="file" name="cust_data" /><br/>
		<input type="submit" value="Upload File" />
	</g:form>
<h1>Update FSD Titles</h1>
    <g:form action="processFSDTitleUpdate" enctype="multipart/form-data" name="cust_data_form">
		<input type="file" name="cust_data" /><br/>
		<input type="submit" value="Upload File" />
	</g:form>
</body>
</html>
