
{include file="../masterPage/templateResponsive.tpl"}
    {include file= "../layouts/inc/header.tpl"}


<main class="detalle">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="csc-default">
		<div class="csc-header csc-header-n1">
                    <h1 class="csc-firstHeader"><h1 class="page-header">ERROR
                    <small></small>
                </h1></h1>
		</div>
		<div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="jumbotron">
                                <h1><span class="error-404">¡Lo Sentimos!</span>
                                </h1>
                                <p>
                                    {if Session::has('mensaje')}

                                                <p>{{Session::get('mensaje') }}</p>

                                    {/if}

                                </p>

                            </div>
                        </div>
                    </div>
                <br><br>
            </div>
	</div>

    </div>
</main>

{include file= "../layouts/inc/footer.tpl"}

</html>
