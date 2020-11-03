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
        $this->addStyle('stylesheet', 'css/style.css');

      	$this->addOption('baseColour', 'FieldColor', [
      		'label' => __('plugins.themes.openjournals.option.colour.label'),
      		'description' => __('plugins.themes.openjournals.option.colour.description'),
      		'default' => '#1E6292',
      	]);

        $this->addMenuArea(array('primary', 'user'));
    }







    public function loadAdditionalData($hookName, $args) {
      $smarty = $args[0];

      $request = $this->getRequest();
      $context = $request->getContext();

      if (!defined('SESSION_DISABLE_INIT')) {

        // Get possible locales
        if ($context) {
          $locales = $context->getSupportedLocaleNames();
        } else {
          $locales = $request->getSite()->getSupportedLocaleNames();
        }

        $orcidImageUrl = $this->getPluginPath() . '/' . ORCID_IMAGE_URL;

        $smarty->assign(array(
          'languageToggleLocales' => $locales,
          'orcidImageUrl' =>  $orcidImageUrl,
        ));
      }
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
