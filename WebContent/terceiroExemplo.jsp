<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Terceiro Exemplo</title>
<meta name="description" content="jquery" />
<meta name="keywords" content="jquery" />
<meta name="robots" content="all, index, follow" />
<link href="_style/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="_scripts/jquery-1.2.6.pack.js"></script>
<script language="javascript">
	$(window)
			.load(
					function() {
						if ($('#image').width() > $('#container_image').width()
								|| $('#image').height() > $('#container_image')
										.height()) {

							// POSIÇÃO ABSOLUTA DO CONTEUDO NA TELA
							var pos_x = $('#thumb').offset().left;
							var pos_y = $('#thumb').offset().top;

							// LARGURA E ALTURA DO CONTAINER
							var container_x = $('#container_image').width();
							var container_y = $('#container_image').height();

							// LARGURA E ALTURA DO CONTEUDO
							var conteudo_x = $('#image').width();
							var conteudo_y = $('#image').height();

							// LARGURA E ALTURA DO#thumb
							var thumb_x = $('#thumb').width();
							var thumb_y = $('#thumb').height();

							// QUANTOS PX DO CONTEÚDO FICAM PRA FORA DO CONTAINER
							var diferenca_x = conteudo_x - container_x;
							var diferenca_y = conteudo_y - container_y;

							// POSICAO INICIAL ( na metade da tela)
							var metade_x = -parseInt(diferenca_x / 2);
							var metade_y = -parseInt(diferenca_y / 2);

							// POSICIONANDO CONTEUDO
							$('#thumb')
									.mousemove(
											function(e) {
												porcentagem_x = parseInt((e.pageX - pos_x)
														/ thumb_x * 100);
												porcentagem_y = parseInt((e.pageY - pos_y)
														/ thumb_y * 100);
												leftPosition = parseInt(0 - (diferenca_x / 100 * porcentagem_x));
												topPosition = parseInt(0 - (diferenca_y / 100 * porcentagem_y));
												$('#image').css({
													'left' : leftPosition,
													'top' : topPosition
												});
											});

							// MOSTRANDO IMAGENS
							$('img').css('visibility', 'visible');
						}
					});
</script>
<style type="text/css">
img {
	visibility: hidden;
}

div#container_image {
	float: left;
	margin-right: 5px;
	width: 345px;
	height: 228px;
	position: relative;
	overflow: hidden;
}

img#image {
	position: absolute;
	left: 0;
	top: 0;
}

img#thumb {
	width: 110px;
	height: 73px;
	cursor: url(_images/lupa.gif), default;
	float: left;
}
</style>
</head>
<body>
	<f:view>
		<jsp:include page="/index.jsp"></jsp:include>
		<h:form>
			<div id="container_image">
				<img src="_images/01.jpg" id="image" />
			</div>
			<img src="_images/01_thumb.jpg" id="thumb" />
		</h:form>
	</f:view>
</body>
</html>