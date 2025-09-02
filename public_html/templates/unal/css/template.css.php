<?php 

// initialize ob_gzhandler to send and compress data
ob_start ("ob_gzhandler");
// initialize compress function for whitespace removal
ob_start("compress");
// required header info and character set
header("Content-type:text/css; charset=UTF-8");
// cache control to process
header("Cache-Control:must-revalidate");
// duration of cached content (1 hour)
$offset = 60 * 60 ;
// expiration header format
$ExpStr = "Expires: " . gmdate("D, d M Y H:i:s",time() + $offset) . " GMT";
// send cache expiration header to broswer
header($ExpStr);
// begin function compress
function compress($buffer) {
	// remove comments
	$buffer = preg_replace('!/\*[^*]*\*+([^/][^*]*\*+)*/!', '', $buffer);
	// remove tabs, spaces, new lines, etc.        
	$buffer = str_replace(array("\r\n","\r","\n","\t",'  ','    ','    '),'',$buffer);
	// remove unnecessary spaces        
	$buffer = str_replace('{ ', '{', $buffer);
	$buffer = str_replace(' }', '}', $buffer);
	$buffer = str_replace('; ', ';', $buffer);
	$buffer = str_replace(', ', ',', $buffer);
	$buffer = str_replace(' {', '{', $buffer);
	$buffer = str_replace('} ', '}', $buffer);
	$buffer = str_replace(': ', ':', $buffer);
	$buffer = str_replace(' ,', ',', $buffer);
	$buffer = str_replace(' ;', ';', $buffer);
	$buffer = str_replace(';}', '}', $buffer);
	
	return $buffer;
}

// bootstrap

//require('bootstrap.css');
require('form_bootstrap.css');
require('bootstrap.min.css');
require('bootstrap-select.min.css');
require('icons.css');
require('reset.css');
require('unal.css');
require('base.css');
require('basejml.css');

echo "@media screen and (min-width: 992px) and (max-width: 1199px) {";
require('tablet.css');
echo "}";
echo "@media screen and (min-width: 768px) and (max-width: 991px) {";
require('phone.css');
echo "}";
echo "@media screen and (max-width: 767px) {";
require('small.css');
echo "}";
require('sede.css');

// font awesome
//require('font-awesome.css');

// template css
/*require('unal.css');
require('reset.css');
require('base.css');*/

// load system stylesheets for system messages and default buttons
/*require('../../../media/system/css/system.css');
require('../../system/css/system.css');
require('../../system/css/general.css');*/

?>
