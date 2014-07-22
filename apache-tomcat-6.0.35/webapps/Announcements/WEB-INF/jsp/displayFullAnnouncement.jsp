<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License. You may obtain a
    copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on
    an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied. See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

<jsp:directive.include file="/WEB-INF/jsp/include.jsp"/>

<c:set var="n"><portlet:namespace/></c:set>
<script src="<rs:resourceURL value="/rs/jquery/1.6.4/jquery-1.6.4.min.js"/>" type="text/javascript"></script>
<script src="<rs:resourceURL value="/rs/jqueryui/1.8.13/jquery-ui-1.8.13.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/underscore-min.js"/>" type="text/javascript"></script>

<script type="text/template" id="${n}template-attachment-display-item">
    <div id="${n}attachment_display_${"<%="} attachment.id ${"%>"}" class="attachment-item">
    <img src="<c:url value='/icons/download.png'/>" border="0" height="16" width="16" style="vertical-align: middle"/>
    <a href='${"<%="} attachment.path ${"%>"}' style="text-decoration: none; border:none;">
        <span>${"<%="} attachment.filename ${"%>"}</span>
    </a>
    </div>
</script>

<script type="text/javascript">
    var ${n} = ${n} || {}; //create a unique variable to assign our namespace too
    ${n}.jQuery = jQuery.noConflict(true); //assign jQuery to this namespace
    ${n}._ = _.noConflict();

    ${n}.jQuery(function () {
        var $ = ${n}.jQuery; //reassign $ for normal use of jQuery
        var _ = ${n}._;
        var template = $('#${n}template-attachment-display-item').html();
        _.templateSettings.variable = "attachment";

        <c:forEach items="${announcement.attachments}" var="attachment" varStatus="status">
            var ${n}attachment = ${attachment};
            var compiled = _.template(template, ${attachment});
            $("#${n}attachment-list").append(compiled);
        </c:forEach>
    });

</script>

<div class="portlet-section-header">
    <c:out value="${announcement.title}"/>
</div>
<p>
<span class="portlet-section-text" style="font-size:0.8em;">
    <c:if test="${displayPublishDate}"><spring:message code="displayFull.displayBegin"/> <fmt:formatDate value="${announcement.startDisplay}" dateStyle="long"/><br/></c:if>
    <spring:message code="displayFull.displayEnd"/>
    <c:choose>
        <c:when test="${announcement.endDisplay == null}">
            <spring:message code="displayFull.displayEnd.unspecified"/>
        </c:when>
        <c:otherwise>
            <fmt:formatDate value="${announcement.endDisplay}" dateStyle="long"/>
        </c:otherwise>
    </c:choose>
</span>
<c:if test="${not empty announcement.link}">
    <br/>
    <span class="portlet-section-text" style="font-size:0.8em;"><spring:message code="display.link.prefix"/> <a href="${announcement.link}"><c:out value="${announcement.link}"/></a></span>
</c:if>
</p>

<c:out value="${announcement.message}" escapeXml="false"/>

<c:if test="${not empty announcement.attachments}">
    <div class="portlet-section-header">
        <spring:message code="displayFull.attachments"/>
    </div>
    <div class="portlet-section-text" style="font-size:0.8em;" id="${n}attachment-list">
    </div>
</c:if>

<br/>
<a style="text-decoration:none;font-size:0.9em;" href="<portlet:renderURL portletMode="view" windowState="normal"/>"><img src="<c:url value="/icons/arrow_left.png"/>" border="0" height="16" width="16" style="vertical-align:middle"/> <spring:message code="displayFull.back"/></a>

