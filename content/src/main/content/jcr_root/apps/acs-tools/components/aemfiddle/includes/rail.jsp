<%--
  #%L
  ACS AEM Tools Package
  %%
  Copyright (C) 2013 Adobe
  %%
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
       http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  #L%
  --%>
<%@include file="/libs/foundation/global.jsp" %><%
%><%@page session="false"%>

<%-- Rail --%>

<div class="js-endor-navrail endor-Page-sidepanel endor-Page-sidepanel--navigation endor-Page-sidepanel--right coral--dark is-closed" role="complementary">
    <div class="coral-ColumnView coral-ColumnView--navigation">
        
        <%-- Title --%>
        <section class="coral-ColumnView-column is-active">
            <div class="coral-ColumnView-item">
                <span ng-class="data.myfiddles.list.length < 1 ? 'empty' : ''"
                    class="myfiddles-count endor-Badge">{{data.myfiddles.list.length}}</span>
                <h4 acs-coral-heading>My Fiddles</h4>
            </div>
            
            <%-- Controls --%>
            <div class="coral-ColumnView-item">
                <a href="#update"
                    ng-disabled="!data.myfiddles.current || data.ui.myfiddles.createFiddle.visible"
                    ng-click="myfiddles.update(data.myfiddles.current)"
                    class="icon-link"
                    title="Update"><i class="coral-Icon coral-Icon--download"></i></a>

                <span class="divider"></span>

                <a href="#create"
                    ng-disabled="data.ui.myfiddles.createFiddle.visible"
                    ng-click="ui.showCreateFiddle()"
                    class="icon-link"
                    title="Create"><i class="coral-Icon coral-Icon--add"></i></a>
            </div>

            <%-- Create Fiddle Form --%>
            <div class="coral-ColumnView-item create-fiddle" ng-show="data.ui.myfiddles.createFiddle.visible">
                <h4 acs-coral-heading>Save code as new Fiddle?</h4>
    
                <div class="fields">
                    <label>Name:</label>
                    <input ng-model="data.myfiddles.new.title" type="text" class="coral-Textfield"/>
                </div>
    
                <div class="footer">
                    <button ng-click="ui.hideCreateFiddle()"
                       class="coral-Button"
                       role="button"
                       href="#cancel-create">Cancel</button>
    
                    <button ng-click="myfiddles.create('<%= myFiddlesPath %>')"
                       class="coral-Button coral-Button--primary"
                       role="button"
                       href="#confirm-create">Save</button>
                </div>
            </div>

            <%-- My Fiddles List --%>
            <div class="coral-ColumnView-item myfiddles"
                ng-repeat="fiddle in data.myfiddles.list"
                ng-class="fiddle.active ? 'active' : ''">

                <a ng-click="myfiddles.delete(fiddle)"
                   class="delete-button"
                   href="#delete"><i class="coral-Icon coral-Icon--close"></i></a>

                <a ng-click="myfiddles.load(fiddle)"
                   href="#load">{{fiddle.title}}<span class="script-extension">.{{fiddle.scriptExt}}</span></a>

            </div>
            <div class="coral-Columnview-item" ng-hide="data.myfiddles.list.length > 0">
                <br/><br/>
                <div class="greyText" style="text-align:center">No Saved Fiddles</div>

            </div>
        </section>
    </div>
</div>
<%-- End Rail --%>