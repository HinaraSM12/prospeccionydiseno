<?php
/*
 * Art Wijmo menu: simple template - main template file
 *
 * @version		1.0.3
 * @author		Artetics
 * @copyright	Copyright (c) 2009 www.artetics.com. All rights reserved
 * @license		GNU/GPL (http://www.gnu.org/copyleft/gpl.html)
 */
error_reporting ( E_ERROR );

$moduleParams = $params ['moduleParams'];
$moduleId = $params ['moduleId'];
$menu = $params ['menu'];
$menuId = $params ['menuId'];
$selectedId = $params ['selectedId'];
$selectedIndex = $params ['selectedIndex'];
$theme = $params ['theme'];

if (! function_exists ( 'unalmenu_traverseMenuChildrenItems' )) {
	function unalmenu_traverseMenuChildrenItems($menu, $parentId = 0, $showTypeElm, $theme, $moduleParams, $showType = null, $isparent = false) {
		$Itemid = JRequest::getString ( 'Itemid' );
		
		$cc = count ( $menu );
		$j = 1;
		
		$menuItemParams = new JRegistry ();
		foreach ( $menu as $menuItem ) {
			if ((isset ( $menuItem->parent ) && $menuItem->parent != $parentId) || (isset ( $menuItem->parent_id ) && $menuItem->parent_id != $parentId))
				continue;
			$link = $menuItem->link;
			
			$menuItemParams->loadString ( $menuItem->params );
			if ($menuItemParams && $menuItemParams->get ( 'menu_image' )) {
				$menuItem->menu_image = $menuItemParams->get ( 'menu_image' );
			}
			
			if ($menuItem->type == 'menulink') {
				$jMenu = JFactory::getApplication()->getMenu();
				$itemIdStrPos = strpos ( $menuItem->link, 'Itemid=' );
				$newItem = $jMenu->getItem ( substr ( $menuItem->link, $itemIdStrPos + 7 ) );
			} else if ($menuItem->type == 'alias') {
				$jMenu = JFactory::getApplication()->getMenu();
				$newItem = $jMenu->getItem ( substr ( $menuItem->params, 17, strpos ( $menuItem->params, '",' ) - 17 ) );
				$link = $newItem->link;
			} else if ($link && ($menuItem->type == 'component' || strpos ( $link, 'http' ) !== 0)) {
				$link .= (strpos ( $link, '?' ) !== false) ? '&' : '?';
				$link .= 'Itemid=' . $menuItem->id;
			}
			$app = &JFactory::getApplication ();
			$router = &$app->getRouter ();
			$link = JRoute::_ ( $link, false );
			
			$addClass = '';
			$classString = '';
			if ($Itemid == $menuItem->id) {
				$classString .= 'menuactive';
			}
			if ((isset ( $menuItem->children ) && count ( $menuItem->children ) > 0) && ! $moduleParams ['parentClickable']) {
				$link = 'javascript:void(0);';
			}
			if (! $link) {
				$link = 'javascript:void(0);';
			}
			if ($addClass) {
				$classString .= ' ' . $addClass . '';
			}
			if (! $menuItem->name) {
				$menuItem->name = $menuItem->title;
			}
			
			if ($isparent) {
				if ($menuItem->type == 'separator' || $link=="javascript:void(0);") {
					?>
<div class="btn-group">
	<div class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				
				<?php echo $menuItem->name;?>
											<?php if (isset($menuItem->children) && count($menuItem->children) > 0) { ?>
											<span class="caret"></span>
											<?php } ?>
	</div> <!-- Close dropdown menu -->
											<?php
					if (isset ( $menuItem->children ) && count ( $menuItem->children ) > 0) {
						echo '<ul class="dropdown-menu">';
						unalmenu_traverseMenuChildrenItems ( $menuItem->children, $menuItem->id, $showTypeElm, $theme, $moduleParams, $showType );
						echo '</ul>';
					}
					?>
</div> <!-- Close Btn group -->
<?php
				} else {
					?>
<div class="btn-group">
	
	<div class="btn btn-default <?php echo ($link=='#' )?"dropdown-toggle":""?>"  <?php echo ($link=='#')?'data-toggle="dropdown"':""?> >
		<a href="<?php echo $link;?>"
			<?php if ($menuItem->browserNav && $menuItem->browserNav != 0) {echo 'target="_blank"';}else{echo 'target="_self"';}?>>
										      <?php if ($menuItem->menu_image) { ?><img src="<?php echo $menuItem->menu_image; ?>"
			alt="<?php echo $menuItem->name; ?>" /> <?php } ?>
										      <?php echo $menuItem->name;?></a>
										    	  	<?php
					if (isset ( $menuItem->children ) && count ( $menuItem->children ) > 0)
						echo '<span class="caret"></span>';
					echo "</div> <!-- Close dropdown -->";
					if (isset ( $menuItem->children ) && count ( $menuItem->children ) > 0) {
						echo '<ul>';
						unalmenu_traverseMenuChildrenItems ( $menuItem->children, $menuItem->id, $showTypeElm, $theme, $moduleParams, $showType );
						echo '</ul>';
					}
					?>
</div><!-- Ckise Boto group -->
										<?php
				}
			} else {
				if ($menuItem->type == 'separator') {
					?>
								<li><a><?php echo $menuItem->name;?></a></li>
									<?php
					if (isset ( $menuItem->children ) && count ( $menuItem->children ) > 0) {
						unalmenu_traverseMenuChildrenItems ( $menuItem->children, $menuItem->id, $showTypeElm, $theme, $moduleParams, $showType );
					}
				} else {
					?>
						<li><a href="<?php echo $link;?>"
		<?php if ($menuItem->browserNav && $menuItem->browserNav != 0) {echo 'target="_blank"';}else{echo 'target="_self"';}?>>
					      <?php if ($menuItem->menu_image) { ?><img
			src="<?php echo $menuItem->menu_image; ?>"
			alt="<?php echo $menuItem->name; ?>" /> <?php } ?>
					      <?php echo $menuItem->name;?></a>
						<?php
					if (isset ( $menuItem->children ) && count ( $menuItem->children ) > 0) {
						unalmenu_traverseMenuChildrenItems ( $menuItem->children, $menuItem->id, $showTypeElm, $theme, $moduleParams, $showType );
					}
					?>
						</li>
					<?php
				}
			}
			$j ++;
		}
	}
}

