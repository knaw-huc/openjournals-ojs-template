<?php
import('lib.pkp.classes.plugins.ThemePlugin');
class OpenjournalsThemePlugin extends ThemePlugin {

    /**
     * Get the display name of this theme
     * @return string
     */
    function getDisplayName() {
        return __('plugins.themes.openjournals.name');
    }

    /**
     * Get the description of this plugin
     * @return string
     */
    function getDescription() {
        return __('plugins.themes.openjournals.description');
    }

    public function init() {
        $this->addStyle('stylesheet', 'styles/index.less');

      	$this->addOption('baseColour', 'FieldColor', [
      		'label' => __('plugins.themes.openjournals.option.colour.label'),
      		'description' => __('plugins.themes.openjournals.option.colour.description'),
      		'default' => '#1E6292',
      	]);
    }


    // public function init() {
    // 	$this->addOption('baseColour', 'FieldColor', [
    // 		'label' => __('plugins.themes.openjournals.option.colour.label'),
    // 		'description' => __('plugins.themes.openjournals.option.colour.description'),
    // 		'default' => '#1E6292',
    // 	]);
    // }

}
?>
