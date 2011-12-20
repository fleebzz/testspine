<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8>
	<title>App</title>

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/spine/public/application.css" charset="utf-8" />

	<script src="<?php echo Yii::app()->request->baseUrl; ?>/spine/public/application.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript" charset="utf-8">
		var jQuery  = require("jqueryify");
		var exports = this;
		jQuery(function(){
			var App = require("index");
			exports.app = new App({el: $("body")});
		});
	</script>

</head>

<body>

</body>
</html>