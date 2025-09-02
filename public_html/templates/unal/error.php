<?php
defined ( '_JEXEC' ) or die ();

// variables
$app = JFactory::getApplication ();
$doc = JFactory::getDocument ();
$menu = $app->getMenu ();
$active = $app->getMenu ()->getActive ();
$params = $app->getParams ();
$pageclass = $params->get ( 'pageclass_sfx' );
$tpath = JURI::base (). 'templates/' . $this->template;
// generator tag
$this->setGenerator ( null );

// force latest IE & chrome frame
$doc->setMetadata ( 'x-ua-compatible', 'IE=edge,chrome=1' );

// jquery


$doc->addScript ( $tpath . '/js/jquery.js' );
$doc->addScript ( $tpath . '/js/html5shiv.js' );
$doc->addScript ( $tpath . '/js/respond.js' );


// bootstrap
$doc->addScript ( $tpath . '/js/bootstrap-select.min.js' );
//$doc->addScript ( $tpath . '/js/bootstrap.min.js' );

// css
//$doc->addStyleSheet ( $tpath . '/css/template.css.php' );

// Current Url
$input = JURI::base ();

// clear in case scheme relative URI is passed, e.g., //www.google.com/
$input = trim ( $input, '/' );
$input = str_replace ( "http://", "", $input );
$input = str_replace ( "https://", "", $input );

//change Title
$app = JFactory::getApplication();
$this->setTitle( "Universidad Nacional de Colombia". ' : ' .$this->getTitle()  );
$url = $input;

?>
<!DOCTYPE html>


<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"  lang="<?php echo $this->language; ?>"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"  lang="<?php echo $this->language; ?>"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"  lang="<?php echo $this->language; ?>"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="<?php echo $this->language; ?>">
<!--<![endif]-->

<head>
<jdoc:include type="head" />

<meta charset="utf-8">
<link rel="shortcut icon"
	href="<?php echo $tpath; ?>/images/favicon.ico"
	type="image/x-icon; charset=binary">
<link rel="icon" href="<?php echo $tpath; ?>/images/favicon.ico"
	type="image/x-icon; charset=binary">
<meta name="revisit-after" content="1 hour">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=2.5, user-scalable=yes">


<base href="">

<link rel="stylesheet" type="text/css" 	href="<?php echo $tpath; ?>/css/bootstrap.min.css" media="all">
<link rel="stylesheet" type="text/css"	href="<?php echo $tpath; ?>/css/bootstrap-select.min.css" media="all">
<link rel="stylesheet" type="text/css" 	href="<?php echo $tpath; ?>/css/reset.css" media="all">
<link rel="stylesheet" type="text/css" 	href="<?php echo $tpath; ?>/css/unal.css" media="all">
<link rel="stylesheet" type="text/css" 	href="<?php echo $tpath; ?>/css/base.css" media="all">
<link rel="stylesheet" type="text/css" 	href="<?php echo $tpath; ?>/css/tablet.css" media="only screen and (min-width: 992px) and (max-width: 1199px)">
<link rel="stylesheet" type="text/css" 	href="<?php echo $tpath; ?>/css/phone.css" 	media="only screen and (min-width: 768px) and (max-width: 991px)">
<link rel="stylesheet" type="text/css" 	href="<?php echo $tpath; ?>/css/small.css" 	media="only screen and (max-width: 767px)">
<link rel="stylesheet" type="text/css" 	href="<?php echo $tpath; ?>/css/sede.css" media="all">

<!-- acciones para formularios con la clase ".unal-form" -->
<link rel="stylesheet" type="text/css"
	href="<?php echo $tpath; ?>/css/form.css" media="all">
<script>jQuery(document).ready(function($){$('select','form').selectpicker();})</script>
<!-- fin acciones para formulario -->

