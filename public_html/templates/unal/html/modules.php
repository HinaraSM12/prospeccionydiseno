<?php defined('_JEXEC') or die;

function modChrome_well($module, &$params, &$attribs) {
	if ($module->content) {
		echo "<div class=\"well well-sm" . htmlspecialchars($params->get('moduleclass_sfx')) . "\">";
		if ($module->showtitle) {
			echo "<h3>" . $module->title . "</h3>";
		}
		echo $module->content;
		echo "</div>";
	}
}

function modChrome_transbox_nopinboard($module, &$params, &$attribs) {
	if ($module->content) {
		echo "<div class=\"transbox " . htmlspecialchars($params->get('moduleclass_sfx')) . "\">";
		if ($module->showtitle) 
			echo "<div class='title'><h3>" . $module->title . "</h3></div>";
			echo "<div class='content'>" . $module->content. "</div>";
			echo "</div>";
	}
}

function modChrome_transbox($module, &$params, &$attribs) {
	if ($module->content) {
		echo "<div class=\"transbox " . htmlspecialchars($params->get('moduleclass_sfx')) . "\">";
		if ($module->showtitle)
			echo "<div class='title'><h3>" . $module->title . "</h3><div class='image chinche'></div></div>";
		echo "<div class='content'>" . $module->content. "</div>";
		echo "</div>";
	}
}

function modChrome_no_style($module, &$params, &$attribs) {
	if ($module->content) {
		if ($module->showtitle) 
			echo "<h3>" . $module->title . "</h3>";
			echo $module->content;
	}
}

function modChrome_transbox_no_gray_title($module, &$params, &$attribs) {
	if ($module->content) {
		echo "<div class=\"transbox " . htmlspecialchars($params->get('moduleclass_sfx')) . "\">";
		if ($module->showtitle)
		echo "<div class='content'>"."<h3>" . $module->title . "</h3>" . $module->content. "</div>";
		echo "</div>";
	}
}


function modChrome_transbox_clean($module, &$params, &$attribs) {
	if ($module->content) {
		echo "<div class=\"transbox " . htmlspecialchars($params->get('moduleclass_sfx')) . "\">";
		if ($module->showtitle)
			echo "<h3>" . $module->title . "</h3>";

		echo $module->content;
		echo "</div>";
	}
}

function modChrome_darkbox($module, &$params, &$attribs) {
	if ($module->content) {
		if ($module->showtitle)
			echo "<div class='title_white'><h3>" . $module->title . "</h3></div>";

		echo "<div class=\"transbox darkbox " . htmlspecialchars($params->get('moduleclass_sfx')) . "\">";
		echo "<div class='content'>" . $module->content. "</div>";
		echo "</div>";
	}
}

function modChrome_hidden($module, &$params, &$attribs) {
	echo $module->content;	
}

function modChrome_darkbox_no_gray_title($module, &$params, &$attribs) {
	if ($module->content) {
		echo "<div class=\"transbox darkbox " . htmlspecialchars($params->get('moduleclass_sfx')) . "\">";
		if ($module->showtitle)
			echo "<div class='content'>"."<h3>" . $module->title . "</h3>" . $module->content. "</div>";

		echo "</div>";
	}
}


function modChrome_darkbox_clean($module, &$params, &$attribs) {
	if ($module->content) {
		echo "<div class=\"transbox darkbox " . htmlspecialchars($params->get('moduleclass_sfx')) . "\">";
		if ($module->showtitle)
			echo "<h3>" . $module->title . "</h3>";

		echo $module->content;
		echo "</div>";
	}
}
?>
