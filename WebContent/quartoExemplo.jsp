<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="rich" uri="http://richfaces.org/rich"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quarto Exemplo</title>
<meta name="description" content="jquery" />
<meta name="keywords" content="jquery" />
<meta name="robots" content="all, index, follow" />
<link href="_style/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="_scripts/jquery-1.2.6.pack.js"></script>
<script language="javascript">
	//DEFININDO GLOBAIS; 
	var light_width, light_height, thumb_x, thumb_y, pos_thumb_x, pos_thumb_y;
	var altura, largura, diferenca_shadow, shadow_100_porcento_x, shadow_100_porcento_y;

	// POSICIONANDO SHADOWS
	function shadows(leftShadow, topShadow) {
		topShadow = (topShadow / 100 * shadow_100_porcento_y);
		leftShadow = (leftShadow / 100 * shadow_100_porcento_x);
		$('#shadow_1').css('height', topShadow + 'px');
		$('#shadow_2').css({
			'width' : leftShadow + 'px',
			'top' : topShadow + 'px'
		});
		$('#shadow_3').css({
			'left' : leftShadow + 'px',
			'top' : topShadow + 'px'
		});
		$('#shadow_4').css('top', topShadow + 'px');
	}

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
							thumb_x = $('#thumb').width();
							thumb_y = $('#thumb').height();

							// QUANTOS PX DO CONTEÚDO FICAM PRA FORA DO CONTAINER
							var diferenca_x = conteudo_x - container_x;
							var diferenca_y = conteudo_y - container_y;

							// POSICAO INICIAL ( na metade da tela)
							var metade_x = -parseInt(diferenca_x / 2);
							var metade_y = -parseInt(diferenca_y / 2);

							// ADICIONANDO SHADOWS
							for (i = 1; i < 5; i++) {
								$('#container_thumb')
										.append(
												'<div class="shadow" id="shadow_'+i+'"><\/div>');
							}

							// VENDO QNTAS VEZES O THUMB É MENOR DO QUE A IMAGEM ORIGINAL
							var porcentagem_tamanho_x = $('#container_image')
									.width()
									/ $('#image').width() * 100;
							var porcentagem_tamanho_y = $('#container_image')
									.height()
									/ $('#image').height() * 100;
							light_width = parseInt(thumb_x / 100
									* porcentagem_tamanho_x);
							light_height = parseInt(thumb_y / 100
									* porcentagem_tamanho_y);

							// PREPARANDO VARIÁVEIS  DO SHADOW
							$('#shadow_2, #shadow_3').css('height',
									light_height);
							$('#shadow_3').css('margin-left',
									light_width + 'px');
							$('#shadow_4').css('margin-top',
									light_height + 'px');

							altura = $('#container_thumb').height();
							largura = $('#container_thumb').width();
							$('#thumb, #shadow_4').height(altura);

							shadow_100_porcento_y = thumb_y - light_height;
							shadow_100_porcento_x = thumb_x - light_width;

							shadows(0, 0);

							// POSICIONANDO CONTEUDO
							$('#container_thumb')
									.mousemove(
											function(e) {

												pos_thumb_x = e.pageX - pos_x;
												pos_thumb_y = e.pageY - pos_y;

												porcentagem_x = parseInt(pos_thumb_x
														/ thumb_x * 100);
												porcentagem_y = parseInt(pos_thumb_y
														/ thumb_y * 100);
												leftPosition = parseInt(0 - (diferenca_x / 100 * porcentagem_x));
												topPosition = parseInt(0 - (diferenca_y / 100 * porcentagem_y));

												shadows(porcentagem_x,
														porcentagem_y);

												$('#image').css({
													'left' : leftPosition,
													'top' : topPosition
												});
											});

							// MOSTRANDO IMAGENS
							$('img').css('visibility', 'visible');
							$('.shadow').css('opacity', '0.7');

						}
					});
</script>
<style type="text/css">
body {
	padding-top: 5px;
}

img {
	visibility: hidden;
}

div#container_image {
	float: left;
	margin-right: 5px;
	width: 351px;
	height: 233px;
	position: relative;
	overflow: hidden;
}

div#container_image img#image {
	position: absolute;
	left: 0;
	top: 0;
}

div#container_thumb {
	width: 110px;
	height: 73px;
	float: left;
	position: relative;
	overflow: hidden;
	cursor: none;
}

div#container_thumb img#thumb {
	width: 100%;
}

div.shadow {
	position: absolute;
	top: 0;
	left: 0;
	width: 0;
	height: 0;
	background: #000;
	overflow: hidden;
}

#shadow_1,#shadow_3,#shadow_4 {
	width: 100%;
}
</style>
</head>

<body>
	<div align="center">
		<f:view>
			<jsp:include page="/index.jsp"></jsp:include>
			<h:form>
				<div id="container_image">
					<img src="_images/02.jpg" alt="tubarão" id="image" />
				</div>
				<div id="container_thumb">
					<img src="_images/02_thumb.jpg" id="thumb" />
					<div id="container_thumb"></div>
				</div>
			</h:form>
		</f:view>
	</div>
</body>
</html>