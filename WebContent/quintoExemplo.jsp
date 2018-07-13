<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quinto Exemplo</title>
</head>
<meta name="description" content="jquery" />
<meta name="keywords" content="jquery" />
<meta name="robots" content="all, index, follow" />
<link href="_style/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="_scripts/jquery-1.2.6.pack.js"></script>
<script language="javascript">
	var sizeImage = 1;
	var original_x, original_y;
	var pause = false;

	$(window)
			.load(
					function() {

						// POSIÇÃO ABSOLUTA DO CONTEUDO NA TELA
						var pos_x = $('#container_image').offset().left;
						var pos_y = $('#container_image').offset().top;

						// LARGURA E ALTURA DO CONTAINER
						var container_x = $('#container_image').width();
						var container_y = $('#container_image').height();

						original_x = $('#image').width();
						original_y = $('#image').height();

						function atualizaMove() {

							$('#container_image').unbind();

							if ($('#image').width() > $('#container_image')
									.width()
									|| $('#image').height() > $(
											'#container_image').height()) {

								// LARGURA E ALTURA DO CONTEUDO
								var conteudo_x = parseInt(original_x
										* sizeImage);
								var conteudo_y = parseInt(original_y
										* sizeImage);

								// QUANTOS PX DO CONTEÚDO FICAM PRA FORA DO CONTAINER
								var diferenca_x = conteudo_x - container_x;
								var diferenca_y = conteudo_y - container_y;

								// POSICAO INICIAL ( na metade da tela)
								var metade_x = -parseInt(diferenca_x / 2);
								var metade_y = -parseInt(diferenca_y / 2);

								// POSICIONANDO CONTEUDO
								$('#container_image')
										.mousemove(
												function(e) {
													porcentagem_x = parseInt((e.pageX - pos_x)
															/ container_x * 100);
													porcentagem_y = parseInt((e.pageY - pos_y)
															/ container_y * 100);
													leftPosition = parseInt(0 - (diferenca_x / 100 * porcentagem_x));
													topPosition = parseInt(0 - (diferenca_y / 100 * porcentagem_y));
													$('#image').css({
														'left' : leftPosition,
														'top' : topPosition
													});
												});

							}
						}

						atualizaMove();

						// MOSTRANDO A IMAGEM
						$('#image').css('visibility', 'visible');

						function wheel(event) {
							var delta = 0;
							if (!event)
								event = window.event;
							if (event.wheelDelta) {
								delta = event.wheelDelta / 120;
								if (window.opera)
									delta = -delta;
							} else if (event.detail) {
								delta = -event.detail / 3;
							}
							if (delta)
								handle(delta);
							if (event.preventDefault)
								event.preventDefault();
							event.returnValue = false;
						}
						if (window.addEventListener)
							window.addEventListener('DOMMouseScroll', wheel,
									false);
						window.onmousewheel = document.onmousewheel = wheel;
						function handle(delta) {
							if (pause == false) {

								pause = true;
								window.setTimeout(function() {
									pause = false;
								}, 100);

								if (delta < 0) {
									if ((original_x * (sizeImage - 0.02)) < container_x)
										return false;
									sizeImage = sizeImage - 0.03;
								} else {
									sizeImage = sizeImage + 0.03;
								}

								new_width = parseInt(original_x * sizeImage);
								new_height = parseInt(original_y * sizeImage);

								$('#image').width(new_width).height(new_height);

								atualizaMove();

							}

						}

					});
</script>
<style type="text/css">
div#container_image {
	width: 468px;
	height: 310px;
	position: relative;
	overflow: hidden;
	margin: 0 auto;
}

div#container_image img#image {
	position: absolute;
	left: 0;
	top: 0;
	visibility: hidden;
}

h1 {
	font: bold 16px Arial;
	margin: 20px auto;
	width: 468px;
}
</style>

<body>
	<div align="center">
		<f:view>
			<jsp:include page="/index.jsp"></jsp:include>
			<h:form>
				<br>
				<h1>Passe o mouse sobre a imagem para mover para os lados e
					utilize o mouse wheel para controlar o zoom</h1>
				<br>
				<br>
				<div id="container_image">
					<img src="_images/wall.jpg" id="image" />
				</div>
			</h:form>
		</f:view>
	</div>
</body>
</html>