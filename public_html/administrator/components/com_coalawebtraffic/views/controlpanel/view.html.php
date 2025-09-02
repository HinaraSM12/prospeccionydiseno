<?php

/**
 * @package     Joomla
 * @subpackage  CoalaWeb Traffic
 * @author      Steven Palmer <support@coalaweb.com>
 * @link        https://coalaweb.com/
 * @license     GNU/GPL, see /assets/en-GB.license.txt
 * @copyright   Copyright (c) 2018 Steven Palmer All rights reserved.
 *
 * CoalaWeb Traffic is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/gpl.html>.
 */

defined('_JEXEC') or die('Restricted access');

jimport('joomla.application.component.view');
jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');

/**
 * View class for control panel
 */
class CoalawebtrafficViewControlpanel extends JViewLegacy
{

    /**
     * Component params
     *
     * @var  array
     */
    protected $params;

    protected $isPro;
    protected $version;
    protected $release_date;
    protected $needsdlid;
    protected $countries;
    protected $cities;
    protected $stats;
    protected $geoExist;
    protected $current;

    /**
     * Display the view
     *
     * @param string $tpl The name of the template file to parse; automatically searches through the template paths.
     *
     * @return void
     * @throws Exception
     */
    function display($tpl = null) 
    {
        // Check for errors.
        if (count($errors = $this->get('Errors'))) {
            throw new Exception(implode("\n", $errors), 500);
        }

        CoalawebtrafficHelper::addSubmenu('controlpanel');

        // Is this the Pro release
        $isPro = (COM_CWTRAFFIC_PRO == 1);
        $this->isPro = $isPro;

        $model = $this->getModel();

        // Load component params
        $this->params = JComponentHelper::getParams('com_coalawebtraffic');

        //Get stats
        if($isPro) {
            $countries = CoalawebtrafficHelperLocation::getCountries(5, 1);
            $cities = CoalawebtrafficHelperLocation::getCities(5, 1);
        } else {
            $countries = $model->getCountries();
            $cities = $model->getCities();
        }
        
        // The curent version and release date
        $version = (COM_CWTRAFFIC_VERSION);
        $this->version = $version;
        
        //Release date
        $releaseDate = (COM_CWTRAFFIC_DATE);
        $this->release_date = $releaseDate;
        
        //Need a download ID?
        $needsDlid = $model->needsDownloadID();
        $this->needsdlid = $needsDlid;

        // Stats summary
        $this->countries = $countries;
        $this->cities = $cities;
        $this->stats = $model->getStats();
 
        // We don't need toolbar in the modal window.
        if ($this->getLayout() !== 'modal') {
            $this->addToolbar();
        }
        
        // What geo location to use
        $geodb = $isPro ? 'geoip/v2' : 'geoip';
        if (CoalawebtrafficHelperLocation::geodatExist($geodb, $isPro )) {
            $this->geoExist = true;
        } else {
            $this->geoExist  = false;
        }

        // Lets check the current version against the latest
        $type = $isPro ? 'pro' : 'core';
        if (class_exists('CwGearsLatestversion')) {
            $this->current = CwGearsLatestversion::getCurrent('cw-traffic-'. $type, $version );
        } else {
            $this->current = [
                'remote' => JText::_('COM_CWTRAFFIC_NO_FILE'),
                'update' => ''
            ]; 
        }
        
        parent::display($tpl);
    }
    
    /**
     * Add the page title and toolbar.
     *
     * @return void
     */
    protected function addToolbar() 
    {
        $canDo = JHelperContent::getActions('com_coalawebtraffic');

        // Is this the Pro release
        $isPro = (COM_CWTRAFFIC_PRO == 1);

        $title = $isPro ? JText::_('COM_CWTRAFFIC_TITLE_PRO') : JText::_('COM_CWTRAFFIC_TITLE_CORE');
        JToolBarHelper::title($title . ' [ ' . JText::_('COM_CWTRAFFIC_TITLE_CPANEL') . ' ]', 'cogs');
        
        if ($canDo->get('core.admin')) {
            JToolBarHelper::preferences('com_coalawebtraffic');
        }

        $help_url = 'https://coalaweb.com/support/documentation/item/coalaweb-traffic-guide';
        JToolBarHelper::help('COM_CWTRAFFIC_TITLE_HELP', false, $help_url);

    }

}
