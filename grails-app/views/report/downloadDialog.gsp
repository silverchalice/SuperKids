<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Download File</title>
</head>
<body>
	<div class="body">
		<h3>Click link to download the export file.</h3>
		<a href="${resource(dir: 'tmp', file: fileName)}" type="application/vnd.ms-excel">
			Download ${desc}.
		</a>
		<br/>
		<g:link controller="customer" action="list">Done</g:link>
	</div>
</body>
</html>