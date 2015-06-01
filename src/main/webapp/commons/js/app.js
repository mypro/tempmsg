var now = new Date();
var number = now.getYear().toString() + now.getMonth().toString()
		+ now.getDate().toString() + now.getHours().toString()
		+ now.getMinutes().toString() + now.getSeconds().toString();
document
		.write("\<script language=\"javascript\" type=\"text/javascript\" src=\"commons/js/xh_censor_config.js?v="
				+ number + "\"><\/script\>");
$("span.badge").each(function() {
	var corlor = rating2Corlor($(this).text());
	$(this).addClass(corlor);
});