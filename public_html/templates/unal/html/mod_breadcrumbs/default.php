<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_breadcrumbs
 *
 * @copyright   Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;


?>

<div class="breadcrumb_<?php echo $moduleclass_sfx; ?> breadcrumb-class">
	<?php
	if ($params->get('showHere', 1))
	{
		echo '<b>' . JText::_('MOD_BREADCRUMBS_HERE') . '&#160;</b>';
	}
	else
	{
		echo '<b> <span class="divider icon-location"></span></b>';
	}

	// Get rid of duplicated entries on trail including home page when using multilanguage
	for ($i = 0; $i < $count; $i++)
	{
		if ($i == 1 && !empty($list[$i]->link) && !empty($list[$i - 1]->link) && $list[$i]->link == $list[$i - 1]->link)
		{
			unset($list[$i]);
		}
	}

	// Find last and penultimate items in breadcrumbs list
	end($list);
	$last_item_key = key($list);
	prev($list);
	$penult_item_key = key($list);

	// Make a link if not the last item in the breadcrumbs
	$show_last = $params->get('showLast', 1);

	// Generate the trail
	foreach ($list as $key => $item) :
	if ($key != $last_item_key)
	{
		// Render all but last item - along with separator
		echo ' ';
		if (!empty($item->link))
		{
			echo '<a href="' . $item->link . '" class="pathway">' . $item->name . '</a>';
		}
		else
		{
			echo '' . $item->name . '';
		}

		if (($key != $penult_item_key) || $show_last)
		{
			echo ' <b> / </b>';
		}

		echo ' ';
	}
	elseif ($show_last)
	{
		// Render last item if reqd.
		echo '<span><b>' . $item->name . '</b></span>';
	}
	endforeach; ?>
</div>
