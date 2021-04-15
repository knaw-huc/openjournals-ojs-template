<?php
import('lib.pkp.classes.plugins.ThemePlugin');
class OjnlThemePlugin extends ThemePlugin {


    /**
     * Load the custom styles for our theme
     * @return null
     */
     public function init() {
         $this->addStyle('stylesheet', 'css/style.css');

       	$this->addOption('baseColour', 'FieldColor', [
       		'label' => __('plugins.themes.ojn.option.colour.label'),
       		'description' => __('plugins.themes.ojn.option.colour.description'),
       		'default' => '#1E6292',
       	]);

        $this->addOption('headerTextColor', 'FieldOptions', [
          'type' => 'radio',
          'label' => __('plugins.themes.ojn.headerTextColor.label'),
          'description' => __('plugins.themes.ojn.headerTextColor.description'),
          'options' => [
      			[
      				'value' => 'white',
      				'label' => __('plugins.themes.default.option.headerTextColor.white'),
      			],
      			[
      				'value' => 'black',
      				'label' => __('plugins.themes.default.option.headerTextColor.black'),
      			],
      		],
          'default' => 'white',
        ]);



        $this->addOption('twitter', 'FieldText', [
          'label' => __('plugins.themes.ojn.twitter.label'),
          'description' => __('plugins.themes.ojn.twitter.description'),
          'default' => '',
        ]);

        $this->addOption('facebook', 'FieldText', [
          'label' => __('plugins.themes.ojn.fb.label'),
          'description' => __('plugins.themes.ojn.fb.description'),
          'default' => '',
        ]);

        $this->addOption('linkedin', 'FieldText', [
          'label' => __('plugins.themes.ojn.linkedin.label'),
          'description' => __('plugins.themes.ojn.linkedin.description'),
          'default' => '',
        ]);

        $this->addOption('becomeReviewer', 'FieldOptions', [
          'type' => 'checkbox',
          'label' => __('plugins.themes.ojn.becomeReviewer.label'),
          'description' => __('plugins.themes.ojn.becomeReviewer.description'),
          'options' => [
            [
              'value' => true,
              'label' => __('plugins.themes.default.option.becomeReviewer.true'),
            ],
          ],
          'default' => false,
        ]);

        $this->addOption('customThumbnail', 'FieldOptions', [
          'type' => 'checkbox',
          'label' => __('plugins.themes.ojn.customThumbnail.label'),
          'description' => __('plugins.themes.ojn.customThumbnail.description'),
          'options' => [
            [
              'value' => true,
              'label' => __('plugins.themes.default.option.customThumbnail.true'),
            ],
          ],
          'default' => false,
        ]);


         $this->addMenuArea(array('primary', 'user'));

         HookRegistry::register('TemplateManager::display', array($this, 'loadAdditionalData'));
     }

    /**
     * Get the display name of this theme
     * @return string
     */
    function getDisplayName() {
        return __('plugins.themes.ojns.name');
    }

    /**
     * Get the description of this plugin
     * @return string
     */
    function getDescription() {
        return __('plugins.themes.ojns.description');
    }


    public function loadAdditionalData($hookName, $args) {
  		$smarty = $args[0];

  		$request = $this->getRequest();
  		$context = $request->getContext();

  		if (!defined('SESSION_DISABLE_INIT')) {

  			// Get possible locales
  			if ($context) {
  				$locales = $context->getSupportedLocaleNames();
          //$locales = $context->getSite()->getLocalizedAcronym();
  			} else {
  				$locales = $request->getSite()->getSupportedLocaleNames();
          //$locales = $request->getSite()->getLocalizedAcronym();
  			}

  			//$orcidImageUrl = $this->getPluginPath() . '/' . ORCID_IMAGE_URL;

  			$smarty->assign(array(
  				'languageToggleLocales' => $locales,
  				//'orcidImageUrl' =>  $orcidImageUrl,
  			));
  		}
  	}


}
