<?php

class PluginCategories_HookAdmincategories extends Hook {


    public function RegisterHook() {
        $this->AddHook('template_admin_menu_item', 'manageCategoriesInject',__CLASS__);
    }

    public function manageCategoriesInject(){
        return $this->Viewer_Fetch(Plugin::GetTemplatePath('categories').'menu.admin_item.tpl');
    }
	
}
?>
