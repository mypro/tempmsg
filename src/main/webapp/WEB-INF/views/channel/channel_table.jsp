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
		<th width="100px" class="sorting_disabled center align-middle "></th>
		<th class="sorting_disabled "></th>
		<th width="10px" class="sorting_disabled center align-middle"><label
			class="pos-rel"> <input type="checkbox" id="checkAllNeed"
				onclick="checkNeed(this)" class="ace" /> <span class="lbl"></span>
		</label></th>
		<th width="184px" class="sorting_disabled"></th>
	</thead>
	<tbody id="simple-table">
		<c:forEach items="${needvolist}" var="row">
			<tr id="tr-${row.censorNeed.id }" rel="tr"
				data-id="${row.censorNeed.id }"
				data-apppId="${row.censorNeed.appId }"
				data-column="${row.censorNeed.column }"
				data-extendedColumn1="${row.censorNeed.extendedColumn1 }"
				data-extendedColumn2="${row.censorNeed.extendedColumn2 }"
				data-sentiment="${row.censorNeed.publicSentimentSent }"
				data-nickname="${row.nickName}" data-type="0" data-authorId="${row.censorNeed.authorId}" data-authorIp="${row.censorNeed.authorIp }">
				<td>
					<div class="appid-name center align-middle"></div>
					<div>
						<ul class="nav ace-nav center align-middle">
							<a href="http://${row.userName }${url_image_link_to }"
								target="blank"><img class="nav-user-photo"
								src="<c:out value="${head_prefix}"/><c:out value="${row.userName }"/>"
								title="作者头像"></a>
							<b><span class="align-bottom"> <c:if
										test="${row.whiteFlag}">
										<img src="./image/W.gif" title="白名单用户" width="10px" />
									</c:if> <c:if test="${row.blackFlag}">
										<img src="./image/B.gif" title="黑名单用户" width="10px" />
									</c:if> <c:if test="${row.authFlag}">
										<img src="./image/V.gif" title="大V用户" width="10px" />
									</c:if></span></b>
						</ul>
					</div>
					<div>
						<b><c:out value="${row.nickName}" /></b> <span
							style="float: right; font-size: 16px"><a
							href="javascript:ajaxSubmit('${row.censorNeed.id }','999',null,null,'${row.censorNeed.authorId }')"
							title="封作者">封</a></span>
					</div> <br /><c:if test="${row.censorNeed.authorIp!=null && row.censorNeed.authorIp!=''}">
						<div>
							<b><c:out value="${row.censorNeed.authorIp }" /></b> <span
								style="float: right; font-size: 16px"><a
								href="javascript:ajaxSubmit('${row.censorNeed.id }','998',null,null,'${row.censorNeed.authorIp }')"
								title="封IP">封</a></span>
						</div>
					</c:if>
				</td>
				<td>
					<div class="widget-header">
						<!-- 标题是否可编辑 -->
						<h4 class="widget-title smaller">
							<input style="padding-top: 0px; padding-bottom: 0px;"
								onblur="hideOriginalTitle('${row.censorNeed.id}','301','${row.censorNeed.title }')"
								type="hidden" id="hide-otitle-${row.censorNeed.id }" size="50"
								value="${row.censorNeed.title }"></input> &nbsp;&nbsp;
							<c:choose>
								<c:when
									test="${row.censorNeed.parentUrl!=null && row.censorNeed.parentUrl!='' }">
									<a href="<c:out value="${row.censorNeed.parentUrl }"/>"
										target="blank"><span id="title-${row.censorNeed.id }">
											<c:out value="${row.censorNeed.highlightTitle }"
												escapeXml="false" />
									</span></a>
								</c:when>
								<c:otherwise>


									<c:choose>
										<c:when
											test="${row.censorNeed.url!=null && row.censorNeed.url!='' }">
											<a href="<c:out value="${row.censorNeed.url }"/>"
												target="blank"><span id="title-${row.censorNeed.id }">
													<c:out value="${row.censorNeed.highlightTitle }"
														escapeXml="false" />
											</span></a>
										</c:when>
										<c:otherwise>
											<span id="title-${row.censorNeed.id }"> <c:out
													value="${row.censorNeed.highlightTitle }" escapeXml="false" /></span>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<span class="action-buttons"
								id="span_edit_title_${row.censorNeed.id }"
								style="margin-left: 10px; display: none;"><a class="blue"
								href="javascript:showOriginalTitle('${row.censorNeed.id }')"
								title="修改标题"> <i class="ace-icon fa fa-pencil bigger-100"></i>
							</a> </span>
						</h4>
						<div style="display: none;" id="hide-title-${row.censorNeed.id }">${row.censorNeed.title }</div>
						<c:if test="${row.censorNeed.locked==true }">
							<div class="widget-toolbar">
								<i title="被${row.editorNickName } (${row.censorNeed.editorIp})"
									name="dateForm" data-date="${row.censorNeed.lockedAt}"
									class="ace-icon fa fa-lock bigger-200"></i>
							</div>
						</c:if>
						<div class="widget-toolbar">
							<span name="dateForm" data-date="${row.censorNeed.publishedAt }"
								class="label "></span>
						</div>
						<div class="widget-toolbar">
							敏感度:
							<c:if test="${row.censorNeed.rating!=null}">
								<span class="badge " id="rating-${row.censorNeed.id}">${row.censorNeed.rating }</span>
							</c:if>
						</div>


						<div class="widget-toolbar">
							预判:
							<c:if
								test="${row.censorNeed.purifyRemark!=null && row.censorNeed.purifyRemark!=''}">
								<span class="label ">${row.censorNeed.purifyRemark }</span>
							</c:if>
						</div>
						<div class="widget-toolbar">
							可见状态:
							<c:if
								test="${row.censorNeed.visualRange!=null && row.censorNeed.visualRange!=''}">
								<span class="label "><c:if
										test="${row.censorNeed.visualRange=='1'}">公开</c:if> <c:if
										test="${row.censorNeed.visualRange=='2'}">私密</c:if> <c:if
										test="${row.censorNeed.visualRange=='3'}">部分可见</c:if></span>
							</c:if>
						</div>
						<div class="widget-toolbar">
							分类:
							<c:if
								test="${row.censorNeed.column!=null && row.censorNeed.column!=''}">
								<span class="label  column-name">${row.censorNeed.column }</span>
							</c:if>
						</div>
					</div>
					<div rel="summary" id="summary-${row.censorNeed.id }"
						rel_url="${row.censorNeed.url }" class="content_font">

						<c:out
							value="${fn:substring(row.censorNeed.textContent, 0, length_summary)}" />
						<c:if
							test="${fn:length(row.censorNeed.textContent)>length_summary }">... </c:if>
					</div>
					<div class="content">
						<div rel="content" id="content-${row.censorNeed.id }"
							style="display: none; word-break: break-all;"
							ondblclick="showOriginalContent('${row.censorNeed.id}')"
							class="content_font">
							<c:out value="${row.censorNeed.highlightContent }"
								escapeXml="false" />
						</div>
						<div style="display: none;"
							id="hide-content-${row.censorNeed.id }" class="content_font">${row.censorNeed.originalContent }</div>
						<div rel="orginal" id="originalContent-${row.censorNeed.id }"
							style="display: none; text-align: center;" class="content_font">
							<!-- 内容是否为富文本 -->
							<textarea rows="8" cols="120" class="content_font"
								onblur="hideOriginalContent('${row.censorNeed.id}','300')"
								id="textarea-${row.censorNeed.id }"><c:out
									value="${row.censorNeed.originalContent }" /></textarea>
						</div>
						<div style="display: none;" id="rich-div-${row.censorNeed.id }"
							class="content_font">
							<div id="editor-${row.censorNeed.id }" onblur="">${row.censorNeed.originalContent }</div>
							<div class="widget-toolbox padding-4 clearfix"
								id="rich-button-${row.censorNeed.id }">
								<div class="btn-group pull-right">
									<button class="btn btn-sm btn-danger btn-white btn-round"
										onclick="hideOriginalRichContent('${row.censorNeed.id}','300')">
										<i class="ace-icon fa fa-floppy-o bigger-125"></i> 保存
									</button>
									<button class="btn btn-sm btn-default btn-white btn-round"
										onclick="cancelOriginalRichContent('${row.censorNeed.id}','300')">
										<i class="ace-icon fa fa-times bigger-125"></i> 取消
									</button>
								</div>
							</div>
						</div>
					</div> <!-- 图片--> <c:if
						test="${row.censorNeed.imageUrls!=null && row.censorNeed.imageUrls.size()>0 }">
						<div class="row" rel="attach-${row.censorNeed.id }"
							style="display: none;">
							<c:forEach items="${row.censorNeed.imageUrls}" var="image"
								varStatus="i">
								<div>
									<span style="float: left; padding-bottom: 10px;"> <img
										src="${image}" width="300px" title="图片" />
									</span> <span style="float: left;"> <a class="red"
										href="javascript:delProperty('302','${row.censorNeed.id }','${i.index }')"
										title="删除图片"> <i class="ace-icon fa fa-trash-o bigger-150"></i>
									</a>
									</span>
								</div>
							</c:forEach>
						</div>
					</c:if> <!-- 视频 --> <c:if
						test="${row.censorNeed.videoUrls!=null && row.censorNeed.videoUrls.size()>0}">
						<div class="row" rel="attach-${row.censorNeed.id }"
							style="display: none;">
							<c:forEach items="${row.censorNeed.videoUrls}" var="video"
								varStatus="v">
								<img src="${video}" title="音频" />
								<a class="red"
									href="javascript:delProperty('302','${row.censorNeed.id }','${v.index }')"
									title="删除图片"> <i
									class="ace-icon fa glyphicon-remove bigger-150"></i>
								</a>
							</c:forEach>
						</div>
					</c:if> <!-- 音频 --> <c:if
						test="${row.censorNeed.audioUrls!=null && row.censorNeed.audioUrls.size()>0}">
						<div class="row" rel="attach-${row.censorNeed.id }"
							style="display: none;">
							<c:forEach items="${row.censorNeed.audioUrls}" var="audio"
								varStatus="a">
								<img src="${audio}" title="音频" />
								<a class="red"
									href="javascript:delProperty('304','${row.censorNeed.id }','${a.index }')"
									title="删除图片"> <i
									class="ace-icon fa glyphicon-remove bigger-150"></i>
								</a>
							</c:forEach>
						</div>
					</c:if>
					<div class="center" style="padding-top: 15px;">
						<a class="green"
							href="javascript:openContent('${row.censorNeed.id }');"
							title="展开"> <i rel="open" id="open-${row.censorNeed.id }"
							class="ace-icon fa fa-folder-o bigger-200"></i>
						</a>
					</div>
				</td>
				<td class="center align-middle"><label class="pos-rel">
						<input type="checkbox" id="<c:out value="${row.censorNeed.id }"/>"
						class="ace" rel="check" /> <span class="lbl"></span>
				</label></td>
				<td>
					<p class="action-buttons-bar"></p>
				</td>
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