// Imprime el menú

if ($menu) {
	$document = &JFactory::getDocument ();
	$version = new JVersion ();
	if ($version->RELEASE >= 1.6) {
		unalmenu_traverseMenuChildrenItems ( $menu, 1, $showTypeElm, $theme, $moduleParams, $showType, true );
	} else {
		unalmenu_traverseMenuChildrenItems ( $menu, 0, $showTypeElm, $theme, $moduleParams, $showType, true );
	}
}
?>
<div class="btn-group">
	<div class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		Sedes<span class="caret"></span>
	</div>
	<ul class="dropdown-menu">
		<li><a href="http://amazonia.unal.edu.co" target="_blank">Amazonia</a><span class="caret-right"></span></li>
		<li><a href="http://bogota.unal.edu.co" target="_blank">Bogotá</a><span class="caret-right"></span></li>
		<li><a href="http://caribe.unal.edu.co" target="_blank">Caribe</a><span class="caret-right"></span></li>
		<li><a href="http://delapaz.unal.edu.co" target="_blank">De La Paz</a><span class="caret-right"></span></li>
		<li><a href="http://www.manizales.unal.edu.co" target="_blank">Manizales</a><span class="caret-right"></span></li>
		<li><a href="http://medellin.unal.edu.co" target="_blank">Medellín</a><span class="caret-right"></span></li>
		<li><a href="http://orinoquia.unal.edu.co" target="_blank">Orinoquia</a><span class="caret-right"></span></li>
		<li><a href="http://www.palmira.unal.edu.co" target="_blank">Palmira</a><span class="caret-right"></span></li>
		<li><a href="http://tumaco-pacifico.unal.edu.co" target="_blank">Tumaco</a><span class="caret-right"></span></li>
	</ul>
</div>
