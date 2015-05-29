<%@ page language="java" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.action-buttons-bar button {
	margin: 2px 5px 5px 5px;
}

.table-hover>tbody>tr:hover>td, .table-hover>tbody>tr:hover>th {
	background-color: #FFEBCD
}

.table-hover>tbody>tr.active:hover>td, .table-hover>tbody>tr.active:hover>th
	{
	background-color: #FFEBCD
}

.table>thead>tr>.active, .table>tbody>tr>.active, .table>tfoot>tr>.active,
	.table>thead>.active>td, .table>tbody>.active>td, .table>tfoot>.active>td,
	.table>thead>.active>th, .table>tbody>.active>th, .table>tfoot>.active>th
	{
	background-color: #F5F5DC
}

.table-striped>tbody>tr:nth-child(odd)>.active>td, .table-striped>tbody>tr:nth-child(odd)>.active>th
	{
	background-color: #F5F5DC
}

.btn-primary a, .btn-primary a:hover {
	color: #fff;
	text-decoration: none;
}

.content_font {
	font-size: 16px;
	padding: 10px;
}

.action-buttons a {
	margin: 0 10px;
	display: inline-block;
	opacity: .85;
	-webkit-transition: all .1s;
	-o-transition: all .1s;
	transition: all .1s;
}

.widget-header {
	min-height: 38px;
	padding-left: 0px;
}

.table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
	padding: 4px;
	vertical-align: middle;
}

.btn {
	text-shadow: 0 0px 0 rgba(0, 0, 0, .25);
}

input[type=checkbox].ace.ace-switch.ace-switch-6+.lbl::before {
	font-family: FontAwesome;
	content: "全部折叠";
	/*  content: "\f00d"; */
	text-shadow: 0 -1px 0 rgba(0, 0, 0, .25);
	box-shadow: none;
	border-width: 0;
	font-weight: normal;
	font-size: 14px;
	border-radius: 12px;
	display: inline-block;
	background-color: #69aa46;
	color: #F2F2F2;
	width: 100px;
	height: 28px;
	line-height: 21px;
	text-indent: 35px;
	-webkit-transition: background .1s ease;
	-o-transition: background .1s ease;
	transition: background .1s ease;
	line-height: 28px;
}

input[type=checkbox].ace.ace-switch.ace-switch-6+.lbl::after {
	content: '';
	text-shadow: 0 -1px 0 rgba(0, 0, 0, .25);
	position: absolute;
	top: 2px;
	left: 10px;
	border-radius: 12px;
	box-shadow: 0 -1px 0 rgba(0, 0, 0, .25);
	width: 22px;
	height: 22px;
	text-align: center;
	background-color: #F2F2F2;
	border: 4px solid #F2F2F2;
	-webkit-transition: left .2s ease;
	-o-transition: left .2s ease;
	transition: left .2s ease
}

input[type=checkbox].ace.ace-switch.ace-switch-6:checked+.lbl::before {
	content: "全部展开";
	/*  content: "\f00c"; */
	text-indent: 6px;
	color: #FFF;
	border-color: #b7d3e5;
	background-color: #ff893c
}

input[type=checkbox].ace.ace-switch.ace-switch-6:checked+.lbl::after {
	left: 70px;
	background-color: #FFF;
	border: 4px solid #FFF;
	text-shadow: 0 -1px 0 rgba(0, 200, 0, .25)
}
</style>
<input type="hidden" id="length_summary" value="${length_summary }" />
<table id="st"
	class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
	<thead>
		<th width="100px" class="sorting_disabled center align-middle ">用户</th>
		<th class="sorting_disabled ">消息内容</th>
		<th class="sorting_disabled "></th>
		<th width="10px" class="sorting_disabled center align-middle"><label
			class="pos-rel"> <input type="checkbox" id="checkAllNeed"
				onclick="checkNeed(this)" class="ace" /> <span class="lbl"></span>
		</label></th>
	</thead>
	<tbody id="simple-table">
		<c:forEach items="${msgs}" var="row">
			<tr id="tr-${row.id}" rel="tr">
				<td>
					<div class="appid-name center align-middle"></div>
					<div>
						<ul class="nav ace-nav center align-middle">
							<c:out value="${row.name}"/>
						</ul>
					</div>
				</td><td>
					<div class="appid-name center align-middle"></div>
					<div>
						<ul class="nav ace-nav center align-middle">
							<c:out value="${row.content}"/>
						</ul>
					</div>
				</td>
				<td>
					<div class="appid-name center align-middle"></div>
					<div>
							<c:out value="${row.createTime}" />
					</div>
				</td>

				<td class="center align-middle"><label class="pos-rel">
						<input type="checkbox" id="<c:out value="${row.id }"/>"
						class="ace" rel="check" /> <span class="lbl"></span>
				</label></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div>
	<script src="commons/js/rating.js"></script>
	<script src="commons/js/app.js"></script>
	<script src="commons/js/moment-with-locales.js"></script>
	<script type="text/javascript">
	jQuery(function($) {
        if(${needvolist.size()}>0){
            if("${mid}"!="null" && "${mid}"!=""){
            	//openContent('${mid}');
            	//定位当前行TODO
            }
        }
    });
	</script>
</div>