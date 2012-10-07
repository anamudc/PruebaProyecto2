
<%@ page import="tpicardio.Maquina" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'maquina.label', default: 'Maquina')}" />
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
						
							<g:sortableColumn property="imagen" title="${message(code: 'maquina.imagen.label', default: 'Imagen')}" />
						
							<th class="header"><g:message code="maquina.entrenador.label" default="Entrenador" /></th>
						
							<g:sortableColumn property="marca" title="${message(code: 'maquina.marca.label', default: 'Marca')}" />
						
							<g:sortableColumn property="modelo" title="${message(code: 'maquina.modelo.label', default: 'Modelo')}" />
						
							<g:sortableColumn property="numero" title="${message(code: 'maquina.numero.label', default: 'Numero')}" />
						
							<g:sortableColumn property="observacion" title="${message(code: 'maquina.observacion.label', default: 'Observacion')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${maquinaInstanceList}" var="maquinaInstance">
						<tr>
						
							<td>${fieldValue(bean: maquinaInstance, field: "imagen")}</td>
						
							<td>${fieldValue(bean: maquinaInstance, field: "entrenador")}</td>
						
							<td>${fieldValue(bean: maquinaInstance, field: "marca")}</td>
						
							<td>${fieldValue(bean: maquinaInstance, field: "modelo")}</td>
						
							<td>${fieldValue(bean: maquinaInstance, field: "numero")}</td>
						
							<td>${fieldValue(bean: maquinaInstance, field: "observacion")}</td>
						
							<td class="link">
								<g:link action="show" id="${maquinaInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${maquinaInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
