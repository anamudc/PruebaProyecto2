
<%@ page import="tpicardio.Tip" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'tip.label', default: 'Tip')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>

			<div class="span9">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="descripcion" title="${message(code: 'tip.descripcion.label', default: 'Descripcion')}" />
						
							<th class="header"><g:message code="tip.entrenador.label" default="Entrenador" /></th>
						
							<g:sortableColumn property="nombre" title="${message(code: 'tip.nombre.label', default: 'Nombre')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${tipInstanceList}" var="tipInstance">
						<tr>
						
							<td>${fieldValue(bean: tipInstance, field: "descripcion")}</td>
						
							<td>${fieldValue(bean: tipInstance, field: "entrenador")}</td>
						
							<td>${fieldValue(bean: tipInstance, field: "nombre")}</td>
						
							<td class="link">
								<g:link action="show" id="${tipInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${tipInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
