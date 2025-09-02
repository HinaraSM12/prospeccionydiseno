<?php
defined ( '_JEXEC' ) or die ();

// variables
$app = JFactory::getApplication ();
$doc = JFactory::getDocument ();
$menu = $app->getMenu ();
$active = $app->getMenu ()->getActive ();
$params = $app->getParams ();
$pageclass = $params->get ( 'pageclass_sfx' );
$tpath = $this->baseurl . '/templates/' . $this->template;

// generator tag
$this->setGenerator ( null );


// jquery


$doc->addScript ( $tpath . '/js/jquery.js' );
$doc->addScript ($tpath .  "/js/jquery-migrate-1.2.1.min.js");
$doc->addScript ( $tpath . '/js/html5shiv.js' );
$doc->addScript ( $tpath . '/js/respond.js' );
$doc->addScript ( $tpath . '/js/bootstrap-tooltip.js' );
$doc->addScript ( $tpath . '/js/bootstrap-popover.js' );

JHtml::_('behavior.framework', true);


// bootstrap
$doc->addScript ( $tpath . '/js/bootstrap-select.min.js' );

// css
$doc->addStyleSheet ( $tpath . '/css/template.css.php' );

// Current Url
$input = $_SERVER['SERVER_NAME'];

//$input = JURI::base ();

// clear in case scheme relative URI is passed, e.g., //www.google.com/
//$input = trim ( $input, '/' );
//$input = str_replace ( "http://", "", $input );
//$input = str_replace ( "https://", "", $input );

//change Title
$app = JFactory::getApplication();
$this->setTitle( "Universidad Nacional de Colombia". ' : ' .$this->getTitle()  );
$url = $input;

//Check if is the homepage
$is_home_page = $menu->getActive() == $menu->getDefault();


//Check if there is content in the Component
$data  = $doc->getBuffer('component');
$sPattern = '/\s*/m';
$sReplace = '';
$ndata = preg_replace( $sPattern, $sReplace, $data );
$show_component = strlen($ndata)>75;
?>
<!DOCTYPE html>
<html class="no-js" lang="<?php echo $this->language; ?>">

<head>
<jdoc:include type="head" />
<style type="text/css">
<?php //Si existe imagen de fondo se carga en el wrapper
if ($this->params->get ('backgroundImage') && JRequest::getVar('view') == "featured"){ ?> 
.front .wrapper{
	background:url('<?php echo JURI::base().$this->params->get('backgroundImage'); ?>') no-repeat center center;;
	background-size: cover;
}
<?php } ?>

		#services .indicator,.btn,.chinche,.nspPagination li, .triangle-botom {
			background-color: <?php echo $this->params->get('templateColor'); ?>;
		}
		
		.btn-default .caret {
			border-top-color: <?php echo $this->params->get('templateColor'); ?> !important;
		}
		
		h1,h2,h3,h4,main.detalle a{
			color: <?php echo $this->params->get('templateColor'); ?> !important;
		}
body{
background-color: #fff;
}
.page-header{
border-bottom: 1px dotted <?php echo $this->params->get('templateColor'); ?> !important; 
}
.page-header > *{
margin-bottom: 0px;
}
	.cse input.gsc-search-button, input.gsc-search-button{
		 progid:DXImageTransform.Microsoft.gradient(startColorStr='<?php echo $this->params->get('templateColor'); ?>',EndColorStr='<?php echo $this->params->get('templateColor'); ?>')
	}


	.nspPagination li:hover, .nspPagination li.active {
background-color: #fff;
}


	<?php if ($this->countModules('prefooter')): ?>
	.wrapper {
		margin: 0 auto -200px;
	}

footer, .push {
	min-height:200px;
}
.prefooter{
width:100%;
margin: 0;
position:relative;
}

.prefooter > *{
margin:0;
padding:1px;
min-height:60px;
}
<?php endif; ?>
</style>


<link rel="shortcut icon"
	href="<?php echo $tpath; ?>/images/favicon.ico"
	type="image/x-icon; charset=binary">
