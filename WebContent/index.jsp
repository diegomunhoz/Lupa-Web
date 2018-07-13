<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exemplo Lupas/Imagens</title>
</head>
<body>
	<div>
		<f:subview id="view">
			<h:form id="tbPrincipal">
				<rich:toolBar>
					<rich:dropDownMenu value="Exemplos">
						<rich:menuItem id="menu1" value="Exemplo 1"
							action="#{menuBacking.primeiroExemplo}">
						</rich:menuItem>
						<rich:menuItem id="menu2" value="Exemplo 2"
							action="#{menuBacking.segundoExemplo}">
						</rich:menuItem>
						<rich:menuItem id="menu3" value="Exemplo 3"
							action="#{menuBacking.terceiroExemplo}">
						</rich:menuItem>
						<rich:menuItem id="menu4" value="Exemplo 4"
							action="#{menuBacking.quartoExemplo}">
						</rich:menuItem>
						<rich:menuItem id="menu5" value="Exemplo 5"
							action="#{menuBacking.quintoExemplo}">
						</rich:menuItem>
						<rich:menuItem id="menu6" value="Exemplo 6"
							action="#{menuBacking.sextoExemplo}">
						</rich:menuItem>						
					</rich:dropDownMenu>
				</rich:toolBar>
			</h:form>
		</f:subview>
	</div>
</body>
</html>