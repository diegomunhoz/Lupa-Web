<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Primeiro Exemplo</title>
<meta name="description" content="jquery" />
<meta name="keywords" content="jquery" />
<meta name="robots" content="all, index, follow" />
<link href="_style/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="_scripts/jquery-1.2.6.pack.js"></script>
<script language="javascript">
$(document).ready(function(){
	
	if($('#conteudo').width()>$('#container').width()){

		var pos_linha_tempo = $('#conteudo').offset();
		var pos_x = pos_linha_tempo.left;
		var container = $('#container').width();
		var conteudo = $('#conteudo').width();
		var diferenca = conteudo - container;
		var metade = - parseInt(diferenca / 2);
		
		$('#conteudo').mousemove(function(e){
			x = e.pageX - pos_x;
			porcentagemX = parseInt(x / container * 100);
			left = parseInt(0 - (diferenca  / 100 * porcentagemX ));
			$('#conteudo').css('left',left);
		});		
		
		$('#conteudo').animate({
			'left':metade
		},200);
	}
});
</script>
<style type="text/css">
#container {
	width: 460px;
	height: 304px;
	position: relative;
	overflow: hidden;
}

#conteudo {
	position: absolute;
	left: 0;
	top: 0;
}
</style>

</head>
<body>
	<f:view>
		<jsp:include page="/index.jsp"></jsp:include>
		<h:form>
			<div align="center">
				<br> <br>
				<div id="container">
					<div id="conteudo">
						<img src="_images/parallax.jpg" alt="Parallax" />
					</div>
				</div>
			</div>
		</h:form>
	</f:view>
</body>
</html>