<link rel="icon" href="<?php echo $tpath; ?>/images/favicon.ico"
	type="image/x-icon; charset=binary">
<meta name="revisit-after" content="1 hour">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=2.5, user-scalable=yes">
<!--[if lt IE 9]>
  <link rel="stylesheet" href="<?php echo $tpath; ?>/css/ie-fix.css" type="text/css" />
<![endif]-->
</head>




	<body class="row-offcanvas row-offcanvas-right <?php echo ($is_home_page? ('front') : ('site')).' '.$active->alias.' '.$pageclass; ?>" role="document">

	<div class="wrapper">
     <!-- principio plantilla unal-->

	<header id="unalTop">
		<div class="logo">
			<a href="http://unal.edu.co"> 
			<img alt="Escudo de la Universidad Nacional de Colombia"
				src="templates/unal/images/escudoUnal.png" style='width:165px;height:70px' 
				title="Escudo de la Universidad Nacional de Colombia" />
			</a>
			<div class="diag"></div>
		</div>
		<div class="seal">
			<img alt="Escudo de la Rep&uacute;blica de Colombia"
				src="templates/unal/images/sealColombia.png"
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
				<li><a href="https://twitter.com/unmedellin" target="_blank"
					class="twitter" title="Cuenta oficial en Twitter"></a></li>
				<li><a
					href="https://www.facebook.com/UNmedellin"
					target="_blank" class="facebook" title="P&aacute;gina oficial en Facebook"></a></li>
<li><a
					href="https://www.youtube.com/channel/UC9KV1pUV5HznpgvV37ZAP8w"
					target="_blank" class="youtube"
					title="Canal de YouTube de la Sede Medell&iacute;n"></a></li>
				<li><a
					href="http://www.agenciadenoticias.unal.edu.co/nc/sus/type/rss2.html"
					target="_blank" class="rss"
					title="Suscripci&oacute;n a canales de informaci&oacute;n RSS"></a></li>
				
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
							href="http://medellin.unal.edu.co/estudiantes/" target="_top">Estudiantes</a></li>
                      <li class="item_Egresados"><a href="http://medellin.unal.edu.co/egresados"
							target="_top">Egresados</a></li>
						<li class="item_Docentes"><a href="http://medellin.unal.edu.co/docentes/"
							target="_top">Docentes</a></li>
						<li class="item_Administrativos"><a
							href="http://medellin.unal.edu.co/administrativos/" target="_top">Administrativos</a></li>
					</ul>
				</nav>
			</div>
			<!-- End navbar-default -->
		</div>
		<!-- End Fist Menu -->
		<div class="navigation">
			<div class="site-url">
				<div class="icon"></div>
				<a href='/'><?php echo $url; ?></a>
			</div>
			<!-- site url -->
			<div class="navbar-"> 
				<?php if ($this->countModules('menu')) : ?>
					<jdoc:include type="modules" name="menu" style="none" />
            	<?php endif; ?>
        	</div>
		</div>
		<div class="buscador">
<div id="gsearch"></div>


			
		</div>
	</header>
	<div id="services">
		<div class="indicator"></div>
		<ul>
			
			<li>
					<a href="http://correo.unal.edu.co" target="_blank"><img src="templates/unal/images/icnServEmail.png" width="32" height="32" alt="Correo Electr贸nico">Correo Electr贸nico</a>
            </li>
            <li>
					<a href="https://dninfoa.unal.edu.co" target="_blank"><img src="templates/unal/images/icnServSia.png" width="32" height="32" alt="Direcci贸n Nacional de Informaci贸n Acad茅mica">DNINFOA - SIA</a>
            </li>
            <li>
					<a href="http://bibliotecas.unal.edu.co" target="_blank"><img src="templates/unal/images/icnServLibrary.png" width="32" height="32" alt="Biblioteca">Bibliotecas</a>
            </li>
            <li>
					<a href="http://personal.unal.edu.co" target="_blank"><img src="templates/unal/images/icnServCall.png" width="32" height="32" alt="Convocatorias">Convocatorias</a>
            </li>
            <li>
					<a href="http://identidad.unal.edu.co"><img src="templates/unal/images/icnServIdentidad.png" width="32" height="32" alt="Identidad U.N.">Identidad U.N.</a>
            </li>



			

	
			<?php if ($this->countModules('menu-derecha')) : ?>
				<jdoc:include type="modules" name="menu-derecha" style="transbox_clean" />
            		<?php endif; ?>
			
		</ul>
	</div>
		<!-- Fin Plantilla unal-->
		<div class='clear'></div>
		<!-- Comienzo Plantilla de sede -->
