<?php
/*
 * Unal Menu
 *
 */
defined ( '_JEXEC' ) or die ( 'Restricted access' );
error_reporting ( E_ERROR );
define ( "DS", DIRECTORY_SEPARATOR );
require_once (JPATH_SITE . DS . 'modules' . DS . 'mod_unalmenu' . DS . 'mod_unalmenu' . DS . 'helpers' . DS . 'unalmenuhelper.php');

global $Itemid;
$showHiddenMenuItems = $params->get ( 'showHiddenMenuItems', false );
$menuType = $params->get ( 'menuType', 'mainmenu' );
$showType = $params->get ( 'showType', 'ipod' );
$orientation = $params->get ( 'orientation', 'horizontal' );
$trigger = $params->get ( 'trigger', 'mouseenter' );
$parentClickable = $params->get ( 'parentClickable', 0 );
$mode = $params->get ( 'mode', 'default' );
$loadJQuery = $params->get ( 'loadJQuery', 1 );
$theme = $params->get ( 'theme', 1 );

$user = & JFactory::getUser ();
if ($user) {
	$userId = $user->get ( 'id' );
}
$isUserLoggedIn = $userId > 0 ? true : false;
$menu = UnalMenuHelper::getMenu ( $menuType, ($isUserLoggedIn || $showHiddenMenuItems) );

$selectedId = UnalMenuHelper::getParentMenuItemId ( $menu, $Itemid );
$selectedIndex = UnalMenuHelper::getMenuItemIndex ( $menu, $selectedId );
$moduleId = $module->id;

$menuParams = array ();

$menuParams = UnalMenuHelper::getModuleParams ( $menuParams, $params );
UnalMenuHelper::renderMenu ( $showType, array (
		'menu' => $menu,
		'moduleParams' => $menuParams,
		'selectedId' => $selectedId,
		'selectedIndex' => $selectedIndex,
		'moduleId' => $module->id 
) );

?>
