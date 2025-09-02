<header id="unalTop">

<div class="logo">
	<a href="http:/unal.edu.co">
            <img alt="Escudo de la Universidad Nacional de Colombia" src="{URL::to('/')}/assets/img/escudoUnal.png" width="189" height="70" title="Escudo de la Universidad Nacional de Colombia"/>
	</a>
	<div class="diag"></div>
</div>


<div class="seal">
	<img alt="Escudo de la República de Colombia" src="{URL::to('/')}/assets/img/sealColombia.png" width="66" height="66" title="Escudo de la República de Colombia"/>
</div>

<div class="firstMenu">
    <div class="btn-group tx-srlanguagemenu">
        <div class="btn btn-default dropdown-toggle" data-toggle="dropdown"> ES <span class="caret"></span></div>
		<ul class="dropdown-menu" role="menu">
				<li><a href="{url('/home')}" target="_self">ES</a></li>
				<li><a href="{url('/home_en')}" target="_self">EN</a></li>
		</ul>
	</div>

	<ul class="socialLinks">
		<li><a href="https:/twitter.com/unimedios" target="_blank" class="twitter" title="Cuenta oficial en Twitter"></a></li>
		<li><a href="https:/www.facebook.com/pages/Agencia-de-Noticias-UN/193658967327822" target="_blank" class="facebook" title="Página oficial en Facebook"></a></li>
		<li><a href="http:/www.agenciadenoticias.unal.edu.co/nc/sus/type/rss2.html" target="_blank" class="rss" title="Suscripción a canales de información RSS"></a></li>
	</ul>
</div>

<div class="navigation">
	<div class="site-url">
		<div class="icon"></div>ciencias.medellin.unal.edu.co</div>
        <div class="navbar-">
			<div class="btn-group">
				<div class="btn btn-default dropdown-toggle">
					<ul class="nav navbar-nav"><li><a href="{url('/home')}" target="_self">Inicio</a></li></ul>
				</div>
				
				<div class="btn btn-default">
					<ul class="nav navbar-nav"><li><a href="{url('Peptido/listar')}" target="_self">Listar Péptidos</a></li></ul>
				</div>

				<div class="btn btn-default">
					<ul class="nav navbar-nav"><li><a href="{url('Peptido/buscar')}" target="_self">Buscar Péptidos</a></li></ul>
				</div>

				<div class="btn btn-default">
					<ul class="nav navbar-nav"><li><a href="{url('/herramientas')}" target="_self">CALCAMPI</a></li></ul>
				</div>

				<div class="btn btn-default">
					<ul class="nav navbar-nav"><li><a href="{url('/typep')}" target="_self">TYPE-PEPTIDE</a></li></ul>
				</div>

				<div class="btn btn-default">
					<ul class="nav navbar-nav"><li><a href="{url('/filter_pep')}" target="_self">FILTRO-SECUENCIAS</a></li></ul>
				</div>

				<div class="btn btn-default">
					<ul class="nav navbar-nav"><li><a href="{url('/traductor')}" target="_self">Traductor</a></li></ul>
				</div>

				<!--
				(TODO) Estas opciones estan haciendo overflow en el container, pero el container no se modifica 
				<div class="btn btn-default">
					<ul class="nav navbar-nav"><li><a href="{url('/estadisticas')}" target="_self">Estadísticas</a></li></ul>
				</div>

				<div class="btn btn-default">
					<ul class="nav navbar-nav"><li><a href="{url('/ayuda')}" target="_self">Ayuda</a></li></ul>
				</div>
				-->
			</div>

			{if Auth::check()}
				<div class="btn-group">
					<div class="btn btn-default">
						<ul class="nav navbar-nav"><li><a href="{url('Admin')}" target="_self">Administración</a></li></ul>
					</div>
				</div>
			{/if}
		</div>
	</div>
</div>

</header>

<div id="services">
	<div class="indicator">
	</div>
	<ul>
            {if Auth::check()}
		<li><img src="{URL::to('/')}/assets/img/Engrane2.png" width="32" height="32" border="0" alt=""><a href="{url('Admin/logout')}">Cerrar Sesión</a></li>
            {else}
		<li><img src="{URL::to('/')}/assets/img/Engrane2.png" width="32" height="32" border="0" alt=""><a href=" {{URL::to('login')}}">Iniciar Sesión</a></li>
            {/if}
	</ul>
</div>

<div class="home-image">
    <img src="{URL::to('/')}/assets/img/img_demo.jpg" class="img-responsive" width="auto" border="0" alt="">
</div>