<?php if ($this->countModules('home-left') || $this->countModules('home-right') ) : ?>
	<div class='home-right '>
			<div><jdoc:include type="modules" name="home-left" style="transbox" /></div>
			<div><jdoc:include type="modules" name="home-right" style="transbox" /></div>
	</div>
<?php endif;
		//Si existe imagen de la parte superior se muestra en l fondo
			if(($this->params->get('backgroundTop') || $this->countModules('background-top-image')) )  {?>
			<div id='sede_bgtop' class='backgroundTop'>
				<?php if ($this->countModules('background-top-inside')) : ?>
					<div class='backgroundTopInside'>
					<jdoc:include type="modules" name="background-top-inside" style="darkbox_clean" />
				</div>
				<?php endif; ?>
				
				<?php if ($this->params->get('backgroundTop')): ?>
				<img src='<?php echo JURI::base().$this->params->get('backgroundTop'); ?>' alt='Imagen superior de la plantalla'/>
				<?php endif; ?>
				
				<jdoc:include type="modules" name="background-top-image" style="none" />
			</div>
		<?php } //Termina If de Top Image?>

				<?php if ($this->countModules('banner-1')): ?>
				   <div class='banner-1'>
					<jdoc:include type="modules" name="banner-1" style="transbox_clean" />
				   </div>
				<?php endif; ?>
				
				<?php if ($this->countModules('banner-2')): ?>
				   <div class='banner-2'>
					<jdoc:include type="modules" name="banner-2" style="transbox_clean" />
				   </div>
				<?php endif; ?>

		<div class='spacer'></div>
		<!-- Maquetado para generar la parte de Sede Tipo 1, Sede Tipo 2, Sede Tipo 3-->
		
		<?php if ($this->countModules('sede-left-top') ||
					$this->countModules('sede-center-top') 
				||   $this->countModules('sede-right-top') ) : ?>
		
		<div class='row rspace first-row'>
			<div class='left-sede col-md-4'>
				<?php if ($this->countModules('sede-left-top') || 1) : ?>
					<jdoc:include type="modules" name="sede-left-top" style="transbox_clean" />
				<?php endif; ?>
			</div> <!-- End left Sede -->
			
			<div class='center-sede col-md-4'>
				<?php if ($this->countModules('sede-center-top')) : ?>
					<jdoc:include type="modules" name="sede-center-top" style="transbox_clean" />
            	<?php endif; ?>
		 	</div> <!-- End center Sede -->
		
		
			<div class='right-sede col-md-4'>
				<?php if ($this->countModules('sede-right-top')) : ?>
					<jdoc:include type="modules" name="sede-right-top" style="transbox_clean" />
            	<?php endif; ?>
			</div><!-- End Right Sede -->
		</div><!-- End first column Row -->
        <?php endif; ?>
		
		<?php if ($this->countModules('sede-left-bottom-top') || $this->countModules('sede-left-bottom-bottom') ||
					$this->countModules('sede-center-bottom-top') || $this->countModules('sede-center-bottom-bottom')
				||   $this->countModules('sede-right-bottom-top') || $this->countModules('sede-right-bottom-bottom')) : ?>
				
		<div class='row rspace second-row'>
			<div class='left-sede col-md-4'>
				<?php if ($this->countModules('sede-left-bottom-top')) : ?>
					<jdoc:include type="modules" name="sede-left-bottom-top" style="transbox_clean" />
            	<?php endif; ?>
				<?php if ($this->countModules('sede-left-bottom-bottom')) : ?>
					<jdoc:include type="modules" name="sede-left-bottom-bottom" style="transbox_clean" />
            	<?php endif; ?>
			</div> <!-- End left Sede -->
		
		
			<div class='center-sede col-md-4'>
				<?php if ($this->countModules('sede-center-bottom-top')) : ?>
					<jdoc:include type="modules" name="sede-center-bottom-top" style="transbox_clean" />
            	<?php endif; ?>
				<?php if ($this->countModules('sede-center-bottom-bottom')) : ?>
					<jdoc:include type="modules" name="sede-center-bottom-bottom" style="transbox_clean" />
            	<?php endif; ?>
			</div> <!-- End center Sede -->
		
		
			<div class='right-sede col-md-4'>
				<?php if ($this->countModules('sede-right-bottom-top')) : ?>
					<jdoc:include type="modules" name="sede-right-bottom-top" style="transbox_clean" />
            	<?php endif; ?>
				<?php if ($this->countModules('sede-right-bottom-bottom')) : ?>
					<jdoc:include type="modules" name="sede-right-bottom-bottom" style="transbox_clean" />
            	<?php endif; ?>
			</div><!-- End Right Sede -->
		</div><!-- End second Row -->
		<?php endif; ?>
		
		<?php if ($this->countModules('dep-row1-a-left') || $this->countModules('dep-row1-a-right')) : ?>
		<div class='row rspace third-row'>
			<div class='col-md-4'>
				<?php if ($this->countModules('dep-row1-a-left')) : ?>
					<jdoc:include type="modules" name="dep-row1-a-left" style="transbox_clean" />
            	<?php endif; ?>
			</div>	
			<div class='col-md-8'>
			<?php if ($this->countModules('dep-row1-a-right')) : ?>
					<jdoc:include type="modules" name="dep-row1-a-right" style="transbox_clean" />
            	<?php endif; ?>
			</div>
		</div><!-- End third row option 1 -->
        <?php endif; ?>		
		
		<?php if ($this->countModules('dep-row1-b')) : ?>
		<div class='row rspace third-row'>
			<div class='col-md-12'>
					<jdoc:include type="modules" name="dep-row1-b" style="transbox_clean" />
        	</div>	
		</div><!-- End third row option 2 -->	
		<?php endif; ?>
		
		<?php if ($this->countModules('dep-row2-left') || $this->countModules('dep-row2-right') ) : ?>
		<div class='row rspace fourth-row'>
			<div class='col-md-8'>
					<?php if ($this->countModules('dep-row2-left')) : ?>
						<jdoc:include type="modules" name="dep-row2-left" style="transbox_clean" />
            		<?php endif; ?>
			</div>	
			<div class='col-md-4 dep-row2-right'>
					<?php if ($this->countModules('dep-row2-right')) : ?>
						<jdoc:include type="modules" name="dep-row2-right" style="transbox_clean" />
            		<?php endif; ?>
			</div>
		</div><!-- End forth row -->
		<?php endif; ?>

		<?php if ($this->countModules('dep-row3-left') || $this->countModules('dep-row3-right')) : ?>
		<div class='row rspace fifth-row'>
			<div class='col-md-3'>
				<?php if ($this->countModules('dep-row3-left')) : ?>
						<jdoc:include type="modules" name="dep-row3-left" style="transbox_clean" />
           		<?php endif; ?>
			</div>	
			<div class='col-md-9'>
				<?php if ($this->countModules('dep-row3-right')) : ?>
						<jdoc:include type="modules" name="dep-row3-right" style="transbox_clean" />
           		<?php endif; ?>
			</div>
		</div><!-- End fifth row -->
		<?php endif; ?>
		
		<?php if ($this->countModules('dep-2c-row1-left') || $this->countModules('dep-2c-row1-right')) : ?>
		<div class='row rspace sixth-row'>
			<div class='col-md-5'>
				<?php if ($this->countModules('dep-2c-row1-left')) : ?>
						<jdoc:include type="modules" name="dep-2c-row1-left" style="transbox_clean" />
           		<?php endif; ?>
			</div>
			<div class='col-md-1'></div>
			<div class='col-md-6'>
				<?php if ($this->countModules('dep-2c-row1-right')) : ?>
						<jdoc:include type="modules" name="dep-2c-row1-right" style="transbox_clean" />
           		<?php endif; ?>
			</div>
		</div><!-- End fifth row -->
        <?php endif; ?>
		
		<?php if ($this->countModules('dep-2c-row2-left') || $this->countModules('dep-2c-row2-right')) : ?>
		<div class='row rspace seven-row'>
			<div class='col-md-5'>
				<?php if ($this->countModules('dep-2c-row2-left')) : ?>
						<jdoc:include type="modules" name="dep-2c-row2-left" style="transbox_clean" />
           		<?php endif; ?>
			</div>
			<div class='col-md-1'></div>
			<div class='col-md-6 dep-2c-row2-right'>
				<?php if ($this->countModules('dep-2c-row2-right')) : ?>
						<jdoc:include type="modules" name="dep-2c-row2-right" style="transbox_clean" />
           		<?php endif; ?>
			</div>
		</div><!-- End fifth row -->
		<?php endif; ?>
		
		<div class='row rspace seven-row'>
		<?php if ($this->countModules('component-left') ) : ?>		
			<div class='col-md-2'>
						<jdoc:include type="modules" name="component-left" style="transbox" />
			</div>
		<?php endif; ?>
		<?php 
			$i = 12;
			if ($this->countModules('component-left'))
				$i -=2;
			if ($this->countModules('component-right')) 
				$i -=2;
		?>
		
		<?php if ($show_component || $this->countModules('component-top') || $this->countModules('component-bottom') ) : ?>		
