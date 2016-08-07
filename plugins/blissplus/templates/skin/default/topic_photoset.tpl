
<!-- Fotorama -->

{assign var=iPhotosCount value=$oTopic->getPhotosetCount()}

{assign var=aPhotos value=$oTopic->getPhotosetPhotos(0, $oConfig->get('module.topic.photoset.per_page'))}
{if count($aPhotos)}
    <div class="fotorama" data-width="700" data-ratio="700/467" data-max-width="100%">
        <a name="photoset"></a>

        {foreach from=$aPhotos item=oPhoto}
            <img src="{$oPhoto->getWebPath(1000)}" alt="{$oPhoto->getDescription()}" title="{$oPhoto->getDescription()}" >
        {/foreach}
    </div>
{/if}