</head>

	<body class="row-offcanvas row-offcanvas-right <?php echo ($is_home_page? ('front') : ('site')).' '.$active->alias.' '.$pageclass; ?>" role="document">

	<div class="wrapper">
     <!-- principio plantilla unal-->

	<header id="unalTop">
		<div class="logo">
			<a href="http://unal.edu.co"> <img
				alt="Escudo de la Universidad Nacional de Colombia"
				src="<?php echo JURI::base (); ?>templates/unal/images/escudoUnal.png" width="189" height="70"
				title="Escudo de la Universidad Nacional de Colombia" />
			</a>
			<div class="diag"></div>
		</div>
		<div class="seal">
			<img alt="Escudo de la Rep&uacute;blica de Colombia"
				src="<?php echo JURI::base (); ?>templates/unal/images/sealColombia.png" width="66" height="66"
				title="Escudo de la Rep&uacute;blica de Colombia" />
		</div>
		<div class="firstMenu">
			<div class="btn-group tx-srlanguagemenu">
				<div class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					ES <span class="caret"></span>
				</div>
				<ul class="dropdown-menu" role="menu">
				</ul>
			</div>
			<ul class="socialLinks" style="list-style-type: none">
				<li><a href="https://twitter.com/unimedios" target="_blank"
					class="twitter" title="Cuenta oficial en Twitter"></a></li>
				<li><a
					href="https://www.facebook.com/pages/Agencia-de-Noticias-UN/193658967327822"
					target="_blank" class="facebook" title="Página oficial en Facebook"></a></li>
				<li><a
					href="http://www.agenciadenoticias.unal.edu.co/nc/sus/type/rss2.html"
					target="_blank" class="rss"
					title="Suscripción a canales de información RSS"></a></li>
			</ul>

			<div class="navbar-default">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<nav class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li class="item_Aspirantes"><a
							href="http://aspirantes.unal.edu.co" target="_top">Aspirantes</a></li>
						<li class="item_Estudiantes"><a
							href="http://estudiantes.unal.edu.co" target="_top">Estudiantes</a></li>
						<li class="item_Egresados"><a href="http://egresados.unal.edu.co"
							target="_top">Egresados</a></li>
						<li class="item_Docentes"><a href="http://docentes.unal.edu.co"
							target="_top">Docentes</a></li>
						<li class="item_Administrativos"><a
							href="http://administrativos.unal.edu.co" target="_top">Administrativos</a></li>
					</ul>
				</nav>
			</div>
			<!-- End navbar-default -->
		</div>
		<!-- End Fist Menu -->
		<div class="navigation">
			<div class="site-url">
				<div class="icon"></div>
				<a href='<?php echo JURI::base (); ?>'><?php echo $url; ?></a>
			</div>
			<!-- site url -->
			<div class="navbar-"> 
			</div>
		</div>
		<div class="buscador">
			<gcse:searchbox-only
				resultsurl="http://unal.edu.co/resultados-de-la-busqueda/"></gcse:searchbox-only>
		</div>
	</header>
	<div id="services">
		<div class="indicator"></div>
		<ul>
			<li><img src="<?php echo JURI::base (); ?>templates/unal/images/icnServEmail.png" width="32"
				height="32" border="0" alt=""><a href="http://correo.unal.edu.co"
				target="_top">Correo institucional</a></li>
			<li><img src="<?php echo JURI::base (); ?>templates/unal/images/icnServSia.png" width="32"
				height="32" border="0" alt=""><a href="http://www.sia.unal.edu.co"
				target="_top">Sistema de Información Académica</a></li>
			<li><img src="<?php echo JURI::base (); ?>templates/unal/images/icnServLibrary.png" width="32"
				height="32" border="0" alt=""><a href="http://www.sinab.unal.edu.co"
				target="_top">Bibliotecas</a></li>
			<li><img src="<?php echo JURI::base (); ?>templates/unal/images/icnServCall.png" width="32"
				height="32" border="0" alt=""><a
				href="http://168.176.5.43:8082/Convocatorias/indice.iface"
				target="_blank">Convocatorias</a></li>
				
			
		</ul>
	</div>
		<!-- Fin Plantilla unal-->
		<div class='clear'></div>
		<!-- Comienzo Plantilla de sede -->
		
		
		<div id='component' class="component col-md-12">
			<div class="transbox1">
				  <div align="center">
    <div id="error">
      <h1>
        <?php echo htmlspecialchars($app->getCfg('sitename')); ?>
      </h1>
      <p>
        <?php 
          echo $this->error->getCode().' - '.$this->error->getMessage(); 
          if (($this->error->getCode()) == '404') {
            echo '<br />';
            echo JText::_('JERROR_LAYOUT_REQUESTED_RESOURCE_WAS_NOT_FOUND');
          }
        ?>
      </p>
      <p>
        <?php echo JText::_('JERROR_LAYOUT_GO_TO_THE_HOME_PAGE'); ?>: 
        <a href="<?php echo $this->baseurl; ?>/"><?php echo JText::_('JERROR_LAYOUT_HOME_PAGE'); ?></a>.
      </p>
      <?php // render module mod_search
        $module = new stdClass();
        $module->module = 'mod_search';
        echo JModuleHelper::renderModule($module);
      ?>
    </div>
  </div>
				
			</div>
		</div>
		
		
	            <div class="push"></div>
	
	</div><!-- End Wrapper -->
	<!-- Fin de definición de la plantilla de sede-->
		
	
 <!-- Inicia Pie de Página Unal -->
	<footer class='footer'>
		<div class="row">
			<div class="col-md-3 col-lg-3 col-sm-3 col-xs-6 gobiernoLinea">
				<div class="navbar-">
					<div class="btn-group">
						<a href="http://www.legal.unal.edu.co" target="_top">Régimen Legal</a>
					</div>
					<div class="btn-group">
						<a href="http://www.unal.edu.co/dnp" target="_top">Talento humano</a>
					</div>
					<div class="btn-group">
						<a href="http://www.unal.edu.co/contratacion/" target="_top">Contratación</a>
					</div>
					<div class="btn-group">
						<a href="http://www.unal.edu.co/dnp/" target="_top">Ofertas de
							empleo</a>
					</div>
					<div class="btn-group">
						<a href="http://www.unal.edu.co/rendicion_de_cuentas/2012/"
							target="_top">Rendición de cuentas</a>
					</div>
					<div class="btn-group">
						<a
							href="http://www.concursoprofesoralun.unal.edu.co/ConcursoDocente/news.php"
							target="_top">Concurso docente</a>
					</div>
					<div class="btn-group">
						<a href="http://www.pagovirtual.unal.edu.co/" target="_top">Pago
							Virtual</a>
					</div>
					<div class="btn-group">
						<a href="http://www.unal.edu.co/control_interno/index.html"
							target="_top">Control interno</a>
					</div>
					<div class="btn-group">
						<a href="http://www.simege.unal.edu.co" target="_top">Calidad</a>
					</div>
					<div class="btn-group">
						<a href="http://unal.edu.co/buzon-de-notificaciones/"
							target="_self">Buzón de notificaciones</a>
					</div>
				</div>
			</div>
			<div
				class="col-md-3 col-lg-3 col-sm-3 col-xs-6 gobiernoLinea gobiernoLinea2">
				<div class="navbar-">
					<div class="btn-group">
						<a href="http://correo.unal.edu.co" target="_top">Correo
							institucional</a>
					</div>
					<div class="btn-group">
						<a href="http://unal.edu.co/mapa-del-sitio/" target="_self">Mapa
							del sitio</a>
					</div>
					<div class="btn-group">
						<a href="http://redessociales.unal.edu.co" target="_top">Redes
							Sociales</a>
					</div>
					<div class="btn-group">
						<a href="http://unal.edu.co/faq/" target="_self">FAQ</a>
					</div>
					<div class="btn-group">
						<a href="http://unal.edu.co/quejas-y-reclamos/" target="_self">Quejas
							y reclamos</a>
					</div>
					<div class="btn-group">
						<a href="http://unal.edu.co/atencion-en-linea/" target="_self">Atención
							en línea</a>
					</div>
					<div class="btn-group">
						<a href="http://unal.edu.co/encuesta/" target="_self">Encuesta</a>
					</div>
					<div class="btn-group">
						<a href="http://unal.edu.co/contactenos/" target="_self">Contáctenos</a>
					</div>
					<div class="btn-group">
						<a href="http://www.onp.unal.edu.co" target="_top">Estadísticas</a>
					</div>
					<div class="btn-group">
						<a href="http://unal.edu.co/glosario/" target="_self">Glosario</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 footer-info col-lg-4 col-sm-4 col-xs-12">
				<div class="csc-frame csc-frame-indent">
					<p class="bodytext">
						<b>Contacto p&aacute;gina web:<br /></b>Direcci&oacute;n<br />
						Calle 59 A N 63-20 Edif. 21 -&nbsp;Of. 111<br />Medell&iacute;n,&nbsp;
						Colombia<br />(+57 4) &nbsp;4309620
					</p>
				</div>
				<div class="csc-frame csc-frame-indent">
					<p class="bodytext">
						© Copyright 2014<br />Algunos derechos reservados.<br /> <a
							href="mailto:webmaster@unal.edu.co"
							title="Comuníquese con el webmaster de la Universidad Nacional de Colombia"
							class="mail">webmaster@unal.edu.co</a><br /> <a
							href="http://unal.edu.co/acerca-de-este-sitio-web/"
							title="Acerca de la web de la Universidad Nacional de Colombia"
							target="_blank" class="internal-link">Acerca de este sitio web<br /></a>
					</p>
					<div class="csc-default">
						<p>Actualizaci&oacute;n: 29/09/2014</p>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-lg-2 col-sm-2 col-xs-12 logos">
				<a href="http://www.orgulloun.unal.edu.co"><img alt="Orgullo UN"
					src="<?php echo JURI::base (); ?>templates/unal/images/log_orgullo.png" width="78" height="21"
					title="Orgullo UN" /></a> <a
					href="http://www.agenciadenoticias.unal.edu.co/inicio.html"
					class="imgAgencia"><img alt="Agencia de Noticias"
					src="<?php echo JURI::base (); ?>templates/unal/images/log_agenc.png" width="78" height="21"
					title="Agencia de Noticias" /></a>
				<div class="clear"></div>
				<a href="http://www.gobiernoenlinea.gov.co/web/guest"><img
					alt="Programa gobierno en línea"
					src="<?php echo JURI::base (); ?>templates/unal/images/log_gobiern.png" width="67" height="51"
					title="Programa gobierno en línea" /></a> <a
					href="http://www.contaduria.gov.co/"><img
					alt="Contaduría general de la republica"
					src="<?php echo JURI::base (); ?>templates/unal/images/log_contra.png" width="67" height="51"
					title="Contaduría general de la republica" /></a>
			</div>
		</div>
	</footer>


	<script src="<?php echo $tpath; ?>/js/unal.js" type="text/javascript"></script>
	<jdoc:include type="modules" name="debug" />
</body>

</html>