<div class='col-md-<?php echo $i; ?> ' >
		<main id="component" class="detalle">
				<jdoc:include type="message" />

				<?php if ($this->countModules('component-top')) : ?>
					<jdoc:include type="modules" name="component-top" style="none" />
		   		<?php endif; ?>
		
				<?php if ($show_component) : ?>		
					<jdoc:include type="component" />
				<?php endif; ?>
	
				<?php if ($this->countModules('component-bottom')) : ?>
					<jdoc:include type="modules" name="component-bottom" style="none" />
		   		<?php endif; ?>
			<div class='clear'></div>
		</main>
</div>
		
	   <?php endif;?>
		<?php if ($this->countModules('component-right') ) : ?>		
			<div class='col-md-2 component-right'>
						<jdoc:include type="modules" name="component-right" style="transbox" />
			</div>
		<?php endif; ?>
		
		
		
		</div><!-- End seven row -->
		
		<?php if ($this->countModules('bottom-page')) : ?>
		<div class='row rspace eight-row'>
			<div class='col-md-12'>
					<jdoc:include type="modules" name="bottom-page" style="transbox_clean" />
        	</div>	
		</div><!-- End third row option 2 -->
		<?php endif; ?>
	
	            <div class="push"></div>
	
	</div><!-- End Wrapper -->
	<!-- Fin de definici贸n de la plantilla de sede-->


	
 <!-- Inicia Pie de P谩gina Unal -->
	<footer>
	<?php if ($this->countModules('prefooter')): ?>
				   <div class='prefooter'>
					<jdoc:include type="modules" name="prefooter" style="darkbox_clean" />
				   </div>
		<?php endif; ?>	

	<div class='footer'>
		<div class="row">
			<div class="col-md-3 col-lg-3 col-sm-3 col-xs-6 gobiernoLinea">
				<div class="navbar-">
					<div class="btn-group">
						<a href="http://www.legal.unal.edu.co" target="_top">R茅gimen Legal</a>
					</div>
					<div class="btn-group">
						<a href="http://www.unal.edu.co/dnp" target="_top">Talento humano</a>
					</div>
					<div class="btn-group">
						<a href="http://contratacion.unal.edu.co" target="_top">Contrataci贸n</a>

					</div>
					<div class="btn-group">
						<a href="http://www.unal.edu.co/dnp/" target="_top">Ofertas de
							empleo</a>
					</div>
					<div class="btn-group">
						<a href="http://www.unal.edu.co/rendicion_de_cuentas/2012/"
							target="_top">Rendici贸n de cuentas</a>
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
						<a href="http://siga.unal.edu.co" target="_top">Calidad</a>

					</div>
					<div class="btn-group">
						<a href="http://unal.edu.co/buzon-de-notificaciones/"
							target="_self">Buz贸n de notificaciones</a>
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
						<a href="http://unal.edu.co/atencion-en-linea/" target="_self">Atenci贸n
							en l铆nea</a>
					</div>
					<div class="btn-group">
						<a href="http://unal.edu.co/encuesta/" target="_self">Encuesta</a>
					</div>
					<div class="btn-group">
						<a href="http://unal.edu.co/contactenos/" target="_self">Cont谩ctenos</a>
					</div>
					<div class="btn-group">
						<a href="http://www.onp.unal.edu.co" target="_top">Estad铆sticas</a>
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
						<?php echo $this->params->get('direccion'); ?><br />Medell&iacute;n,&nbsp;
						Colombia<br />(+57 4) &nbsp;<?php echo $this->params->get('telefono'); ?>
					</p>
				</div>
				<div class="csc-frame csc-frame-indent">
					<p class="bodytext">
						漏 Copyright 2014<br />Algunos derechos reservados.<br /> <a
							href="mailto:<?php echo $this->params->get('email'); ?>"
							title="Contacto de esta pagina en la Universidad Nacional de Colombia"
							class="mail"><?php echo $this->params->get('email'); ?></a><br /> <a
							href="http://unal.edu.co/acerca-de-este-sitio-web/"
							title="Acerca de la web de la Universidad Nacional de Colombia"
							target="_blank" class="internal-link">Acerca de este sitio web<br /></a>
					</p>
					<div class="csc-default">
						<jdoc:include type="modules" name="actualizacion" style="none" />
					</div>
				</div>
			</div>


			<div class="col-md-2 col-lg-2 col-sm-2 col-xs-12 logos">
				<a href="http://www.orgulloun.unal.edu.co"><img alt="Orgullo UN" src="/templates/unal/images/log_orgullo.png" style="width:94px;height:37px" title="Orgullo UN"></a> 
				<a href="https://www.sivirtual.gov.co/memoficha-entidad/-/entidad/T0356"><img alt="Tr醡ites en l韓ea" src="/templates/unal/images/log_gobiern.png" style="width:94px;height:37px" title="Programa gobierno en l韓ea"></a>
					
				<div class="clear"></div>
				
<a href="http://www.agenciadenoticias.unal.edu.co/inicio.html" class="imgAgencia"><img alt="Agencia de Noticias" src="/templates/unal/images/log_agenc.png" style="width:94px;height:37px" title="Agencia de Noticias"></a>

					<a href="http://www.contaduria.gov.co/"><img alt="Contadur韆 general de la republica" src="/templates/unal/images/log_contra.png" style="width:94px;height:37px" title="Contadur韆 general de la republica"></a>
			</div>
		</div>
</div>
	</footer>

	<?php if ($this->countModules('hidden') ) : ?>		
<div class='hidden' style='display:none'><jdoc:include type="modules" name="hidden" style="hidden" /></div>
		<?php endif; ?>
	<script src="<?php echo $tpath; ?>/js/unal.js" type="text/javascript"></script>
	<jdoc:include type="modules" name="debug" />
</body>

</html>
