
<?php

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
 

class plgSystemBootstrapremover extends JPlugin
{
    public function onBeforeCompileHead()
    {
        // Application Object
        $app = JFactory::getApplication();

        // Frontend
        if( $app instanceof JApplicationSite )
        {
            $doc            = JFactory::getDocument();
            // Remove default bootstrap
            unset($doc->_scripts[JURI::root(true).'/media/jui/js/bootstrap.min.js']);
        }
    }
}

?>
