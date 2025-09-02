{include file= "../masterPage/templateResponsive.tpl"}
{include file= "../layouts/inc/header.tpl"}
<main class="detalle">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="csc-default">
                <div class="logo">
                    <img alt="InverPep" src="{URL::to('/')}/assets/img/logo1.png" width="925" height="110" title="InverPep"/>
                </div>
		<div class="csc-header csc-header-n1">
                    <h1 class="csc-firstHeader">Estadísticas</h1>
		</div>
		<div class="col-lg-12">

		<h4 p align="center"><b>Status: </b>774 péptidos.</p></h4>
		<hr />

		<table class="table table-bordered" border="2">

								<br>
									<tr class="success">

										<th></th>
										<th align="center"># de a.as</th>
										<th>Peso molecular (g/mol)</th>
										<th>Carga neta</th>
										<th>pI</th>
										<th>Hidrofobicidad</th>
										<th>Índice de Boman (Kcal/mol)</th>
										<th>Índice alifático</th>
										<th>% de a.as hidrofóbicos</th>
									</tr>

									<tr>
										<th class="success">Promedio</th>
										<td>46,024</td>
										<td>5037,939</td>
										<td>3,914</td>
										<td>9,899</td>
										<td>-0,196</td>
										<td>1,287</td>
										<td>81,222</td>
										<td>40,646</td>
									</tr>

									<tr>
										<th class="success">Mediana</th>
										<td>37,000</td>
										<td>4066,310</td>
										<td>3,900</td>
										<td>10,400</td>
										<td>-0,290</td>
										<td>1,470</td>
										<td>74,257</td>
										<td>40,525</td>
									</tr>

									<tr>
										<th class="success">Desviación estándar</th>
										<td>43,447</td>
										<td>4681,519</td>
										<td>3,676</td>
										<td>1,846</td>
										<td>0,708</td>
										<td>1,272</td>
										<td>43,746</td>
										<td>12,409</td>
									</tr>

								</table>
                    <br><br><br><br>

					<center>
						<img alt="Análisis estadísticos" src="{URL::to('/')}/assets/img/fig1.png" width="739" height="463" title="Análisis estadísticos"/><br>
						<b>Fig. 1</b>. Análisis estadísticos de InverPep. Distribución de los péptidos según su tamaño (a), porcentaje de residuos hidrofóbicos
						(b), carga neta (c), índice alifático (d), índice de Boman (e) y punto isoeléctrico (f).<hr /><br><br><br><br>
						<img alt="Especies originarias" src="{URL::to('/')}/assets/img/fig2.png" width="501" height="351" title="Especies originarias"/><br>
						<b>Fig. 2</b>. Diagrama de torta con los filos de las especies de origen de los péptidos de invertebrados de InverPep. <hr /><br><br><br><br>
						<img alt="Actividad reportada" src="{URL::to('/')}/assets/img/fig3.png" width="800" height="485" title="Actividad reportada"/><br>
						<b>Fig. 3</b>. Diagrama de torta con la actividad reportada de los péptidos de invertebrados de InverPep.
					</center>

            </div>

                <br><br>

            </div>
	</div>

    </div>
</main>

{include file= "../layouts/inc/footer.tpl"}
