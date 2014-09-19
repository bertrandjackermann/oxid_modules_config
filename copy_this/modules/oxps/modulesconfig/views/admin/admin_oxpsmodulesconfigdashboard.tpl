[{assign var="aModules" value=$oView->getModulesList()}]
[{assign var="aSettings" value=$oView->getSettingsList()}]
[{assign var="sAction" value=$oView->getAction()}]
[{assign var="aErrors" value=$oView->getErrors()}]
[{include file="headitem.tpl" title="OXPS_MODULESCONFIG_DASHBOARD"|oxmultilangassign}]
[{oxstyle include=$oViewConf->getModuleUrl('oxps/modulesconfig', 'out/src/css/admin_oxpsmodulesconfig.css')}]
[{oxstyle}]
[{oxscript add="function selectAllModules(blIsSelected) {
        var oModulesSelect = document.getElementById('oxpsmodulesconfig_modules');
        for (var i=0; i<oModulesSelect.options.length; i++) {
            oModulesSelect.options[i].selected = blIsSelected;
        }
    }"}]
<table cellspacing="0" cellpadding="0" border="0" width="98%" xmlns="http://www.w3.org/1999/html"
       xmlns="http://www.w3.org/1999/html">
    <tr>
        <th valign="top" class="edittext">
            <h1>[{oxmultilang ident="OXPS_MODULESCONFIG_DASHBOARD"}]</h1>
        </th>
    </tr>
    <tr>
        <td valign="top" class="edittext" align="left">
            [{if $aErrors}]
            <div class="errorbox">
                <ul>
                    [{foreach from=$aErrors item="sErrorCode"}]
                    <li>[{oxmultilang ident=$sErrorCode}]</li>
                    [{/foreach}]
                </ul>
            </div>
            [{/if}]
            [{if $aModules}]
            <form method="post" id="oxpsmodulesconfig" enctype="multipart/form-data"
                  action="[{$oViewConf->getSelfLink()}]cl=admin_oxpsmodulesconfigdashboard&fnc=actionSubmit">
                <div>
                    <label for="oxpsmodulesconfig_modules">
                        [{oxmultilang ident="OXPS_MODULESCONFIG_MODULES"}]&nbsp;
                        [{oxinputhelp ident="OXPS_MODULESCONFIG_MODULES_HELP"}]
                    </label>
                    <select id="oxpsmodulesconfig_modules" name="oxpsmodulesconfig_modules[]" multiple="multiple"
                            size="10">
                        [{foreach from=$aModules key="sModuleId" item="oModule"}]
                    <option value="[{$sModuleId}]"
                        [{if $oModule->isActive()}]class="active"[{/if}]>[{$oModule->getTitle()}]</option>
                        [{/foreach}]
                    </select>
                    <span onclick="selectAllModules(true);">[{oxmultilang ident="OXPS_MODULESCONFIG_ALL"}]</span>
                    <span onclick="selectAllModules(false);">[{oxmultilang ident="OXPS_MODULESCONFIG_NONE"}]</span>
                </div>
                <div>
                    <label>
                        [{oxmultilang ident="OXPS_MODULESCONFIG_SETTINGS"}]&nbsp;
                        [{oxinputhelp ident="OXPS_MODULESCONFIG_SETTINGS_HELP"}]
                    </label>
                    [{foreach from=$aSettings key="sSettingName" item="sSettingLabel"}]
                    <label for="oxpsmodulesconfig_setting_[{$sSettingName}]">
                        <input type="checkbox" id="oxpsmodulesconfig_setting_[{$sSettingName}]"
                               name="oxpsmodulesconfig_settings[[{$sSettingName}]]" value="1" checked=""/>
                        [{oxmultilang ident=$sSettingLabel}]
                    </label>
                    [{/foreach}]
                    <hr/>
                </div>
                <div>
                    <input type="submit" name="oxpsmodulesconfig_export"
                           value="[{oxmultilang ident="OXPS_MODULESCONFIG_EXPORT"}]"/>&nbsp;
                    [{oxinputhelp ident="OXPS_MODULESCONFIG_EXPORT_HELP"}]
                    <hr/>
                </div>
                <div>
                    <input type="submit" name="oxpsmodulesconfig_backup"
                           value="[{oxmultilang ident="OXPS_MODULESCONFIG_BACKUP"}]"/>&nbsp;
                    [{oxinputhelp ident="OXPS_MODULESCONFIG_BACKUP_HELP"}]
                    <hr/>
                </div>
                <div>
                    <label>
                        [{oxmultilang ident="OXPS_MODULESCONFIG_FILE"}]&nbsp;
                        [{oxinputhelp ident="OXPS_MODULESCONFIG_FILE_HELP"}]
                    </label>
                    <input type="file" name="oxpsmodulesconfig_file" accept="application/json"/>
                </div>
                <div>
                    <input type="submit" name="oxpsmodulesconfig_import"
                           value="[{oxmultilang ident="OXPS_MODULESCONFIG_IMPORT"}]"/>&nbsp;
                    [{oxinputhelp ident="OXPS_MODULESCONFIG_IMPORT_HELP"}]
                </div>
            </form>
            [{else}]
            <p>[{oxmultilang ident="OXPS_MODULESCONFIG_NO_MODULES"}]</p>
            [{/if}]
        </td>
    </tr>
</table>
[{include file="bottomitem.tpl"}]
